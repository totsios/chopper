import 'package:chopper/chopper.dart';


part 'post_api_srv.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PostApiSrv extends ChopperService {
  
  @Get( )
  Future <Response> getPosts();

  @Get(path: '/{id}')
  Future <Response> getPost(@Path('id') int id);

  @Post()
  Future <Response> savePost(@Body() Map<String,dynamic> body);

  static PostApiSrv create(){
    final client = ChopperClient(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      services: [
        _$PostApiSrv(),
      ],
      converter:  JsonConverter(),
    );
    return _$PostApiSrv(client);
  }


}

// Headers (e.g. for Authentication) can be added in the HTTP method constructor
// or also as parameters of the Dart method itself.
// @Get(headers: {'Constant-Header-Name': 'Header-Value'})
// Future<Response> getPosts([
  // Parameter headers are suitable for ones which values need to change
  // @Header('Changeable-Header-Name') String headerValue,]);