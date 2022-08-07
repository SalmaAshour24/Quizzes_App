import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:task4/models/article.dart';
class api{
  //bstahdm el api key bta3y bs
  final String apikey="98ffc8cdbb4440c9ab724b9715e00c8d";
  Future<List<article>>fetcharticle() async{
    var url=Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&apiKey=$apikey");
List<article>listofarticle=[];
    var response=await http.get(url);
if(response.statusCode==200){
var responsebody = jsonDecode(response.body)["articles"];
print(responsebody);
for(var u in responsebody){
  article y=article(u["title"],u ["decription"], u["url"], u["urlToImage"]);
listofarticle.add(y);
}
print("listadded ----> $listofarticle");

return listofarticle;
}
return listofarticle;
}

  Future<List<article>>fetcharticlebycategory(String category) async{
    var url=Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$apikey");
    List<article>listofarticle=[];
    var response=await http.get(url);
    if(response.statusCode==200){
      var responsebody = jsonDecode(response.body)["articles"];
      print(responsebody);
      for(var u in responsebody){
        article y=article(u["title"],u ["decription"], u["url"], u["urlToImage"]);
        listofarticle.add(y);
      }
      print("listadded ----> $fetcharticlebycategory");

      return listofarticle;
    }
    return listofarticle;
  }}
