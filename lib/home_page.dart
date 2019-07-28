import 'dart:convert';
import 'package:chopper/chopper.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chopper/chopper.dart';
import 'Services/post_api_srv.dart';
import 'post_page.dart';

class HomePage extends StatelessWidget {
  final String title ;
  const HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),        
      ),
      body: _buildBody(context),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.new_releases) ,
              onPressed: () async{
                final response = await Provider.of<PostApiSrv>(context).savePost({'key':'onevalue'});
                print(response.body);
              },),
              
          );
        }
      }
      
  FutureBuilder<prefix0.Response>  _buildBody(BuildContext context) {
    return FutureBuilder<Response>(
      future: Provider.of<PostApiSrv>(context).getPosts(),
      builder: (context, snapshot){
        if (snapshot.connectionState==ConnectionState.done) {
          final List posts = json.decode(snapshot.data.bodyString);
          return _buildPost(context, posts);
                  }
                  else {
                    return Center( child: CircularProgressIndicator(semanticsLabel: 'waiting please...',));
                  }
                }
    );
          }
          
   ListView _buildPost(BuildContext context, List posts) {
     return ListView.builder(
       itemCount: posts.length,
       padding: EdgeInsets.all(10.0),
       itemBuilder: (context, index){
         return Card(
           elevation: 5.0,
           child: ListTile(
             title: Text(posts[index]['title'],
              style: TextStyle(fontWeight: FontWeight.bold),),
             subtitle: Text(posts[index]['body']),
             onTap: (){
               _navigateToPost(context, posts[index]['id']);
                            },         
                          ),
                          );
                      }
               
                      );
               }
               
void _navigateToPost(BuildContext context, int post) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context)=> PostPage(postId : post))
  );
}