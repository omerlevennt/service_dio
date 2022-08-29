import 'dart:io';

import 'package:dio/dio.dart';
import 'package:service_dio/service/post_model.dart';

abstract class IPostService {
  Future<bool> addItemToService(PostModel postModel);
  Future<bool> putItemToService(PostModel postModel, int id);
  Future<bool> deleteItemToService(int id);
  Future<List<PostModel>?> fetchPostItemsAdvance();
}

class PostService implements IPostService {
  final Dio _dio;

  PostService()
      : _dio =
            Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  @override
  Future<bool> addItemToService(PostModel postModel) async {
    try {
      final response =
          await _dio.post(_PostServicePaths.post.name, data: postModel);

      return response.statusCode == HttpStatus.ok;
    } catch (_) {}
    return false;
  }

  @override
  Future<bool> putItemToService(PostModel postModel, int id) async {
    try {
      final response = await _dio.delete("${_PostServicePaths.post.name}/$id",
          data: postModel);

      return response.statusCode == HttpStatus.ok;
    } catch (_) {}
    return false;
  }

  @override
  Future<bool> deleteItemToService(int id) async {
    try {
      final response = await _dio.post(
        "${_PostServicePaths.post.name}/$id",
      );

      return response.statusCode == HttpStatus.created;
    } catch (_) {}
    return false;
  }

  @override
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    try {
      final response = await _dio.get(_PostServicePaths.post.name);
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } catch (_) {
      print("a");
    }
    return null;
  }
}

enum _PostServicePaths { post, comment }
