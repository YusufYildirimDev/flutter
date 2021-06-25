import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pets/models/photos_model.dart';

Future<List<Photos>> fetchData() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => new Photos.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
