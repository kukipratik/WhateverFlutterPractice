import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const Text("HomePage!!!"),
        iconTheme: const IconThemeData.fallback(),
      ),
      drawer: Drawer(
          backgroundColor: Colors.purple,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(13.0),
                // for my detail...
                child: ClayContainer(
                  color: Colors.purple,
                  width: 100,
                  height: 160,
                  depth: 60,
                  child: const UserAccountsDrawerHeader(
                    accountName: Text("Pratik Lama"),
                    accountEmail: Text("Kukipratik123@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("images/ourLuffy.jpg"),
                    ),
                  ),
                ),
              ),
              // list tile 1....
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: ClayContainer(
                  color: Colors.purple,
                  width: 100,
                  height: 70,
                  depth: 60,
                  child: ListTile(
                    leading: const Icon(
                      CupertinoIcons.home,
                      color: Colors.white,
                    ),
                    isThreeLine: false,
                    title: const Text(
                      "Home",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    subtitle: const Text(
                      "Go to home.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    trailing: const Icon(
                      CupertinoIcons.gobackward,
                      color: Colors.white,
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              // list tile 2...
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: ClayContainer(
                  color: Colors.purple,
                  width: 100,
                  height: 70,
                  depth: 60,
                  child: ListTile(
                    leading: const Icon(
                      Icons.contacts,
                      color: Colors.white,
                    ),
                    isThreeLine: false,
                    title: const Text(
                      "Contact Me",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    subtitle: const Text(
                      "9824819610",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    trailing: const Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                    onTap: () {},
                  ),
                ),
              )
            ],
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [],
        ),
      ),
    ));
  }
}
