

// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/homeprovider.dart';
import 'package:todo_app/model.dart';
import 'package:todo_app/views/Editscreen/editscreen.dart';
import 'package:todo_app/views/Addscreen/addscreen.dart';


class list extends StatelessWidget {
  const list({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Student Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: Consumer<StudentProvider>(
            builder: (context, value, child) => Column(
              children: [
                StreamBuilder<QuerySnapshot<StudentModel>>(
                  stream: value.getData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Snapshot has error'),
                      );
                    } else {
                      List<QueryDocumentSnapshot<StudentModel>> studentsDoc =
                          snapshot.data?.docs ?? [];
                      return Expanded(
                        child: ListView.builder(
                          itemCount: studentsDoc.length,
                          itemBuilder: (context, index) {
                            final data = studentsDoc[index].data();
                            final id = studentsDoc[index].id;
                            return Card(
                              elevation:
                                  5, // Add elevation for a card-like look
                              margin: const EdgeInsets.all(8),
                              child: ListTile(
                                title: Text(
                                  data.name ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Age: ${data.rollno ?? 'N/A'}",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "Class: ${data.classs ?? 'N/A'}",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: Colors.deepPurple,
                                  backgroundImage: NetworkImage(data.image!),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () {
                                        value.updateStudent(id, StudentModel(image: '',classs: '',name: '',rollno: ''));
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => EditScreen(

                                              id: id,
                                              student: data,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        value.deleteStudent(id);
                                        // value.deleteImage(data.image);
                                      },
                                    ),
                                    // const Icon(
                                    //   Icons.arrow_forward_ios,
                                    //   color: Colors.deepPurple,
                                    // ),
                                  ],
                                ),
                                // onTap: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) =>
                                //           DetailScreen(student: data),
                                //     ),
                                //   );
                                // },
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ]),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Addscreen(),
            ),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
        ),
        child: const Text(
          'Add',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
