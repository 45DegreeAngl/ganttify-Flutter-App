import 'package:flutter/material.dart';
import 'package:ganttifytwo/utils/getAPI.dart';
import 'dart:convert';


class CardsScreen extends StatefulWidget {
  @override
  _CardsScreenState createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDDC87),
      appBar: AppBar(
        title: const Text('To Do List',style: TextStyle(fontSize: 24 ,color:Colors.white)),
        backgroundColor: Color(0xFFDC6B2C),
        actions: <Widget>[
          Container(
            width: 200,
            height : 300,
            child:
            Image.asset('assets/Logo.png'),
          ),
        ],
      ),
      body: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  get card => null;

  @override
  void initState() {
    super.initState();
  }

  String message = '', newMessageText = '';
  String addMessage = '', newAddMessage = '';
  String searchMessage = '', newSearchMessage = '';

  void changeText() {
    setState(() {
      message = newMessageText;
    });
  }

  void changeAddText() {
    setState(() {
      addMessage = newAddMessage;
    });
  }

  void changeSearchText() {
    setState(() {
      searchMessage = newSearchMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child:
        SingleChildScrollView(
        child:

        Container(
        width: 400,
        alignment: Alignment.center,
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //Center Column contents vertically,
          crossAxisAlignment: CrossAxisAlignment.center,
          //Center Column contents horizontal
          children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                  children: <Widget>[

                  ]
              ),
            ]
        ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[],
                ),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //ElevatedButton(
                //    child: Text('Return To Login',style: TextStyle(fontSize: 14 ,color:Colors.white)),
                //    onPressed: () async
                //    {
                //      Navigator.pushNamed(context, '/login');
                //    },
                //    style:ElevatedButton.styleFrom(
                //     backgroundColor: Color(0xFF135C91),
                //     foregroundColor: Colors.white, // Text color
                //      padding: EdgeInsets.all(2.0), // Padding around the child
                //      splashFactory: InkRipple.splashFactory, // Splash effect
                //    )
                //)
              ]
            )
          ],
        )
    ),
    )
    );
  }
}