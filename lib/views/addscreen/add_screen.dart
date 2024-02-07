import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/Student_provider.dart';
import 'package:todo_app/controllers/imageprovider.dart';
import 'package:todo_app/model.dart';
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
        }, icon: Icon(Icons.arrow_back))),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: namecontroller,
                
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
              controller: agecontroller,
                obscureText: true,
                decoration: const InputDecoration(
                  
                  labelText: 'Class',
                  border: OutlineInputBorder(),
                ),
                
              ),
              const SizedBox(height: 16,),
                   TextFormField(
                    controller:rollnocontroller ,
                obscureText: true,
                decoration: const InputDecoration(
                  
                  labelText: 'Roll no',
                  border: OutlineInputBorder(),
                ),
                
              ),
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      pro.setImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Take Photo'),
                  ),
                  const SizedBox(
                    width: 14.0,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pro.setImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.photo),
                    label: const Text('Choose from Gallery'),
                  ),
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
                onPressed: () {
                  addstudent(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ListScreen(),));
                },
                style: ElevatedButton.styleFrom(
          
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: 
                  Text(
                    'Save',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void addstudent(BuildContext context) async {
    final pro = Provider.of<StudentProvider>(context, listen: false);
    final provider = Provider.of<ImageProviderr>(context, listen: false);
   final name = namecontroller.text;
   final age =agecontroller.text;
   final rollno = rollnocontroller;

   await pro.imageAdder(File(provider.selectedImage!.path));

 final student = StudentModel(
  rollno: rollno.text,
  age: age,
  name: name,
  image: pro.downloadurl,

 );
 pro.addStudent(student);
 
  }
}