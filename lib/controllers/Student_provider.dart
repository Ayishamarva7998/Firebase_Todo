
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model.dart';

import 'package:todo_app/services/service.dart';

class StudentProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  FirebaseService _firebaseService = FirebaseService();
  String uniquename = DateTime.now().microsecondsSinceEpoch.toString();
  String downloadurl = '';

  Stream<QuerySnapshot<StudentModel>> getData() {
    return _firebaseService.studentRef.snapshots();
  }

  void addStudent(StudentModel student) async {
    await _firebaseService.studentRef.add(student);
    notifyListeners();
  }

  void deleteStudent(String id) async {
    await _firebaseService.studentRef.doc(id).delete();
    notifyListeners();
  }

  void updateStudent(String id, StudentModel student) async {
    await _firebaseService.studentRef.doc(id).update(student.toJson());
    notifyListeners();
  }

   imageAdder(image) async {
    //for the image saving path  .ref().child('images'); refrence and the folder name image
    Reference folder = _firebaseService.storage.ref().child('images');
    Reference images = folder.child("$uniquename.jpg");
    try {
      await images.putFile(image);
      downloadurl = await images.getDownloadURL();
      notifyListeners();
      // ignore: avoid_print
      print(downloadurl);
    } catch (e) {
      throw Exception(e);
    }
  }



}
