import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/post_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
                  backgroundImage: AssetImage('assets/pf.jpg'),
                ),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search',
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: const Icon(Icons.message), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        itemCount: postViewModel.posts.length,
        itemBuilder: (context, index) {
          final post = postViewModel.posts[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(post.username, style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                Image.network(post.imageUrl),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(post.timestamp, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.smart_display_outlined), label: 'Video'),
          BottomNavigationBarItem(icon: Icon(Icons.people_sharp), label: 'My Network'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.business_center_outlined), label: 'Jobs'),
        ],
        currentIndex: 0, // You can use a state management solution to track this
        selectedItemColor: Colors.blue,
        onTap: (index) {
          // Handle navigation here
        },
      ),
    );
  }
}
