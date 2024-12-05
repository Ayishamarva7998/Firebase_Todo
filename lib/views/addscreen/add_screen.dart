import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/image_provider.dart';
import 'package:todo_app/services/service.dart';
import 'package:todo_app/views/Listscreen/list_screen.dart';


// ignore: must_be_immutable
class AddScreen extends StatelessWidget {
  

   AddScreen({super.key,});
  TextEditingController namecontroller=TextEditingController();
     TextEditingController agecontroller=TextEditingController();
      TextEditingController rollnocontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ImageProviderr>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back))),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: namecontroller,
                
                decoration: const InputDecoration(
                  labelText: 'Video title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
              controller: agecontroller,
                obscureText: true,
                decoration: const InputDecoration(
                  
                  labelText: 'Details ',
                  border: OutlineInputBorder(),
                ),
                
              ),
              const SizedBox(height: 16,),
              //      TextFormField(
              //       controller:rollnocontroller ,
              //   obscureText: true,
              //   decoration: const InputDecoration(
                  
              //     labelText: '',
              //     border: OutlineInputBorder(),
              //   ),
                
              // ),
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                //   ElevatedButton.icon(
                //     onPressed: () {
                //       pro.setImage(ImageSource.camera);
                //     },
                //     icon: const Icon(Icons.camera_alt),
                //     label: const Text('Take Photo'),
                //   ),
                //   const SizedBox(
                //     width: 14.0,
                //   ),
                //   ElevatedButton.icon(
                //     onPressed: () {
                //       pro.setImage(ImageSource.gallery);
                //     },
                //     icon: const Icon(Icons.photo),
                //     label: const Text('Choose from Gallery'),
                //   ),
                ],
              ),
            if (pro.selectedImage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.file(
                      pro.selectedImage!,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              
              

              const SizedBox(height: 32),
             ElevatedButton(
      onPressed: () async {
        try {
          // Pick a video file
          final result = await FilePicker.platform.pickFiles(
            type: FileType.video,
            allowMultiple: false,
          );

          if (result != null) {
            // Get the selected file
            final file = File(result.files.single.path!);

            // Upload the video to Firebase Storage
            final firebaseService = FirebaseService();
            final String videoUrl =
                await firebaseService.uploadVideoToStorage(file);

            // Optional: Add metadata (e.g., video URL) to Firestore
            await firebaseService.addVideo('recipientId', videoUrl);

            print('Video uploaded successfully: $videoUrl');
          } else {
            print('No file selected');
          }
        } catch (e) {
          print('Error picking or uploading video: $e');
        }

        // Navigate to the ListScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ListScreen(),
          ),
        );
      },
      child:  Container(
        height: 200,width: 200,color: const Color.fromARGB(255, 158, 152, 152),child: Center(child: Text('Upload video')),),
    ),
  
            ],
          ),
        ),
      ),
    );
  }
//   void addstudent(BuildContext context) async {
//     final pro = Provider.of<StudentProvider>(context, listen: false);
//     final provider = Provider.of<ImageProviderr>(context, listen: false);
//    final name = namecontroller.text;
//    final age =agecontroller.text;
//    final rollno = rollnocontroller;
//    await pro.imageAdder(File(provider.selectedImage?.path??''));
//  final student = StudentModel(
//   rollno: rollno.text,
//   age: age,
//   name: name,
//   image: pro.downloadurl,

//  );
//  pro.addStudent(student);
 
//   }
}