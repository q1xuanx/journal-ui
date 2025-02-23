import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 246, 239, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 246, 239, 1),
        actions: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.menu,
              color: Color.fromRGBO(116, 76, 76, 100),
              size: 35.0,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 5.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Welcome \nback!',
                style: TextStyle(
                    fontSize: 44.34,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(116, 76, 76, 1)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: Image.asset('assets/images/banner.png'),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: width * 0.12),
                child: Text(
                  'Continue',
                  style: TextStyle(
                      color: Color.fromRGBO(116, 76, 76, 1),
                      fontSize: 44.34,
                      fontWeight: FontWeight.w200),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.2,
              width: width,
              child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _itemHolder('I write this for...', '22/02/2025', height, width),
                        _itemHolder('This is the journey...', '17/02/2025', height, width),
                      ],
                    ),
                  )),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Text('or Start a new one', style: TextStyle(fontSize: 40, color: Color.fromRGBO(116, 76, 76, 1), fontWeight: FontWeight.bold,),)
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.02),
              child: Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add, color: Colors.white,), backgroundColor: Color.fromRGBO(116, 76, 76, 1),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Padding _itemHolder(String title, String time, double height, double width) => Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Card(
          color: Color.fromRGBO(240, 240, 230, 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: SizedBox(
            width: height * 0.25,
            height: width * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Color.fromRGBO(116, 76, 76, 1),
                        fontSize: 16.0),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, top: 10.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(time,
                        style: TextStyle(
                            color: Color.fromRGBO(116, 76, 76, 1),
                            fontSize: 14.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
