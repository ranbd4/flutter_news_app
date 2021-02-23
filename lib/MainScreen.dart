import 'package:flutter/material.dart';
import 'package:flutter_news_app/DiscoveryPage.dart';
import 'package:flutter_news_app/MainNewsPage.dart';
import 'package:flutter_news_app/main.dart';
import 'package:flutter_news_app/newsClass.dart';

/*
@RAN OREL BEN DAVID@

This is the Main Screen!

This screen displays the bottomNavigationBar,

The Default Display is: MainNewsPage.dart

 */

class MainScreen extends StatelessWidget {
  final List<NewsClass> newsClass;

  MainScreen(this.newsClass);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreenPage(newsClass,''),
    );
  }
}

class MainScreenPage extends StatefulWidget {
  final List<NewsClass> newsClass;
  final String title;


  MainScreenPage(this.newsClass, this.title);

  @override
  _MainScreenPage createState() => _MainScreenPage(newsClass);
}

class _MainScreenPage extends State<MainScreenPage> {
  _MainScreenPage(this.newsClass);

  final List<NewsClass> newsClass;

  int _selectedPage= 0;
  final _pageOptions = [
    MainNewsPage(HomePage.newsClass),
    DiscoveryPage(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: new Image.asset('asset/news_text_icon.png', fit: BoxFit.fitHeight ,height: 40,
          width: 100,
        ),
        backgroundColor:  (HexColor("1E1E1E")),
      ),
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index){
          setState(() {
            _selectedPage= index;
          });
        },// this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Image.asset('asset/home-icon.png',
              height: 45,
              width: 45,),
            title: textWithFont("Main", 18,0),
            activeIcon: new Image.asset('asset/home-icon_onclick.png',
              height: 45,
              width: 45,),
          ),
          BottomNavigationBarItem(
            icon: new Image.asset('asset/find_more_icon.png',
              height: 45,
              width: 45,),
            title: textWithFont("Discover", 18,1),
            activeIcon: new Image.asset('asset/find_more_icon_onclick.png',
              height: 45,
              width: 45,),
          ),
        ],
      ),
    );
  }

  Widget textWithFont(String text, double textSize, int pageNumber){
    Color color = HexColor("1E1E1E");
    if(_selectedPage == pageNumber){
      color = HexColor("2E6CA4");
    }
    return Text(
      '$text',
      style: new TextStyle(
        color: color,
        fontFamily: 'Rubik',
        fontSize: textSize,
      ),
      textAlign: TextAlign.center,
    );
  }

}

