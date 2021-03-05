import 'package:flutter/material.dart';
import 'package:news_app/views/homepage.dart';

void main() => runApp(MaterialApp(

  initialRoute: '/',
  routes: {

    '/': (context) => HomePage()
  },
));


