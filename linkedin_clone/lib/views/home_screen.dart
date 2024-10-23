import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/post_view_model.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';
import 'package:lining_drawer/lining_drawer.dart';

class HomePage extends StatelessWidget {
  final LiningDrawerController _controller = LiningDrawerController(); 
  final ScrollController _scrollController = ScrollController();

  HomePage({super.key}); 

  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            InkWell(
              onTap: () {
                _controller.toggleDrawer();
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/1.jpg'),
              ),
            ),
            const SizedBox(width: 8),
            const Expanded(
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
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BlankPage(pageName: 'Notifications')),
              );
            },
          ),
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
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/1.jpg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const BlankPage(pageName: 'Like')));
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.comment_outlined),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const BlankPage(pageName: 'Comment')));
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.replay),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const BlankPage(pageName: 'Share')));
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const BlankPage(pageName: 'Send')));
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool isRTL = false;
  final LiningDrawerController _controller = LiningDrawerController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context);

    final List<Widget> pages = [
      HomePage(),
      const Center(child: Text('Video Page')),
      const Center(child: Text('My Network')),
      const Center(child: Text('Notifications')),
      const Center(child: Text('Jobs')),
    ];

    void onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return LiningDrawer(
      direction: isRTL ? DrawerDirection.fromRightToLeft : DrawerDirection.fromLeftToRight,
      controller: _controller,
      drawer: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              color: Colors.blue,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      _controller.toggleDrawer();
                    },
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('assets/1.jpg'),
                      radius: 30,
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
            const Divider(color: Colors.white),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: const Text('Profile'),
                    onTap: () {
                      _controller.toggleDrawer();
                      // Navigate to Profile
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings, color: Colors.black),
                    title: const Text('Settings'),
                    onTap: () {
                      _controller.toggleDrawer();
                      // Navigate to Settings
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.info, color: Colors.black),
                    title: const Text('About'),
                    onTap: () {
                      _controller.toggleDrawer();
                      // Navigate to About
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
          title: const Text("LinkedIn"),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _controller.toggleDrawer();
            },
          ),
        ),
        body: pages[_selectedIndex],
        bottomNavigationBar: ScrollToHide(
          scrollController: _scrollController,
          height: 50,
          hideDirection: Axis.vertical,
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.video_library), label: 'Video'),
              BottomNavigationBarItem(icon: Icon(Icons.group), label: 'My Network'),
              BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
              BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Jobs'),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            onTap: onItemTapped,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}

class BlankPage extends StatelessWidget {
  final String pageName;

  const BlankPage({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageName),
      ),
      body: Center(
        child: Text(
          'This is the $pageName page.',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
