// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_api_srv.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$PostApiSrv extends PostApiSrv {
  _$PostApiSrv([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = PostApiSrv;

  Future<Response> getPosts() {
    final $url = '/posts';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getPost(int id) {
    final $url = '/posts/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> savePost(Map<String, dynamic> body) {
    final $url = '/posts';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
