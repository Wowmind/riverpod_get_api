import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_get_api/pages/user_model.dart';

class userApi{
  String endpoint = 'https://jsonplaceholder.typicode.com/posts/1/comments';

  Future<List<user>> fetchData() async {
    var response = await get(Uri.parse(endpoint));
    if(response.statusCode == 200){
      final List result = jsonDecode(response.body);
      return result.map(((e) => user.fromJson(e))).toList();
    }else {
      throw Exception(response.reasonPhrase);
    }

  }
}

final useProvider = Provider<userApi>((ref)=> userApi());