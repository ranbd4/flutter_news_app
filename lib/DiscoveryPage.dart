import 'package:flutter/material.dart';
import 'package:flutter_news_app/OneCategoryPage.dart';
import 'package:flutter_news_app/main.dart';

/*
@RAN OREL BEN DAVID@

This is the Discovery page!

This screen displays the categories

-in createList() - The List is created..

On Click => OneCategoryPage.dart

 */


class DiscoveryPage extends StatelessWidget{

  List<DiscoveryPageClass> _discoveryPageClass= new List();

  @override
  Widget build(BuildContext context) {
    createList();
    return new Scaffold(
      backgroundColor: Colors.grey[200],
      body: new GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 25.0),
        padding: const EdgeInsets.all(10.0),
        itemCount: _discoveryPageClass.length,
        itemBuilder: (BuildContext context, int index) {
          return new FlatButton(onPressed: (){
            Navigator
                .of(context)
                .push(new MaterialPageRoute(builder: (BuildContext context) => OneCategoryPage(_discoveryPageClass[index].url,_discoveryPageClass[index].title)));

          }, child: new DiscoveryPageCell(_discoveryPageClass[index]));
        },
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

  void createList(){
    _discoveryPageClass.clear();
    _discoveryPageClass.add(DiscoveryPageClass("asset/cars_icon.png","Cars","cars"));
    _discoveryPageClass.add(DiscoveryPageClass("asset/food_icon.png","Food","food"));
    _discoveryPageClass.add(DiscoveryPageClass("asset/it_icon.png","IT","it"));
    _discoveryPageClass.add(DiscoveryPageClass("asset/sport_icon.png","Sport","sport"));
    _discoveryPageClass.add(DiscoveryPageClass("asset/design_icon.png","Design","design"));
    _discoveryPageClass.add(DiscoveryPageClass("asset/business_icon.png","Business","business"));
    _discoveryPageClass.add(DiscoveryPageClass("asset/health_icon.png","Health","health"));
    _discoveryPageClass.add(DiscoveryPageClass("asset/shopping_icon.png","Shopping","Shopping"));
  }
}

class DiscoveryPageCell extends StatelessWidget{
  final _discoveryPageClass;

  DiscoveryPageCell(this._discoveryPageClass);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Image.asset(
          _discoveryPageClass.image,
          height: 120,
          width: 120,
        ),
        new Padding(padding:new EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: textWithFont(
                _discoveryPageClass.title,
                20,
                true,
                "000000"
            )
        ),
      ],


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

class DiscoveryPageClass{
  String image, title, url;

  DiscoveryPageClass(this.image, this.title, this.url);
}