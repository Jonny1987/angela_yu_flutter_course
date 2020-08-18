import 'dart:convert';

import 'package:http/http.dart' as http;

String apiKey = 'A8DD7B54-1062-4D63-9FD4-EC2CB2C5849D';
String baseURL = 'https://rest.coinapi.io';
String ratePath = '/v1/exchangerate/';

Future<String> getRate(String asset, String currency) async {
  String url = baseURL + ratePath + '$asset/$currency' + '?apiKey=' + apiKey;
  print(url);
  http.Response res = await http.get(url);

  if (res.statusCode == 200) {
    return jsonDecode(res.body)['rate'].toStringAsFixed(2);
  } else {
    print(res.statusCode);
  }
}