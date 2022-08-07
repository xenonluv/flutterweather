import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Network {
  late final String surl;
  Network(this.surl);

  Future<dynamic> getJsonData() async {
    var url = Uri.parse(surl);
    http.Response response = await http.get(url);
    var jsonData = response.body;
    var parsingData = convert.jsonDecode(jsonData);
    return parsingData;
  }


}
