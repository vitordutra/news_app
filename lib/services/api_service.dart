import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app/model/article_model.dart';

class ApiService {
  final endpointUrl =
      'https://newsapi.org/v2/top-headlines?country=br&apiKey=6acbbeab6a784b2aadd5ad8622a29027';

  Future<List<Article>> getArticle() async {
    Response res = await get(endpointUrl);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).where((element) => element.urlToImage != null).toList();
      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
