import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz/constants/parser.function.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'result_screen.dart';

class QuizPage extends StatefulWidget {
  final dynamic category;
  final int questionCount;
  final String difficulty;
  final VoidCallback toggleTheme;
  final Function(String) changeLanguage;

  QuizPage({
    required this.category,
    required this.questionCount,
    required this.difficulty,
    required this.toggleTheme,
    required this.changeLanguage,
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
        'https://opentdb.com/api.php?amount=${widget.questionCount}&category=${widget.category['id']}&difficulty=${widget.difficulty.toLowerCase()}';
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
    String key = 'top_score_category_${widget.category['id']}';

    final previousTopScore = prefs.getInt(key) ?? 0;

    if (score > previousTopScore) {
      await prefs.setInt(key, score);
    }
  }

  void showResults() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(
            score: score,
            category: widget.category,
            toggleTheme: widget.toggleTheme,
            changeLanguage: widget.changeLanguage),
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
      body: SizedBox(
        width: double.infinity,
        child: Padding(
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
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          backgroundColor:
                              Colors.blue.shade900, // Background color
                          foregroundColor: Colors.white, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(4), // Rounded corners
                          ),
                          elevation: 4, // Shadow effect
                        ),
                        onPressed: () {
                          if (option == currentQuestion['correct_answer']) {
                            score++;
                          }
                          nextQuestion();
                        },
                        child: Text(
                          decodeHtmlEntities(option),
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              Spacer(),
              LinearProgressIndicator(
                value: timeLeft / 20, // Assuming 20 seconds as total time
                backgroundColor: Colors.grey[300],
                valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.orange.shade400),
                minHeight: 8,
              ),
              SizedBox(height: 8),
              Text(
                'Time Left: $timeLeft seconds',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
