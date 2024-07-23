import 'package:flutter/material.dart';
import 'package:ganttifytwo/utils/getAPI.dart';
import 'dart:convert';

double button_size = 200.0;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

  void changeText() {

    setState(() {
      message = newMessageText;
    });

  }
  String loginName = '', password = '';




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
                  Text('Welcome to Ganttify',style: TextStyle(fontSize: 20 ,color:Colors.black,fontWeight: FontWeight.bold)),
                )
              ]
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 200,
                  child:
                  Text('Email',style: TextStyle(fontSize: 14 ,color:Colors.black,fontWeight: FontWeight.bold)),
                )
              ],
            ),
            Row(
                children: <Widget>[
                  Container(
                    width: 200,
                    child:
                    TextField (
                      onChanged:(text){
                        loginName=text;
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: 'Login Email',
                          hintText: 'Enter Your Email'
                      ),
                    ),
                  ),
                ]
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 200,
                  child:
                  Text('Password',style: TextStyle(fontSize: 14 ,color:Colors.black,fontWeight: FontWeight.bold)),
                )
              ],
            ),
            Row(
                children: <Widget>[
                  Container(
                    width: 200,
                    child:
                    TextField (
                      onChanged:(text){
                        password=text;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter Your Password'
                      ),
                    ),
                  ),
                ]
            ),
            Row(
              children: <Widget>[
                Text('$message',style: TextStyle(fontSize: 14 ,color:Colors.black),softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    child: Text('Login',style: TextStyle(fontSize: 14 ,color:Colors.white)),
                    onPressed: () async
                    {
                      newMessageText = "";
                      changeText();
                      String payload = '{"email":"' + loginName.trim() + '","password":"' + password.trim() + '"}';

                      var jsonObject;

                      try {
                        String url = 'https://ganttify-5b581a9c8167.herokuapp.com/api/login';
                        String ret = await UserData.getJson(url, payload);
                        jsonObject = json.decode(ret);
                      }

                      catch(e) {
                        newMessageText = "Wrong";//e.toString();
                        changeText();
                        return;
                      }

                      if( jsonObject["error"] != "") {
                        newMessageText = "Incorrect Login/Password";
                        changeText();
                      }
                      else {
                        //print(jsonObject["_id"]);
                        print(jsonObject["name"]);
                        print(loginName);
                        print(password);
                        print(jsonObject["email"]);
                        print(jsonObject["phone"]);

                        //GlobalData.userId = jsonObject["_id"];
                        GlobalData.firstName = jsonObject["name"];
                        GlobalData.userName = loginName;
                        GlobalData.password = password;
                        GlobalData.email = jsonObject["email"];
                        GlobalData.phone = jsonObject["phone"];

                        //this goes to the register page, login shouldnt lead to register
                        Navigator.pushNamed(context, '/cards');
                      }
                    },
                    style:ElevatedButton.styleFrom(
                      minimumSize: Size(100,50),
                      backgroundColor: Color(0xFFDC6B2C),
                      foregroundColor: Colors.white, // Text color
                      padding: EdgeInsets.all(2.0), // Padding around the child
                      splashFactory: InkRipple.splashFactory, // Splash effect
                    )
                ),
              ]
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: 120,
                      child:
                      const Text('Forgot Password?',style: TextStyle(fontSize: 14 ,color:Colors.black,fontWeight: FontWeight.bold)),
                    ),
                    ElevatedButton(
                        child: Text('Reset Password',style: TextStyle(fontSize: 14 ,color:Colors.white)),
                        onPressed: () async
                        {
                          Navigator.pushNamed(context, '/reset');
                        },
                        style:ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF135C91),
                          foregroundColor: Colors.white, // Text color
                          padding: EdgeInsets.all(2.0), // Padding around the child
                          splashFactory: InkRipple.splashFactory, // Splash effect
                        )
                    ),
                  ]
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 75,
                      child:
                      const Text('New User?',style: TextStyle(fontSize: 14 ,color:Colors.black,fontWeight: FontWeight.bold)),
                    ),
                    ElevatedButton(
                      child: const Text('Register',style: TextStyle(fontSize: 14 ,color:Colors.white)),
                      onPressed: () async
                      {
                        //this goes to the register page, login shouldnt lead to register
                        Navigator.pushNamed(context, '/register');
                      },
                      style:ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF135C91),
                        foregroundColor: Colors.white, // Text color
                        padding: EdgeInsets.all(2.0), // Padding around the child
                        splashFactory: InkRipple.splashFactory, // Splash effect
                      )
                    ),
                  ]
                ),



              ],
            ),

          ],
        )
    ),
    )
    );
  }
}

