import 'package:simple_todo/database.dart';
import 'package:flutter/material.dart';
import 'package:simple_todo/screen/home_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final database = LocalDatabase();
  GetIt.I.registerSingleton<LocalDatabase>(database);

  initializeDateFormatting().then((_) => runApp(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: ((context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
              child: child!,
            );
          }),
          home: const HomeScreen(),
        ),
      ));
}
