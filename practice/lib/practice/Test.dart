import 'package:flutter/material.dart';

class Test1 extends StatefulWidget {
  @override
  _Test1State createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('title'),
        centerTitle: true,
      ),
      body: Center(
        // ignore: deprecated_member_use
        child: RaisedButton(
          color: Colors.amber,
          child: Text(
            'Show SnackBar',
          ),
          onPressed: () {
            final snackBar = SnackBar(
              content: Text('SnackBar!'),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () {},
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
            ),
            ListTile(
              title: Text('1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('3'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('4'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      // bottomSheet: BottomSheet(),
    );
  }
}

class Test2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('title'),
        centerTitle: true,
      ),
      body: Center(
        // ignore: deprecated_member_use
        child: RaisedButton(
          color: Colors.amber,
          child: Text(
            'Show SnackBar',
          ),
          onPressed: () {
            final snackBar = SnackBar(
              content: Text('SnackBar!'),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () {},
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
            ),
            ListTile(
              title: Text('1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('3'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('4'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      // bottomSheet: Container(
      //   child: Row(
      //     children: [
      //       Expanded(child: TextField()),
      //       RaisedButton(child: Text('發送'), onPressed: () {})
      //     ],
      //   ),
      // ),
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Scaffold.of(context).showBottomSheet((context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                color: Colors.amber,
                child: Text('BottomSheet'),
              );
            });
          },
        );
      }),
    );
  }
}
