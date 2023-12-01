import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class News {
  late String id;
  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String publishedAt;

  //default constructor
  News(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt})
      : id = uuid.v4();

  // name constructor
  News.fromJson(Map<String, dynamic> newsData) {
    author = newsData["author"] ?? "";
    title = newsData["title"] ?? "";
    description = newsData["description"] ?? "";
    url = newsData["url"] ?? "";
    urlToImage = newsData["urlToImage"] ?? "";
    publishedAt = newsData["publishedAt"] ?? "";
  }

// static constuctor
  factory News.fromData(Map newsData) {
    String author = newsData["author"] ?? "";
    String title = newsData["title"] ?? "";
    String description = newsData["description"] ?? "";
    String url = newsData["url"] ?? "";
    String urlToImage = newsData["urlToImage"] ?? "";
    String publishedAt = newsData["publishedAt"] ?? "";

    return News(
        author: author,
        title: title,
        description: description,
        url: url,
        urlToImage: urlToImage,
        publishedAt: publishedAt);
  }
}
