import 'dart:convert' as convert;
import 'package:apiders/models/info.dart';
import 'package:http/http.dart' as http;

Future<MainModel?> getMainModel() async {
  String url = 'https://dummyjson.com/users';

  try {
    var res = await http.get(Uri.parse(url));
    var data = convert.jsonDecode(res.body);
    if (res.statusCode == 200) {
      return MainModel.fromJson(data);
    }
  } catch (e) {
    print(e);
  }
  return MainModel.fromJson({});
}
