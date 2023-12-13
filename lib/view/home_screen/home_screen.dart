import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:news_app/controller/ApiController.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/view/home_screen/home_screen_widgets/news_tile.dart';
import 'package:news_app/view/search_screen/search_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiController apiController = ApiController();

  @override
  void initState() {
    fetchDataFromApi();
    super.initState();
  }

  Future<void> fetchDataFromApi() async {
    await Provider.of<ApiController>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade500,
        title: Text(
          'News',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchScreen(),
              ),
            ),
            icon: Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Consumer<ApiController>(
        builder: (context, value, child) => value.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (context, index) => NewsTile(
                  title: value.apiResponse?.articles?[index].title ?? '',
                  description:
                      value.apiResponse?.articles?[index].description ?? '',
                  author: value.apiResponse?.articles?[index].author ??
                      'Unavailable',
                  publishedAt: DateFormat('dd/MMM/yyyy hh:mm a')
                      .format(value.apiResponse!.articles![index].publishedAt!),
                  imageUrl:
                      value.apiResponse?.articles?[index].urlToImage ?? '',
                ),
                itemCount: value.apiResponse!.articles!.length,
              ),
      ),
    );
  }
}
