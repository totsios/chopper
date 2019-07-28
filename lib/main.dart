import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Services/post_api_srv.dart';
import 'home_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        builder: (_) => PostApiSrv.create(),
        dispose: (context, PostApiSrv service) => service.client.dispose(),
        child: MaterialApp(
        title: 'Chopper example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(title: 'Chopper example'),
      ),
    );
  }
}
