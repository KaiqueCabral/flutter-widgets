import 'dart:convert';
import 'package:flutter_widgets/model/future-builder.dart';

FutureBuilderModel responseFromJson(String jsonString) {
  final jsonData = json.decode(jsonString);
  return FutureBuilderModel.fromJson(jsonData);
}

//String url = "${Settings.apiURL}/posts";

Future<FutureBuilderModel> getFutureResponse(int _post) async {
  //final response = await http.get("$url/" + _post.toString());
  final response =
      "{ \"userId\": $_post, \"id\": $_post, \"title\": \"Title\", \"body\": \"Lorem ipsum for post: $_post.\" }";

  await Future.delayed(const Duration(seconds: 3));
  return responseFromJson(response);
}
