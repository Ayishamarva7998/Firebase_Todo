import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/homeprovider.dart';
import 'package:todo_app/model.dart';
import 'package:todo_app/views/Listscreen/listscreen.dart';


// ignore: must_be_immutable
class Addscreen extends StatelessWidget {
  

   Addscreen({super.key,});
  TextEditingController namecontroller=TextEditingController();
     TextEditingController clascontroller=TextEditingController();
      TextEditingController rollnocontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
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
              controller: clascontroller,
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
              ElevatedButton(onPressed: (){}, child: const Row(
                children: [
                  Icon(Icons.photo_camera),
                  SizedBox(width: 90,),
                  Text("Take photo")
                ],
              )),
                    const SizedBox(height: 16,),
              ElevatedButton(onPressed: (){}, child: const Row(
                children: [
                  Icon(Icons.photo_library),
                  SizedBox(width: 90,),
                  Text("Choose from Gallery")
                ],
              )),

              
              

              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  addstudent(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const list(),));
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
   final name = namecontroller.text;
   final cls =clascontroller.text;
   final rollno = rollnocontroller;
  

 final student = StudentModel(
  rollno: rollno.text,
  classs: cls,
  name: name,
  image: '',

 );
 pro.addStudent(student);
 
  }
}