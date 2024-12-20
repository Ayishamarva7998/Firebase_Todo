// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import 'package:todo_app/model/model.dart';
import 'package:todo_app/services/service.dart';

import 'package:todo_app/views/addscreen/add_screen.dart';

import 'package:todo_app/views/listscreen/widgets/video_player_widget.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final FirebaseService _firebaseService = FirebaseService();
  late Future<List<VideoModel>> _videosFuture;

  @override
  void initState() {
    super.initState();
    _videosFuture = _firebaseService.fetchVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: const Text(
          "Videoplayer",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<VideoModel>>(
        future: _videosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading videos'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No videos found'));
          }

          final videos = snapshot.data!;
          return ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider();
            },
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: videos.length,
            itemBuilder: (context, index) {
              return VideoPlayerWidget(videoUrl: videos[index].videoUrl);
            },
          );
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        ),
        child: const Text(
          'Upload videos',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
