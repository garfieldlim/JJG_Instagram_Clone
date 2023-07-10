import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:igclone_flutter/state/constants/firebase_collection_name.dart';
import 'package:igclone_flutter/state/constants/firebase_field_name.dart';
import 'package:igclone_flutter/state/likes/models/like.dart';
import 'package:igclone_flutter/state/likes/models/like_dislike_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final likeDislikePostProvider =
    FutureProvider.family.autoDispose<bool, LikeDislikeRequest>(
  (ref, LikeDislikeRequest request) async {
    final query = FirebaseFirestore.instance
        .collection(FirebaseCollectionName.likes)
        .where(FirebaseFieldName.postId, isEqualTo: request.postId)
        .where(FirebaseFieldName.userId, isEqualTo: request.likedBy)
        .get();

    final hasLiked = await query.then(
      (snapshot) => snapshot.docs.isNotEmpty,
    );

    if (hasLiked) {
      try {
        await query.then((snapshot) async {
          await snapshot.docs.first.reference.delete();
        });
        return true;
      } catch (_) {
        return false;
      }
    } else {
      final like = Like(
        postId: request.postId,
        likedBy: request.likedBy,
        date: DateTime.now(),
      );

      try {
        await FirebaseFirestore.instance
            .collection(FirebaseCollectionName.likes)
            .add(like);
        return true;
      } catch (_) {
        return false;
      }
    }
  },
);
