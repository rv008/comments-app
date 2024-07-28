import 'package:comments_app/features/comments/domain/entity/comment_entity.dart';
import 'package:comments_app/features/comments/presentation/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comment.g.dart';

@riverpod
class CommentNotifier extends _$CommentNotifier {
  @override
  FutureOr<List<CommentEntity>> build() {
    return ref.read(getCommentUseCaseProvider)();
  }
}