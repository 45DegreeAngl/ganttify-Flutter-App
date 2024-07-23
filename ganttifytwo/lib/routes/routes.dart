import 'package:flutter/material.dart';

import 'package:ganttifytwo/screens/LoginScreen.dart';

import 'package:ganttifytwo/screens/CardsScreen.dart';

import 'package:ganttifytwo/screens/RegisterScreen.dart';

import 'package:ganttifytwo/screens/ResetScreen.dart';

import 'package:ganttifytwo/screens/RedirectScreen.dart';


class Routes {

  static const String LOGINSCREEN = '/login';

  static const String CARDSSCREEN = '/cards';

  static const String REGISTERSCREEN = '/register';

  static const String RESETSCREEN = '/reset';

  static const String REDIRECTSCREEN = '/redirect';

  // routes of pages in the app

  static Map<String, Widget Function(BuildContext)> get getroutes => {

    '/': (context) => LoginScreen(),

    LOGINSCREEN: (context) => LoginScreen(),

    CARDSSCREEN: (context) => CardsScreen(),

    REGISTERSCREEN: (context) => RegisterScreen(),

    RESETSCREEN: (context) => ResetScreen(),

    REDIRECTSCREEN: (context) => RedirectScreen(),

  };

}