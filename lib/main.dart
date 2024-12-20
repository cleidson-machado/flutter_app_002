import 'package:flutter/material.dart';
import 'package:flutter_app_002/api_env/api_enviroment.dart';
import 'package:flutter_app_002/app/childcare_vacancy_finder_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

//THIS GUY DEFINES THE START OF PROJECT..
//HOW TO CREATE REUSABLE COMPONENTS FOR A FLUTTER APP..??
//THE BETTER WAY TO CREATE FOLDER ORGANIZATIONS AND OTHER USEFUL STUFF..??

Future<void> main() async {
  await dotenv.load(fileName: ApiEnviroment.fileName);
  runApp(const ChildcareVacancyFinderApp());
}
