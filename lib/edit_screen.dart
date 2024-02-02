import 'package:flutter/material.dart';
import 'package:todo_app/list.dart';

class editscreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const editscreen({Key? key});

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
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  
                  labelText: 'Class',
                  border: OutlineInputBorder(),
                ),
                
              ),
              const SizedBox(height: 16,),
                   TextFormField(
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ListPage(),));
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
}

