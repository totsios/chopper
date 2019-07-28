import 'dart:convert';

import 'package:chopper/chopper.dart' as chopper;
import 'package:flutter/material.dart';
import 'Services/post_api_srv.dart';
import 'package:provider/provider.dart';

class PostPage extends StatelessWidget {
  final int postId;
  const PostPage({Key key, this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post #ID:{$postId}'),
      ),
      body: FutureBuilder<chopper.Response>(
        future: Provider.of<PostApiSrv>(context).getPost(postId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final Map post = json.decode(snapshot.data.bodyString);
            return _buildPost(post);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Padding _buildPost(Map post) {
  return Padding(
    padding: EdgeInsets.all(15.0),
    child: Column(
      children: [
        ListTile(

          title: Text(post['title'],
          textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 45.0)),
          subtitle: Text(post['body'],
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 25.0)),
        )
      ],
    ),
  );
}
