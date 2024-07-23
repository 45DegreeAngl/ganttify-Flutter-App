import 'package:flutter/material.dart';
import 'package:ganttifytwo/utils/getAPI.dart';
import 'dart:convert';

double font_size = 20;


class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
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
  String email = '';
  RegExp validEmail = RegExp(r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$');


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
                  const Text('Forgot Your Password?',style: TextStyle(fontSize: 20 ,color:Colors.black)),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 200,
                  height:50,
                  child:
                  const Text('We\'ll email a link to recover your password',style: TextStyle(fontSize: 12 ,color:Colors.black,fontWeight: FontWeight.bold)),
                )
              ],
            ),



            Row(
              children: <Widget>[
                Container(
                  width: 200,
                  child:
                  Text(Email_text,style: TextStyle(fontSize: font_size ,color:Colors.black)),
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
                        email=text;
                        if(!validEmail.hasMatch(email) && email!=''){
                          newEmail_text = "Email * : Invalid";
                          changeText();
                        }
                        else{
                          newEmail_text = "Email *";
                          changeText();
                        }
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter Your Email'
                      ),
                    ),
                  ),
                ]
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child:Text('$message',style: TextStyle(fontSize: font_size ,color:Colors.black),softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                ElevatedButton(
                    child: Text('Reset',style: TextStyle(fontSize: 14 ,color:Colors.white)),
                    onPressed: () async
                    {
                      if(!validEmail.hasMatch(email)){
                        newMessageText = newMessageText + "\nNot All Fields are Valid";
                        changeText();
                        return;
                      }
                      if(email==''){
                        newMessageText = newMessageText + "\nSome Fields missing";
                        changeText();
                        return;
                      }
                      print(email);
                      newMessageText = "";
                      changeText();
                      String payload = '{"email":"' + email.trim() +'"}';

                      var jsonObject;

                      try {
                        String url = 'https://ganttify-5b581a9c8167.herokuapp.com/api/forgot-password';
                        String ret = await UserData.getJson(url, payload);
                        jsonObject = json.decode(ret);

                      }

                      catch(e) {
                        newMessageText = "Error";//e.toString();
                        changeText();
                        return;
                      }
                      //if( jsonObject["error"] != "") {
                      //  newMessageText = jsonObject["error"];
                      //  changeText();
                      //}
                      //else {
                      //  print('AHHHHHHHHHHHHHHHHHHHH');
                      Navigator.pushNamed(context, '/redirect');
                      //}


                    },
                    style:ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFDC6B2C),
                      foregroundColor: Colors.white, // Text color
                      padding: EdgeInsets.all(2.0), // Padding around the child
                      splashFactory: InkRipple.splashFactory, // Splash effect
                    )
                ),
                ElevatedButton(
                    child: Text('Return To Login',style: TextStyle(fontSize: 14 ,color:Colors.white)),
                    onPressed: () async
                    {
                      Navigator.pushNamed(context, '/login');
                    },
                    style:ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF135C91),
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


