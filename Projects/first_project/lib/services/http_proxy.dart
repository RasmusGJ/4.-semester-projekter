import 'package:first_project/models/candidate.dart';
import 'package:first_project/models/party.dart';
import 'package:http/http.dart';
import 'dart:convert';

class HttpProxy {
  Future<List<Candidate>> getAllCandidates() async {
    try {
      Response response =
          await get("https://blooming-chamber-79142.herokuapp.com/candidate");
      Iterable l = json.decode(response.body);
      List<Candidate> candidates =
          List<Candidate>.from(l.map((model) => Candidate.fromJson(model)));
      return candidates;
    } catch (e) {
      print("Caught error: $e");
      return null;
    }
  }

  Future<List<Party>> getAllParties() async {
    try {
      Response response =
          await get("https://blooming-chamber-79142.herokuapp.com/party");
      Iterable l = json.decode(response.body);
      List<Party> parties =
          List<Party>.from(l.map((model) => Party.fromJson(model)));
      return parties;
    } catch (e) {
      print("Caught error: $e");
      return null;
    }
  }
}
