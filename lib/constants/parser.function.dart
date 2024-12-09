import 'package:html/parser.dart' as html_parser;
import 'package:shared_preferences/shared_preferences.dart';

String decodeHtmlEntities(String htmlString) {
  return html_parser.parse(htmlString).documentElement?.text ?? htmlString;
}

Future<int> getTopScoreForCategory(int categoryId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String key = 'top_score_category_$categoryId';
  return prefs.getInt(key) ?? 0;
}
