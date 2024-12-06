import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/image_provider.dart';
import 'package:todo_app/services/service.dart';
import 'package:todo_app/views/Listscreen/list_screen.dart';

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ImageProviderr>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            color: const Color.fromARGB(255, 119, 115, 115),
          ),
          backgroundColor: Colors.black,
          elevation: 10,
          title: const Text(
            'Upload Video',
            style: TextStyle(
                color: Color.fromARGB(255, 179, 170, 170),
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Section
                const SizedBox(height: 20),
                const Text(
                  'Share Your Video',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Share your awesome content by uploading a video.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 30),

             
                if (pro.selectedImage != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          gradient: const LinearGradient(
                            colors: [
                              Colors.red,
                              Color.fromARGB(255, 122, 23, 16)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 4,
                              blurRadius: 10,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Image.file(
                          pro.selectedImage!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

            
                const SizedBox(height: 30),
                const Text(
                  'Select a Video to Upload',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 119, 115, 115)),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Choose a video from your device to upload.',
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 119, 115, 115)),
                ),
                const SizedBox(height: 20),

               
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      try {
                      
                        final result = await FilePicker.platform.pickFiles(
                          type: FileType.video,
                          allowMultiple: false,
                        );

                        if (result != null) {
                          
                          final file = File(result.files.single.path!);

                         
                          final firebaseService = FirebaseService();
                          final String videoUrl =
                              await firebaseService.uploadVideoToStorage(file);

                          await firebaseService.addVideo(
                              'recipientId', videoUrl);

                          print('Video uploaded successfully: $videoUrl');
                        } else {
                          print('No file selected');
                        }
                      } catch (e) {
                        print('Error picking or uploading video: $e');
                      }

                  
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 300,
                      height: 55,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.red,
                            Color.fromARGB(255, 96, 17, 12)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Upload Video',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.grey,
                        size: 18,
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
