import 'package:flutter/material.dart';
import 'package:ganttifytwo/routes/routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes:Routes.getroutes,
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override

  Widget build(BuildContext context) {
    return Container(
        child:
        ElevatedButton(
          child: Text('Do Login',style: TextStyle(fontSize: 14 ,color:Colors.black)),
          onPressed: () async
          {
            Navigator.pushNamed(context, '/cards');
          },
          style:ElevatedButton.styleFrom(
            backgroundColor: Colors.brown,
            foregroundColor: Colors.black, // Text color
            padding: EdgeInsets.all(2.0), // Padding around the child
            splashFactory: InkRipple.splashFactory, // Splash effect
          ),
        ),
    );
  }
}

