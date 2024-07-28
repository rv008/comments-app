import 'package:comments_app/features/comments/data/comment_repository_impl.dart';
import 'package:comments_app/features/comments/domain/comment_repository.dart';
import 'package:comments_app/features/comments/domain/usecase/get_comment.dart';
import 'package:comments_app/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
CommentRepository commentRepository(CommentRepositoryRef ref) {
  return CommentRepositoryImpl(dio: ref.read(networkProvider));
}

@riverpod
GetCommentUseCase getCommentUseCase(GetCommentUseCaseRef ref) {
  return GetCommentUseCase(ref.read(commentRepositoryProvider));
}
