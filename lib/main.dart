import 'package:flutter/material.dart';
import 'package:flutter_news_app/MainScreen.dart';
import 'package:flutter_news_app/newsClass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/scheduler.dart';

/*
@RAN OREL BEN DAVID@

This is the main page!

After loading is completed =>
  GO TO:
  MainScreen.dart

  While loading - the loading screen is displayed!

 */

void main() => runApp(MaterialApp(
      title: "",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  static List<NewsClass> newsClass;

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var url =
      "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=????????????";

  NewsHub newsHub;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);
    newsHub = NewsHub.fromJson(decodedJson);
    print(newsHub.toJson());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: newsHub == null
          //On loading..
          ? Container(
              decoration: new BoxDecoration(color: HexColor("1E1E1E")),
              child: new Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: imageIcon("asset/news_icon.png"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 00.0),
                            child: imageIcon("asset/news_text_icon.png"),
                          ),
                        ],
                      )
                    ]),
              ),
            )

          //Finish loading => newsHub.newsClass
          : onLoadingDone(),
    );
  }

  Widget imageIcon(String asset) {
    return Image.asset(
      asset,
      height: 100,
      width: 100,
    );
  }

  onLoadingDone() {
    if (newsHub != null) {
      HomePage.newsClass = newsHub.newsClass;
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(new MaterialPageRoute(
            builder: (BuildContext context) => MainScreen(newsHub.newsClass)));
      });
    }
  }
}

//Hex color to.... Color!
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
