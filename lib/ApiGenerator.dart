import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'ApiGenerator.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/posts")

abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("")
  Future<List<FetchPost>> getPost();
}

@JsonSerializable()

class FetchPost{
  int userId;
  int id;
  String title;
  String body;

  FetchPost(this.userId, this.id, this.title, this.body);

  factory FetchPost.fromJson(Map<String, dynamic> json) => _$FetchPostFromJson(json);
  Map<String, dynamic> toJson() => _$FetchPostToJson(this);


}