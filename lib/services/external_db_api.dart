import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class DatingApi {
  initialize_dot_env(route, endpoint) async {
    await dotenv.load(fileName: '.env');
    return "http://${dotenv.get("HOST")}/$route$endpoint";
  }

  insert_user(_google_token) async {
    print("____object");
    var route = 'user';
    var endpoint = '/create';

    String apiUrl = await initialize_dot_env(route, endpoint);

    print("\n\n____url ${apiUrl}");
    print("\n\n____token${_google_token}");

    var response = await http.post(Uri.parse(apiUrl),
        body: {'_google_token':' _google_token.toString()'});
    print("____StatutCOde___${response.statusCode}");

    if (response.statusCode == 200) {
      print('__Insert__success');
    } else {
      print('___error__${response.statusCode}');
    }
  }

  user_login(_google_token) async {
    var route = 'user';
    var endpoint = '?_google_token=$_google_token';
    String apiUrl = await initialize_dot_env(route, endpoint);

    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return print('__search__success');
    } else {
      return print('___error__${response.statusCode}');
    }
  }
}
