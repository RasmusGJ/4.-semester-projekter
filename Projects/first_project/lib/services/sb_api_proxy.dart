import 'package:http/http.dart';
import 'dart:convert';

class SBAPIProxy {
  String baseDataURL = "https://api.statbank.dk/v1/data";
  String baseMetaDataURL = "https://api.statbank.dk/v1/tableinfo";
  List<Map<String, dynamic>> candidates = [];

  void getCandidateIds() async {
    try {
      Response response = await get("$baseMetaDataURL/FV11KAND");
      Map<String, dynamic> stat = jsonDecode(response.body);
      //print((stat['variables'][0]['values'] as List<dynamic>).length);
      for (int i = 0;
          i < (stat['variables'][0]['values'] as List<dynamic>).length;
          i++) {
        candidates.add(stat['variables'][0]['values'][i]);
      }
      //print(candidates.length);
      //print(candidates[0]["text"] + candidates[0]["id"]);
    } catch (e) {
      print("Caught error: $e");
      return null;
    }
  }

  Future<String> getCandidateValues(String name) async {
    String name = "";
    try {
      for (var i in candidates) {
        if ((i["text"] as String).toLowerCase() == name.toLowerCase()) {
          name = i["text"] as String;
        }
      }
      print(name);

      int value;
      Response response =
          await get("$baseDataURL/FV11KAND/JSONSTAT?OPKANDIDAT=2949949");
      Map<String, dynamic> stat = jsonDecode(response.body);
      value = stat['dataset']['value'][0];
      return name;
    } catch (e) {
      print("Caught error: $e");
      return name;
    }
  }
}
