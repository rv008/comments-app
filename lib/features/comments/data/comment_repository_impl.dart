import 'package:comments_app/features/comments/domain/comment_repository.dart';
import 'package:comments_app/features/comments/domain/entity/comment_entity.dart';
import 'package:comments_app/utils/remote_config_service.dart';
import 'package:dio/dio.dart';

class CommentRepositoryImpl implements CommentRepository {
  final Dio _dio;
  final FirebaseRemoteConfigService _remoteConfigService;
  static const String _maskKey = 'mask';

  CommentRepositoryImpl({
    required Dio dio,
    required FirebaseRemoteConfigService remoteConfigService,
  })  : _dio = dio,
        _remoteConfigService = remoteConfigService;

  @override
  Future<List<CommentEntity>> getComments() async {
    var response = await _dio.get('/comments');
    return List<CommentEntity>.from(
        response.data!.map((x) => CommentEntity.fromJson(x)));
  }

  @override
  Future<void> initialize() => _remoteConfigService.initialize();

  @override
  bool shouldMaskEmail() => _remoteConfigService.getBool(_maskKey);

  @override
  Stream<bool> get maskStatusUpdates =>
      _remoteConfigService.configUpdates.asyncMap((data) async {
        await _remoteConfigService.activate();
        return shouldMaskEmail();
      }).distinct();
}
