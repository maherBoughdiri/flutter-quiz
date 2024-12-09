import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz/constants/parser.function.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'result_screen.dart';

class QuizPage extends StatefulWidget {
  final int categoryId;
  final int questionCount;
  final String difficulty;

  QuizPage({
    required this.categoryId,
    required this.questionCount,
    required this.difficulty,
  });

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<dynamic> questions = [];
  int currentQuestionIndex = 0;
  int score = 0;
  bool isLoading = true;
  int timeLeft = 20;
  Timer? timer;

  List<String> currentShuffledOptions = [];

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> fetchQuestions() async {
    final url =
        'https://opentdb.com/api.php?amount=${widget.questionCount}&category=${widget.categoryId}&difficulty=${widget.difficulty.toLowerCase()}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        questions = data['results'];
        isLoading = false;
        startTimer();
        shuffleOptions();
      });
    } else {
      print('Failed to fetch questions');
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          nextQuestion();
        }
      });
    });
  }

  void shuffleOptions() {
    final currentQuestion = questions[currentQuestionIndex];
    final options = List<String>.from(currentQuestion['incorrect_answers'])
      ..add(currentQuestion['correct_answer'])
      ..shuffle();

    setState(() {
      currentShuffledOptions = options;
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        timeLeft = 20;
        shuffleOptions();
      });
    } else {
      timer?.cancel();
      saveResultsLocally(); // Save only if the new score is higher
      showResults();
    }
  }

  Future<void> saveResultsLocally() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = 'top_score_category_${widget.categoryId}';

    final previousTopScore = prefs.getInt(key) ?? 0;

    if (score > previousTopScore) {
      await prefs.setInt(key, score);
    }
  }

  void showResults() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ResultsPage(score: score, categoryId: widget.categoryId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Quiz')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1} of ${questions.length}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              decodeHtmlEntities(currentQuestion['question']),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Column(
              children: currentShuffledOptions.map((option) {
                return ElevatedButton(
                  onPressed: () {
                    if (option == currentQuestion['correct_answer']) {
                      score++;
                    }
                    nextQuestion();
                  },
                  child: Text(decodeHtmlEntities(option)),
                );
              }).toList(),
            ),
            Spacer(),
            Text(
              'Time Left: $timeLeft seconds',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
