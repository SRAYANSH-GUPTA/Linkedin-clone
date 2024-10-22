import 'package:flutter/material.dart';
import 'package:lining_drawer/lining_drawer.dart';

class CustomDrawer extends StatelessWidget {
  final LiningDrawerController controller;

  const CustomDrawer({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Drawer Header
          Container(
            padding: const EdgeInsets.all(20.0),
            color: Colors.blue,
            child: Row(
              children: [
                InkWell(
                  onTap: () => controller.toggleDrawer(),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/pf.jpg'),
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
          const Divider(color: Colors.white),
          // Drawer Options
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: const Text('Profile'),
                  onTap: () {
                    controller.toggleDrawer(); // Close drawer
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.business, color: Colors.black),
                  title: const Text('My Network'),
                  onTap: () {
                    controller.toggleDrawer(); // Close drawer
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.notifications, color: Colors.black),
                  title: const Text('Notifications'),
                  onTap: () {
                    controller.toggleDrawer(); // Close drawer
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.black),
                  title: const Text('Settings'),
                  onTap: () {
                    controller.toggleDrawer(); // Close drawer
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
