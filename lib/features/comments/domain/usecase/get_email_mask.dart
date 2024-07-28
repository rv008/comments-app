import 'package:comments_app/features/comments/domain/comment_repository.dart';

class CanMaskEmailUseCase {
  final CommentRepository _repository;

  CanMaskEmailUseCase(this._repository);

  Stream<bool> call() async*{
    yield _repository.shouldMaskEmail();
    yield* _repository.maskStatusUpdates.map((status) => status);
  }
}
