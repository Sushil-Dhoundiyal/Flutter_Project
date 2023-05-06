import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://www.google.com/imgres?imgurl=https%3A%2F%2Fstorage.googleapis.com%2Fcms-storage-bucket%2F70760bf1e88b184bb1bc.png&tbnid=TmThSb21aih5sM&vet=12ahUKEwimjNn567L-AhV1juYKHUl_D5wQMygEegUIARDJAQ..i&imgrefurl=https%3A%2F%2Fflutter.dev%2F&docid=-AyL7-iBRb3f3M&w=937&h=461&q=flutter%20developer&ved=2ahUKEwimjNn567L-AhV1juYKHUl_D5wQMygEegUIARDJAQ";

    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                // decoration: BoxDecoration(color: Colors.red),
                accountName: Text('Sushil Dhoundiyal'),
                accountEmail: Text('flutter123@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
                ),
                title: Text('Home',
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.white),
                ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
                ),
                title: Text('profile',
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.white),
                ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
                ),
                title: Text('email',
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.white),
                ),
            )
          ],
        ),
      ),
    );
  }
}
