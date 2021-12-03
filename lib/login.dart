import 'dart:convert';
import 'package:http/http.dart' as http;



class logine {
  static void connexion() async {
    final response = await http.get(Uri.parse('http://193.54.227.216/connexion.php'));


    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
    }
  }

}
