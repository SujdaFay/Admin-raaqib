import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:raaqib_admin_frontend/models/post_model.dart';
import 'package:raaqib_admin_frontend/server/posts_server.dart';
import 'package:raaqib_admin_frontend/style/responsive.dart';
import 'package:raaqib_admin_frontend/widgets/psots_widget.dart';

class RecentPosts extends StatefulWidget {
  const RecentPosts({super.key});
  @override
  State<RecentPosts> createState() => _RecentPostsState();
}

class _RecentPostsState extends State<RecentPosts> {
  late StreamController<List<PostModel>> stream;
  final resentPost = RecentPostSocket().socket;
  List<PostModel> posts = [];

  @override
  void initState() {
    stream = StreamController.broadcast();
    onConnect();
    super.initState();
  }

  onConnect() {
    resentPost.on("rec-posts", (data) {
      if (data == null) return;
      if (data is List) {
        final List<dynamic> rawList = List<dynamic>.from(data);
        List<PostModel> postData =
            rawList.map((m) => PostModel.fromMap(m)).toList();
        posts.addAll(postData);
      } else {
        final postData = PostModel.fromMap(data);
        posts.add(postData);
      }
      // print(posts.isEmpty ? "Its EMpty" : posts.length);
      stream.add(posts);
    });
  }

  @override
  void dispose() {
    // stream.close();
    resentPost.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesk = Responsive.isDesck(context);
    final isTablet = Responsive.isTablet(context);

    // return Placeholder();
    return StreamBuilder<List<PostModel>>(
      stream: stream.stream,
      initialData: <PostModel>[],
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.deepOrange),
          );
        }
        if (snap.hasError) {
          return Center(child: Text('Error: ${snap.error}'));
        }
        if (snap.data == null || snap.data!.isEmpty) {
          return const Center(
            child: Text(
              'No posts so far',
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                isDesk
                    ? 2
                    : isTablet
                    ? 2
                    : 1,
          ),
          itemCount: snap.data?.length ?? 0,
          itemBuilder: (context, i) => PsotsWidget(post: snap.data![i]),
        );
      },
    );
  }
}
