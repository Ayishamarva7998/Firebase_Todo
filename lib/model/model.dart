import 'package:cloud_firestore/cloud_firestore.dart';

class VideoModel {
  final String recipientId;
  final String videoUrl;
  final DateTime uploadedAt;

  VideoModel({
    required this.recipientId,
    required this.videoUrl,
    required this.uploadedAt,
  });

  factory VideoModel.fromFirestore(Map<String, dynamic> data) {
    return VideoModel(
      recipientId: data['recipientId'] as String,
      videoUrl: data['videoUrl'] as String,
      uploadedAt: (data['uploadedAt'] as Timestamp).toDate(),
    );
  }
}
