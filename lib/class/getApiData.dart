import 'dart:convert';

import 'package:http/http.dart' as http;

class GetApiData {
  Future getData() async {
    final productUrl = Uri.parse('https://randomuser.me/api/?results=10');
    final response = await http.get(productUrl);
    //print(response.body);
    return json.decode(response.body)["results"];
  }

  Future getSingleData(int id) async {
    final productUrl = Uri.parse('https://randomuser.me/api/?results=1');
    final response = await http.get(productUrl);
    // print(response.statusCode);
    // print(response.body);

    return json.decode(response.body);
  }
}
