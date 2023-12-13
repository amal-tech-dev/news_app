import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade500,
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text(
          'Search',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              child: TextField(
                controller: newsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
