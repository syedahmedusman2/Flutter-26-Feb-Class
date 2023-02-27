import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:learning/models/user_model.dart';
getUsers() async {
  String url = "https://maaz-api.tga-edu.com/api/users";
  Uri uri = Uri.parse(url);
  http.Response response = await http.get(uri);
  Map<String, dynamic> body = jsonDecode(response.body);
  UserModel data = UserModel.fromJson(body);
  return data;
}

updateUser({
  required int id,
  required String name,
  required String userName,
  required String email,
}) async {
  String url = "https://maaz-api.tga-edu.com/api/users/$id";
  Uri uri = Uri.parse(url);
  http.Response response = await http.put(uri, 
  headers: {
    'content-type': 'application/json'
  },
  body: jsonEncode({
    "name":name,
    "username":userName,
    "email": email
  }));
  Map<String, dynamic> body = jsonDecode(response.body);
  return body;
}