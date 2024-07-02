import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return WebNavBar();
        } else {
          return MobileNavBar();
        }
      },
    );
  }
}

class WebNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/netflix.png',
                height: 30,
              ),
              SizedBox(width: 10),
              Text('Movie App'),
            ],
          ),
          Row(
            children: [
              TextButton(onPressed: () {}, child: Text('Home')),
              TextButton(onPressed: () {}, child: Text('About')),
              DropdownButton<String>(
                hint: Text('City'),
                items:
                    <String>['City 1', 'City 2', 'City 3'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}

class MobileNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Movie App'),
      backgroundColor: Colors.transparent,
      elevation: 0,
      // actions: [
      //   IconButton(
      //     icon: Icon(Icons.menu),
      //     onPressed: () {
      //       Scaffold.of(context).openDrawer();
      //     },
      //   ),
      // ],
    );
  }
}
