import 'package:flutter/material.dart';
import 'package:flutter_news_app/main.dart';
import 'package:webview_flutter/webview_flutter.dart';

/*
@RAN OREL BEN DAVID@

This is the Web View!

This screen receives a URL, and displays on the screen.

 */

class WebViewNews extends StatefulWidget {
  final String url;

  WebViewNews(this.url);

  @override
_WebViewNews createState() => _WebViewNews(url);
}

class _WebViewNews extends State<WebViewNews> {
  final String url;

  _WebViewNews(this.url);

  @override
  Widget build(BuildContext context) {
    print(url);
    return Scaffold(
      appBar: AppBar(
        title: new Image.asset('asset/news_text_icon.png', fit: BoxFit.fitHeight ,height: 40,
          width: 100,
        ),
        backgroundColor:  (HexColor("1E1E1E")),
      ),
      body: WebView(
        initialUrl: url
      ),
    );
  }

  String newUrl(String url){
    return url.replaceAll("http", "https");
  }
}
