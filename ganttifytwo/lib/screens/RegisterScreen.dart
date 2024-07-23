import 'package:flutter/material.dart';
import 'package:ganttifytwo/utils/getAPI.dart';
import 'dart:convert';

double font_size = 20;


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
  String Name_text = 'Name *', newName_text = 'Name *';
  String Phone_number = 'Phone Number',newPhone_number='Phone Number';
  String Email_text = 'Email *',newEmail_text = 'Email *';
  String Username_text = 'Username *',newUsername_text = 'Username *';
  String Password_text = 'Password *',newPassword_text = 'Password *';
  String RePassword_text = 'Re-Enter Password *',newRePassword_text ='Re-Enter Password *';

  void changeText() {
    setState(() {
      message = newMessageText;
      Name_text = newName_text;
      Phone_number = newPhone_number;
      Email_text = newEmail_text;
      Username_text = newUsername_text;
      Password_text = newPassword_text;
      RePassword_text = newRePassword_text;
    });
  }
  String name = '' ,email = '',username = '', phone='', password = '', password2 = '';
  RegExp validEmail = RegExp(r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$'), hasLower = RegExp(r'[a-z]+'),
      hasUpper = RegExp(r'[A-Z]+'),hasSymbol = RegExp(r'[^a-zA-Z0-9\s]+'),
      hasNumber = RegExp(r'[0-9]+'), validPhone = RegExp(r'^(?:[+0]9)?[0-9]{10}$'), hasMinChar = RegExp(r'^.{8,}$');

  bool validPassword(String password){
    return (hasLower.hasMatch(password) && hasNumber.hasMatch(password) && hasSymbol.hasMatch(password) && hasUpper.hasMatch(password) && hasMinChar.hasMatch(password) || password=='');
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
                  const Text('* Indicates a Required Field',style: TextStyle(fontSize: 15 ,color:Colors.black,fontWeight: FontWeight.bold)),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 200,
                  child:
                  Text(Name_text,style: TextStyle(fontSize: font_size ,color:Colors.black)),
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
                        name=text;
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                          hintText: 'Enter Your Name'
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
                  Text(Phone_number,style: TextStyle(fontSize: font_size ,color:Colors.black)),
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
                        phone=text;
                        phone = phone.replaceAll(RegExp(r'[^\w\s]+'), '');
                        if(!validPhone.hasMatch(phone) && phone!=''){
                          newPhone_number = "Phone : Invalid";
                          changeText();
                        }
                        else{
                          newPhone_number = "Phone Number";
                          changeText();
                        }
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: 'Phone',
                          hintText: '(###) ###-####'
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
                Container(
                  width: 200,
                  child:
                  Text(Username_text,style: TextStyle(fontSize: font_size ,color:Colors.black)),
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
                        username=text;
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                          hintText: 'Enter Your Username'
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
                  Text(Password_text,style: TextStyle(fontSize: font_size ,color:Colors.black)),
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
                        if(!validPassword(password)){
                          newMessageText = "";
                          newPassword_text = "Password * : Invalid";
                        }
                        if(!hasLower.hasMatch(password)){
                          newMessageText = newMessageText+"Missing lower case character, ";
                        }
                        if(!hasNumber.hasMatch(password)){
                          newMessageText = newMessageText+"Missing number, ";
                        }
                        if(!hasSymbol.hasMatch(password)){
                          newMessageText = newMessageText+"Missing symbol, ";
                        }
                        if(!hasUpper.hasMatch(password)){
                          newMessageText = newMessageText+"Missing upper case character, ";
                        }
                        if(!hasMinChar.hasMatch(password)){
                          newMessageText = newMessageText+"Password must be 8 characters long";
                        }
                        if(validPassword(password) || password==''){
                          newMessageText = "";
                          newPassword_text = "Password *";
                        }
                        changeText();
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
                Container(
                  width: 200,
                  child:
                  Text(RePassword_text,style: TextStyle(fontSize: font_size ,color:Colors.black)),
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
                        password2=text;
                        if(password2!=password){
                          newRePassword_text = "Passwords Must Match";
                          changeText();
                        }
                        else{
                          newRePassword_text = "Re-Enter Password *";
                          changeText();
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: 'Password - Again',
                          hintText: 'Re-enter Your Password'
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
                    child: Text('Register',style: TextStyle(fontSize: 14 ,color:Colors.white)),
                    onPressed: () async
                    {
                      if(!validEmail.hasMatch(email) && !validPassword(password) && password!=password2 && !validPhone.hasMatch(phone)){
                        newMessageText = newMessageText + "\nNot All Fields are Valid";
                        changeText();
                        return;
                      }
                      if(name==''||email==''||phone==''||username==''||password==''||password2==''){
                        newMessageText = newMessageText + "\nSome Fields missing";
                        changeText();
                        return;
                      }
                      print(name+email+phone+username+password+password2);
                      newMessageText = "";
                      changeText();
                      String payload = '{"email":"' + email.trim() + '","name":"' + name.trim() + '","phone":"' + phone.trim() + '","password":"' + password.trim() + '","username":"' + username.trim() +'"}';

                      var jsonObject;

                      try {
                        String url = 'https://ganttify-5b581a9c8167.herokuapp.com/api/register';
                        String ret = await UserData.getJson(url, payload);
                        jsonObject = json.decode(ret);
                      }

                      catch(e) {
                        newMessageText = "Error";//e.toString();
                        changeText();
                        return;
                      }

                      if( jsonObject["error"] != "") {
                        newMessageText = jsonObject["error"];
                        changeText();
                      }
                      else {

                        Navigator.pushNamed(context, '/login');
                      }
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
