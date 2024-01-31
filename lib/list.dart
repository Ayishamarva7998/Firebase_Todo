import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Student Details")),

        body: ListView.builder(
          itemCount: 5, 
     
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                leading: CircleAvatar(radius: 30),
                title: Text('Student $index'),
                subtitle: Text('Class: 10th Grade'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                     
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete,color: const Color.fromARGB(255, 122, 30, 24),),
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


