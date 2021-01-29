import 'dart:convert';

import 'package:newspedia/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news= [];

  Future<void> getNews() async{
    String url= "http://newsapi.org/v2/top-headlines?country=in&category=general&apiKey=b07ceb3d2663473fac0674be62bc30be";
    var response= await http.get(url);
    var jsonData= jsonDecode(response.body);
    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element){
        if(element['title']!= null && element['urlToImage']!= null && element['description']!= null){
          ArticleModel articleModel= ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            // publishedAt: element['publishedAt']
          );

          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNews{
  List<ArticleModel> news= [];

  Future<void> getNews(String category) async{
    String url= "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=b07ceb3d2663473fac0674be62bc30be";
    var response= await http.get(url);
    var jsonData= jsonDecode(response.body);
    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element){
        if(element['title']!= null && element['urlToImage']!= null && element['description']!= null){
          ArticleModel articleModel= ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            // publishedAt: element['publishedAt']
          );

          news.add(articleModel);
        }
      });
    }
  }
}