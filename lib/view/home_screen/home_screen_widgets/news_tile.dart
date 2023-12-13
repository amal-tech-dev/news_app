import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  String title, description, author, publishedAt;
  String? imageUrl;
  final separatorBox = SizedBox(height: 5);

  NewsTile({
    required this.title,
    required this.description,
    required this.author,
    required this.publishedAt,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageUrl == null
              ? Container(
                  height: 200,
                  color: Colors.white,
                  child: Center(
                    child: Icon(Icons.error),
                  ),
                )
              : Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        imageUrl!,
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
          separatorBox,
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          separatorBox,
          Text(
            description,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          separatorBox,
          Row(
            children: [
              Text(
                'Author: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(author),
            ],
          ),
          separatorBox,
          Row(
            children: [
              Text(
                'Published At: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(publishedAt),
            ],
          ),
          separatorBox,
        ],
      ),
    );
  }
}
