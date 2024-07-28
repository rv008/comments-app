import 'package:comments_app/features/comments/domain/entity/comment_entity.dart';

abstract class CommentRepository {
  Future<List<CommentEntity>> getComments();
}
