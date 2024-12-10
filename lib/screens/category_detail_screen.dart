import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz/screens/quiz_screen.dart';
import 'package:quiz/constants/parser.function.dart';

import 'package:http/http.dart' as http;

class CategoryDetailPage extends StatefulWidget {
  final dynamic category;

  CategoryDetailPage({required this.category});

  @override
  _CategoryDetailPageState createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  Map<String, dynamic>? categoryDetails;
  bool isLoading = true;
  final TextEditingController _questionCountController =
      TextEditingController(text: '10');
  String _selectedDifficulty = 'Easy';
  int topScoreForCategory = 0;

  @override
  void initState() {
    super.initState();
    fetchCategoryDetails(widget.category['id']);
  }

  Future<void> fetchCategoryDetails(int categoryId) async {
    final response = await http.get(
        Uri.parse('https://opentdb.com/api_count.php?category=$categoryId'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        categoryDetails = data['category_question_count'];
        loadTopScore(categoryId);
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> loadTopScore(id) async {
    topScoreForCategory = await getTopScoreForCategory(widget.category['id']);

    setState(() {}); // Trigger a UI update
  }

  void startQuiz() {
    final questionCount = int.tryParse(_questionCountController.text) ?? 10;
    final difficulty = _selectedDifficulty;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizPage(
          category: widget.category,
          questionCount: questionCount,
          difficulty: difficulty,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category['name']),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.category['name'],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Category ID: ${widget.category['id']}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  if (categoryDetails != null) ...[
                    Text(
                      'Total Questions: ${categoryDetails!['total_question_count']}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Easy Questions: ${categoryDetails!['total_easy_question_count']}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Medium Questions: ${categoryDetails!['total_medium_question_count']}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Hard Questions: ${categoryDetails!['total_hard_question_count']}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Top score: ${topScoreForCategory}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                  SizedBox(height: 16),
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _questionCountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Number of Questions',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _selectedDifficulty,
                    decoration: InputDecoration(
                      labelText: 'Select Difficulty',
                      border: OutlineInputBorder(),
                    ),
                    items: ['Easy', 'Medium', 'Hard'].map((difficulty) {
                      return DropdownMenuItem(
                        value: difficulty,
                        child: Text(difficulty),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedDifficulty = value!;
                      });
                    },
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: startQuiz,
                    child: Text('Start Quiz'),
                  ),
                ],
              ),
            ),
    );
  }
}
