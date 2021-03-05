import 'dart:convert';

import 'package:news_app/model/newsmodel.dart';
import 'package:http/http.dart';

class News{


  List<ArticleModel> dataToBeSavedIn = [];

    Future<void> getNews() async {
      
      var response = await get('http://newsapi.org/v2/top-headlines?country=us&apiKey=76d1960eb3924bf1a0a2fa18e3747e62');
      var jsonData = jsonDecode(response.body);

      if (jsonData['status'] == 'ok'){

        jsonData['articles'].forEach((element){

          if (element['urlToImage'] != null && element['description'] != null) {

            ArticleModel articleModel = ArticleModel(
              title: element['title'],
              urlToImage: element['urlToImage'],
              description: element['description'],
              url: element['url'],
            );

            dataToBeSavedIn.add(articleModel);
          }

        });


      }


    }
}

//fetching news by category
class CategoryNews{


  List<ArticleModel> dataToBeSavedIn = [];

  Future<void> getNews(String category) async {

    var response = await get('http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=76d1960eb3924bf1a0a2fa18e3747e62');
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok'){

      jsonData['articles'].forEach((element){

        if (element['urlToImage'] != null && element['description'] != null) {

          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            urlToImage: element['urlToImage'],
            description: element['description'],
            url: element['url'],
          );

          dataToBeSavedIn.add(articleModel);
        }

      });


    }


  }
}

