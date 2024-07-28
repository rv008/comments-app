import 'package:comments_app/features/comments/domain/comment_repository.dart';
import 'package:comments_app/features/comments/domain/entity/comment_entity.dart';

class GetCommentUseCase {
  final CommentRepository _repository;

  GetCommentUseCase(this._repository);

  Future<List<CommentEntity>> call() => _repository.getComments();
}
