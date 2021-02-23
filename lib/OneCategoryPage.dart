import 'package:flutter/material.dart';
import 'package:flutter_news_app/MainNewsPage.dart';
import 'package:flutter_news_app/MainScreen.dart';
import 'package:flutter_news_app/main.dart';
import 'package:flutter_news_app/newsClass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/scheduler.dart';
import 'package:flutter_news_app/WebViewNews.dart';

/*
@RAN OREL BEN DAVID@

This is the One Category page!

This screen displays all articles from a particular category.

The Card is the SAME card from the MainNewsPage.dart

On Click => WebViewNews.dart

 */

class OneCategoryPage extends StatefulWidget {
  final String url, title;

  OneCategoryPage(this.url, this.title);

  @override
  State<StatefulWidget> createState() {
    return new OneCategoryPageState(url,title);
  }

}
class OneCategoryPageState extends State<OneCategoryPage> {
  final String url, title;


  OneCategoryPageState(this.url, this.title);

  NewsHub newsHub;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    var res = await http.get("https://newsapi.org/v2/everything?q=$url&apiKey=1635f055e0804e1ebbdc43fabbefc115");
    var decodedJson = jsonDecode(res.body);
    newsHub = NewsHub.fromJson(decodedJson);
    print(newsHub.toJson());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Image.asset('asset/news_text_icon.png', fit: BoxFit.fitHeight ,height: 40,
          width: 100,
        ),
        backgroundColor:  (HexColor("1E1E1E")),
      ),

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
                      padding: EdgeInsets.only(bottom:10.0),
                      child: imageIcon("asset/news_icon.png"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:00.0),
                      child: imageIcon("asset/news_text_icon.png"),
                    ),
                  ],
                )
              ]),
        ),
      )

      //Finish loading => newsHub.newsClass
          :
      Container(
        decoration: new BoxDecoration(color: HexColor("1E1E1E")),
        child: new Center(
            child: new ListView.builder(
              itemCount: newsHub.newsClass.length,
              padding: new EdgeInsets.all(8.0),
              itemBuilder: (BuildContext context, int index) {

                return new FlatButton(onPressed: (){
//                Navigator.of(context).pushNamed('/screen2');
                  Navigator
                      .of(context)
                      .push(new MaterialPageRoute(builder: (BuildContext context) => WebViewNews(newsHub.newsClass[index].url)));

                }, child: new NewsCell(newsHub.newsClass[index]));
              },
            )
        ),
      ),
    );
  }

  Widget imageIcon(String asset){
    return Image.asset(asset,
      height: 100,
      width: 100,
    );
  }

  onLoadingDone(){
    if(newsHub != null){
      HomePage.newsClass = newsHub.newsClass;
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator
            .of(context)
            .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => MainScreen(newsHub.newsClass)));
      });
    }
  }
}