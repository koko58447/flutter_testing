import 'package:flutter/material.dart';
import 'package:testing/appbardesign/transparant_appbar.dart';
import 'package:testing/main.dart';

class AppBarPage extends StatefulWidget {
  @override
  _AppBarPageState createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: Text("App Bar"),
            centerTitle: true,
            titleSpacing: 0,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TransparentAppbarPage()));
                },
                icon: Icon(Icons.notifications_none),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
            ],
            elevation: 0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //   colors: [Colors.green, Colors.red],
                  //   begin: Alignment.bottomRight,
                  //   end: Alignment.topLeft,
                  // )

                  image: DecorationImage(
                image: AssetImage("assets/forest2.jpg"),
                fit: BoxFit.cover,
              )),
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              isScrollable: true,
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Home'),
                Tab(icon: Icon(Icons.list_alt), text: 'Feed'),
                Tab(icon: Icon(Icons.person), text: 'Profile'),
                Tab(icon: Icon(Icons.settings), text: 'Settings'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              buildPage("Home Page"),
              buildPage("Feed Page"),
              buildPage("Profile Page"),
              buildPage("Setting Page"),
            ],
          )),
    );
  }

  Widget buildPage(String text) {
    return Center(
      child: Text(text, style: TextStyle(fontSize: 28)),
    );
  }
}
