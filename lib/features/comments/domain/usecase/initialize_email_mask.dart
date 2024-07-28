import 'package:comments_app/features/comments/domain/comment_repository.dart';

class InitializeEmailMaskUseCase {
  InitializeEmailMaskUseCase(this._repository);

  final CommentRepository _repository;

  Future<void> call() => _repository.initialize();
}