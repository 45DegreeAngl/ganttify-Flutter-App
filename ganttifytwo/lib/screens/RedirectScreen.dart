import 'package:flutter/material.dart';

double font_size = 20;


class RedirectScreen extends StatefulWidget {
  @override
  _RedirectScreenState createState() => _RedirectScreenState();
}

class _RedirectScreenState extends State<RedirectScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDDC87),
      body: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //String message = "This is a message",newMessageText="";
  @override
  void initState() {
    super.initState();
  }

  String message = "", newMessageText = '';
  String Email_text = 'Email *',newEmail_text = 'Email *';

  void changeText() {
    setState(() {
      message = newMessageText;
      Email_text = newEmail_text;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Center(
        child:
        SingleChildScrollView(
            child:

            Container(
                width: 200,
                alignment: Alignment.center,
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
                  crossAxisAlignment: CrossAxisAlignment.center, //Center Column contents horizontal

                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 200,
                          height : 300,
                          child:
                          Image.asset('assets/Logo.png',fit:BoxFit.contain),
                        ),

                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 200,
                          child:
                          const Text('Recovery Email Sent!',style: TextStyle(fontSize: 20 ,color:Colors.black)),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 200,
                          height:50,
                          child:
                          const Text('Please check your inbox for a Ganttify email.',style: TextStyle(fontSize: 12 ,color:Colors.black,fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                            child: Text('Return To Login',style: TextStyle(fontSize: 14 ,color:Colors.white)),
                            onPressed: () async
                            {
                              Navigator.pushNamed(context, '/login');
                            },
                            style:ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFDC6B2C),
                              foregroundColor: Colors.white, // Text color
                              padding: EdgeInsets.all(2.0), // Padding around the child
                              splashFactory: InkRipple.splashFactory, // Splash effect
                            )
                        )
                      ],
                    ),
                  ],
                )
            )
        )
    );
  }
}


