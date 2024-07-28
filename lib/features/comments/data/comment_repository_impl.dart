import 'package:comments_app/features/comments/domain/comment_repository.dart';
import 'package:comments_app/features/comments/domain/entity/comment_entity.dart';
import 'package:dio/dio.dart';

class CommentRepositoryImpl implements CommentRepository {
  final Dio _dio;

  CommentRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<CommentEntity>> getComments() async {
    var response = await _dio.get('/comments');
    return List<CommentEntity>.from(
        response.data!.map((x) => CommentEntity.fromJson(x)));
  }
}
