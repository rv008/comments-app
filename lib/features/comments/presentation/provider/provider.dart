import 'package:comments_app/features/comments/data/comment_repository_impl.dart';
import 'package:comments_app/features/comments/domain/comment_repository.dart';
import 'package:comments_app/features/comments/domain/usecase/get_comment.dart';
import 'package:comments_app/features/comments/domain/usecase/get_email_mask.dart';
import 'package:comments_app/features/comments/domain/usecase/initialize_email_mask.dart';
import 'package:comments_app/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
CommentRepository commentRepository(CommentRepositoryRef ref) {
  return CommentRepositoryImpl(
    dio: ref.watch(networkProvider),
    remoteConfigService: ref.watch(remoteConfigServiceProvider),
  );
}

@riverpod
GetCommentUseCase getCommentUseCase(GetCommentUseCaseRef ref) {
  return GetCommentUseCase(ref.watch(commentRepositoryProvider));
}

@riverpod
InitializeEmailMaskUseCase initializeEmailMaskUseCase(
    InitializeEmailMaskUseCaseRef ref) {
  return InitializeEmailMaskUseCase(ref.watch(commentRepositoryProvider));
}

@riverpod
CanMaskEmailUseCase canMaskEmailUseCase(CanMaskEmailUseCaseRef ref) {
  return CanMaskEmailUseCase(ref.watch(commentRepositoryProvider));
}
