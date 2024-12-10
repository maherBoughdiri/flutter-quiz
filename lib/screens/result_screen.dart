import 'package:flutter/material.dart';
import 'package:quiz/screens/category_detail_screen.dart';
import 'package:quiz/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quiz/constants/parser.function.dart';
import 'package:quiz/constants/localisation.constant.dart';

class ResultsPage extends StatelessWidget {
  final int score;
  final dynamic category;
  final VoidCallback toggleTheme;
  final Function(String) changeLanguage;

  ResultsPage({
    required this.score,
    required this.category,
    required this.toggleTheme,
    required this.changeLanguage,
  });

  Future<int> getTopScore() async {
    int topScoreForCategory = await getTopScoreForCategory(category['id']);
    return topScoreForCategory;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslate(context, 'results')),
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
                  getTranslate(context, 'your_score'),
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
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(
                          toggleTheme: toggleTheme,
                          changeLanguage: changeLanguage,
                        ),
                      ),
                      (route) => false, // Remove all previous routes
                    );
                  },
                  child: Text(getTranslate(context, 'return_to_home')),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryDetailPage(
                          category: category,
                          toggleTheme: toggleTheme,
                          changeLanguage: changeLanguage,
                        ),
                      ),
                    );
                  },
                  child: Text(getTranslate(context, 'retry_quiz')),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
