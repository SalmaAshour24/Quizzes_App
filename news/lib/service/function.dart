import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class function{
  static Future<void> opennews(String link)async
  {
    var urlLink=link;
    if(await canLaunch(urlLink)){
      await launch(urlLink);
    }else{
      await launch(urlLink);
    }
  }
  static Future<void> share(String link)async
  {
    Share.share(link);
  }
}