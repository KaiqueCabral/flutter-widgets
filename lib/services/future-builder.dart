import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_widgets/model/future-builder.dart';

FutureBuilderModel responseFromJson(String jsonString) {
  final jsonData = json.decode(jsonString);
  return FutureBuilderModel.fromJson(jsonData);
}

String url = "https://jsonplaceholder.typicode.com/posts";

///Method for GET Request
Future<FutureBuilderModel> getFutureResponse(int _post) async {
  final response = await http.get("$url/" + _post.toString());
  return responseFromJson(response.body);
}
