import '../sources_responses/Source.dart';

/// source : {"id":"bbc-news","name":"BBC News"}
/// author : "https://www.facebook.com/bbcnews"
/// title : "Pentagon to tighten controls after classified documents leak"
/// description : "The defence department wants a new office for insider threats and systems to detect electronic devices."
/// url : "https://www.bbc.co.uk/news/world-us-canada-66111469"
/// urlToImage : "https://ichef.bbci.co.uk/news/1024/branded_news/133DA/production/_130301887_4858fad251338757c8cc8883eb625fea8a9557240_0_2048_13652000x1333.jpg"
/// publishedAt : "2023-07-05T22:24:33Z"
/// content : "The Pentagon will change its security policies after a review into a big leak of classified files found officials struggled to keep up with the number of staff who had top secret access.\r\nNew measure… [+2367 chars]"

class News {
  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}
