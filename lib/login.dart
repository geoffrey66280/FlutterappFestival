import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class logine {
  static Future<List<dynamic>?> get(String url) async {

    final response =
        await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
       final data = jsonDecode(response.body);
       data.toString();
       return data;

    }
    return null;
  }


  static Future<String> geti(String url) async {

  final response =
  await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
  final data = response.body;

       return data;
      }
  return "null";
  }

  static void post() async {
    try {
      final response = await http.post(
          Uri.parse("http://193.54.227.216/connexion.php"),
          body: {"a": "oui", "b": "Post body", "oui": "non"});
      print(response.body);
    } catch (er) {}
  }
}
