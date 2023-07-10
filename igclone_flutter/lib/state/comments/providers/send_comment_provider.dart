import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:igclone_flutter/state/comments/notifiers/send_comment_notifier.dart';
import 'package:igclone_flutter/state/image_upload/typedefs/is_loading.dart';

final sendCommentProvider =
    StateNotifierProvider<SendCommentNotifier, IsLoading>(
  (_) => SendCommentNotifier(),
);
