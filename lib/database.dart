import 'package:dorble/Variables/list_variables.dart';
import 'package:dorble/word_database.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//ads code
//'ca-app-pub-3940256099942544/9214589741' is the test ad unit id
String testAdUnitId = 'ca-app-pub-3041741540866855/9894872786';
bool showAds = true;

class Database {
  static final database = Supabase.instance.client.from('daily_solution');

  static Map solution = {};
  static Map solution_2 = {};
  static Map solutionIndex = {};

  static Future fetchSolutions() async {
    try {
      //print('Fetching solutions from database...');
      solution = await database.select('daily_solution').single();
      answer = solution['daily_solution'];
      daily.setString('answer', answer);
      solution_2 = await database.select('daily_solution_2').single();
      answerRight = solution_2['daily_solution_2'];
      daily.setString('answerRight', answerRight);
      solutionIndex = await database.select('index').single();
      newIndex = solutionIndex['index'];
      //print('Solutions fetched: $answer and $answerRight');
    } catch (e) {
      //print('Error fetching solutions: $e');
      return null;
    }
  }
}