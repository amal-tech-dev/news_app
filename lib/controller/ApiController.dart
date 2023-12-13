import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:http/http.dart' as http;

class ApiController with ChangeNotifier {
  Map<String, dynamic> decodedData = {};
  NewsModel? apiResponse;
  bool isLoading = false;

  Future getData() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=f6080c77605b40b08ed0e9f2658dd435');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      apiResponse = NewsModel.fromJson(decodedData);
    }
    isLoading = false;
    notifyListeners();
  }
}
