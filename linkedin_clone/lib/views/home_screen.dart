import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/post_view_model.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';
import 'package:lining_drawer/lining_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool isRTL = false;
  final LiningDrawerController _controller = LiningDrawerController();

  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context);

    return LiningDrawer(
      direction: isRTL ? DrawerDirection.fromRightToLeft : DrawerDirection.fromLeftToRight,
      controller: _controller,
      drawer: SafeArea(
        child: Column(
          children: [
            // Drawer Header
            Container(
              padding: const EdgeInsets.all(20.0),
              color: Colors.blue,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      _controller.toggleDrawer();
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/1.jpg'), 
                      radius: 30,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Srayansh Gupta",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Ajay Kumar Garg Engineering College",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          "Your Tagline or Position",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.white), // Divider below the header
            // Drawer Options
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero, // Remove default padding
                children: [
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: const Text('Profile'),
                    onTap: () {
                      _controller.toggleDrawer(); // Close drawer when selecting an option
                      // Navigate to Profile
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.business, color: Colors.black),
                    title: const Text('My Network'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BlankPage()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.notifications, color: Colors.black),
                    title: const Text('Notifications'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BlankPage()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings, color: Colors.black),
                    title: const Text('Settings'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BlankPage()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              InkWell(
                onTap: () {
                  _controller.toggleDrawer();
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/1.jpg'),
                ),
              ),
              const SizedBox(width: 8),
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
            IconButton(icon: const Icon(Icons.notifications), onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BlankPage()));
            }),
            IconButton(icon: const Icon(Icons.message), onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BlankPage()));
            }),
          ],
        ),
        body: ListView.builder(
          controller: _scrollController,
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
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage("assets/1.jpg"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left:10),
                          child: Text(
                            post.username,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      post.content,
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                  Image.asset(post.imageUrl),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      post.timestamp,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.thumb_up_alt_outlined),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BlankPage()));
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.comment_outlined),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BlankPage()));
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.replay),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BlankPage()));
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BlankPage()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: ScrollToHide(
          scrollController: _scrollController,
          height: 50,
          hideDirection: Axis.vertical,
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.blue),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.smart_display_outlined, color: Colors.blue),
                label: 'Video',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_sharp, color: Colors.blue),
                label: 'My Network',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications, color: Colors.blue),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business_center_outlined, color: Colors.blue),
                label: 'Jobs',
              ),
            ],
            unselectedItemColor: Colors.blue,
            selectedItemColor: Colors.black,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}


class BlankPage extends StatelessWidget {
  BlankPage({super.key});
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blank Page"),
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Text("This is the second route", style: TextStyle(color: Colors.white)),
      ),
      bottomNavigationBar: ScrollToHide(
          scrollController: _scrollController,
          height: 50,
          hideDirection: Axis.vertical,
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.blue),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.smart_display_outlined, color: Colors.blue),
                label: 'Video',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_sharp, color: Colors.blue),
                label: 'My Network',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications, color: Colors.blue),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business_center_outlined, color: Colors.blue),
                label: 'Jobs',
              ),
            ],
            unselectedItemColor: Colors.blue,
            selectedItemColor: Colors.black,
            backgroundColor: Colors.white,
          ),
        ),
    );
  }
}
