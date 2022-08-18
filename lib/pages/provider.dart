
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_get_api/pages/connection.dart';
import 'package:riverpod_get_api/pages/user_model.dart';

final ApiProver = FutureProvider<List<user>>((ref) async{
  return ref.watch(useProvider).fetchData();
});