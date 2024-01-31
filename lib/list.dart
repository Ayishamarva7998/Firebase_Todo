import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ListPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Student Details")),

        body: ListView.builder(
          itemCount: 5, 
     
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                leading: const CircleAvatar(radius: 30),
                title: Text('Student $index'),
                subtitle: const Text('Class: 10th Grade'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                     
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete,color: Color.fromARGB(255, 122, 30, 24),),
                      onPressed: () {
            
                      },
                    ),
                  ],
                ),
              
              ),
            );
          },
        ),
      ),
    );
  }
}


