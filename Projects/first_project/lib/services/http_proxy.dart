import 'package:first_project/models/Candidate/candidate.dart';
import 'package:first_project/models/Candidate/tag.dart';
import 'package:first_project/models/Party/party.dart';
import 'package:http/http.dart';
import 'dart:convert';

class HttpProxy {
  Future<List<Candidate>> getAllCandidates() async {
    try {
      Response response =
          await get("https://politikeren-app.herokuapp.com/candidate");
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
          await get("https://politikeren-app.herokuapp.com/party");
      Iterable l = json.decode(response.body);
      List<Party> parties =
          List<Party>.from(l.map((model) => Party.fromJson(model)));
      return parties;
    } catch (e) {
      print("Caught error: $e");
      return null;
    }
  }

  Future<List<Tag>> getAllTags() async {
    try {
      Response response =
          await get("https://politikeren-app.herokuapp.com/tag");
      Iterable l = json.decode(response.body);
      List<Tag> tags = List<Tag>.from(l.map((model) => Tag.fromJson(model)));
      return tags;
    } catch (e) {
      print("Caught error: $e");
      return null;
    }
  }
}
