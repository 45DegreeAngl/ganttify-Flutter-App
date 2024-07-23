import 'package:http/http.dart' as http;
import 'dart:convert';

class GlobalData {
  static int userId=0;
  static String firstName="";
  static String userName="";
  static String password="";
  static String email="";
  static String phone="";
}

class UserData{
  static Future<String> getJson(String url, String outgoing) async {
    String ret = "";
    try
    {
      Uri newUri = Uri.parse(url);
      http.Response response = await http.post(newUri,
          body: utf8.encode(outgoing),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
          },
          encoding: Encoding.getByName("utf-8")
      );
      ret = response.body;
      //print(ret.toString());
    }
    catch (e) {
      print(e.toString());
    }
    return ret;
  }
}




