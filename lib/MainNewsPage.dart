import 'package:flutter/material.dart';
import 'package:flutter_news_app/WebViewNews.dart';
import 'package:flutter_news_app/main.dart';
import 'package:flutter_news_app/newsClass.dart';

/*
@RAN OREL BEN DAVID@

This is the Main News Page!

This screen shows all articles from every kinds.

On Click => WebViewNews.dart

 */

class MainNewsPage extends StatelessWidget{
  final List<NewsClass> newsClass;


  MainNewsPage(this.newsClass);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: HexColor("1E1E1E")),
      child: new Center(
          child: new ListView.builder(
            itemCount: newsClass.length,
            padding: new EdgeInsets.all(8.0),
            itemBuilder: (BuildContext context, int index) {

              return new FlatButton(onPressed: (){
//                Navigator.of(context).pushNamed('/screen2');
                Navigator
                    .of(context)
                    .push(new MaterialPageRoute(builder: (BuildContext context) => WebViewNews(newsClass[index].url)));

              }, child: new NewsCell(newsClass[index]));
            },
          )
      ),
    );
  }

  Widget imageIcon(String asset){
    return Image.asset(asset,
      height: 100,
      width: 100,
    );
  }

  Widget textWithFont(String text, double textSize, bool isBoldText, String textColor){
    Color color = HexColor(textColor);
    String fontFamily = "Rubik";
    if(isBoldText){
      fontFamily = "RubikRegular";
    }
    return Text(
      '$text',
      style: new TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: textSize,

      ),
      //textAlign: TextAlign.center,
    );
  }
}


class NewsCell extends StatelessWidget{
  final newsClass;

  NewsCell(this.newsClass);
  @override
  Widget build(BuildContext context) {
    print("dffdgdfgdffdgfdggdf"+newsClass.source);

    return new Card(
      elevation: 1.7,
      child: new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
            new Image.network(
              newsClass.urlToImage,
              fit: BoxFit.cover,
            ),
            new Padding(padding:new EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: textWithFont(
                    newsClass.title,
                    20,
                    true,
                    "000000"
                )
            ),
            new Padding(padding:new EdgeInsets.only(bottom: 14.0),
              child:                       textWithFont(
                  newsClass.description,
                  17,
                  false,
                  "1E1E1E"
              ),
            ),
            new Padding(padding:new EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: textWithFont(
                    newsClass.source,
                    22,
                    true,
                    "000000"
                )
            ),
          ],
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

  Widget textWithFont(String text, double textSize, bool isBoldText, String textColor){
    Color color = HexColor(textColor);
    String fontFamily = "Rubik";
    if(isBoldText){
      fontFamily = "RubikRegular";
    }
    return Text(
      '$text',
      style: new TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: textSize,

      ),
      //textAlign: TextAlign.center,
    );
  }
}