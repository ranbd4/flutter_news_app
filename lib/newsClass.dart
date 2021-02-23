/*
@RAN OREL BEN DAVID@

This is the NewsHub!

 */

class NewsHub {
  List<NewsClass> newsClass;

  NewsHub({this.newsClass});

  NewsHub.fromJson(Map<String, dynamic> json) {
    if (json['articles'] != null) {
      newsClass = new List<NewsClass>();
      json['articles'].forEach((v) {
        newsClass.add(new NewsClass.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.newsClass != null) {
      data['articles'] = this.newsClass.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewsClass {

  String author, title, description, url,urlToImage, publishedAt, content,source;


  NewsClass({this.author, this.title, this.description, this.url,
    this.urlToImage, this.publishedAt, this.content,this.source});


  NewsClass.fromJson(Map<String, dynamic> json) {
      author = json['author'] as String;
      title= json['title'] as String;
      description= json['description'] as String;
      url= json['url'] as String;
      urlToImage= json['urlToImage'] as String;
      publishedAt= json['publishedAt'] as String;
      content= json['content'] as String;
      source= json['source']["name"] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    data['source'] = this.source;
    return data;
  }
}

