import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:todo_app/model.dart';

class FirebaseService {
  String collectionRef = 'Student';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Reference storage = FirebaseStorage.instance.ref();



  
      Future<String> uploadVideoToStorage(File videoFile) async {
        try {
          final Reference storageRef = storage
              .child('videos')
              .child('${DateTime.now().millisecondsSinceEpoch}.mp4');
          final TaskSnapshot uploadTask = await storageRef.putFile(videoFile);
          final String videoUrl = await uploadTask.ref.getDownloadURL();
          return videoUrl;
        } catch (e) {
          print('Error uploading video to Firebase Storage: $e');
          rethrow;
        }
      }

      // Adds video metadata (e.g., recipientId and videoUrl) to Firestore
      Future<void> addVideo(String recipientId, String videoUrl) async {
        try {
          await firestore.collection(collectionRef).add({
            'recipientId': recipientId,
            'videoUrl': videoUrl,
            'uploadedAt': FieldValue.serverTimestamp(),
          });
          print('Video metadata added to Firestore successfully.');
        } catch (e) {
          print('Error adding video to Firestore: $e');
        }
      }

      // This function uploads a video file to storage and adds its URL to Firestore
      Future<void> selectAndSendVideo(File videoFile, String recipientId) async {
        try {
          final String videoUrl = await uploadVideoToStorage(videoFile);
          await addVideo(recipientId, videoUrl);
        } catch (e) {
          print('Error selecting and sending video: $e');
        }
      }

  }
  

