import 'package:flutter/material.dart';
import 'package:quiz/screens/category_detail_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quiz/constants/parser.function.dart';

class ResultsPage extends StatelessWidget {
  final int score;
  final dynamic category;

  ResultsPage({required this.score, required this.category});

  Future<int> getTopScore() async {
    int topScoreForCategory = await getTopScoreForCategory(category['id']);
    return topScoreForCategory;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: FutureBuilder<int>(
        future: getTopScore(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final topScore = snapshot.data ?? 0;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your Score',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  '$score',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 16),
                Text(
                  'Top Score: $topScore',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context,
                        ModalRoute.withName(Navigator.defaultRouteName));
                  },
                  child: Text('Return to Home'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryDetailPage(
                          category: category,
                        ),
                      ),
                    );
                  },
                  child: Text('Retry Quiz'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
