import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assets/avatar.jpg',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Davoud Badamchi',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Item1',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {},
          ),
          Divider(
            height: 2,
            color: Colors.blueGrey,
          ),
          ListTile(
            title: Text(
              'Item1',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
