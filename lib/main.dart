import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:journal_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 246, 239, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 310,
            width: 330,
            margin: EdgeInsets.only(top: 10.0, left: 20.0),
            child: Text(
              'YOUR\nOWN\nTHOUGHTS',
              style: TextStyle(
                  color: Color.fromRGBO(116, 76, 76, 1),
                  fontSize: 62,
                  fontFamily: 'Spinnakers',
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: (width * 0.13)),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                child: FloatingActionButton(
                  backgroundColor: Color.fromRGBO(116, 76, 76, 1),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomePage()));
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    color: Color.fromRGBO(255, 245, 239, 1),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
            child: Container(
              alignment: Alignment.centerRight,
              child: SizedBox(
                child: Image.asset('assets/images/read_book.jpg', fit: BoxFit.cover,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
