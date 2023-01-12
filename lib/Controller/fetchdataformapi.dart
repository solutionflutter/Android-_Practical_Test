import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../Models/quran.dart';

class FetchDataFormApi extends ChangeNotifier{
  Future<List<Results>?> fetchDataFormApi() async {
    try {
      var response = await Dio().get('http://api.quran.com/api/v3/search?q=quran&size=20&page=0&language=en');
      List<dynamic> data = response.data["search"]["results"];
      return data.map((e) => Results.fromJson(e)).toList();
    } catch (e) {
      print(e);
    }
  }
}