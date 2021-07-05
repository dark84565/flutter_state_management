import 'package:flutter/material.dart';
import 'package:practice/main.dart';

class RouteExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RouteExample'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/Screen1', arguments: 'RouteExample');
              },
              child: Text('跳轉至 Screen1'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/Screen2');
              },
              child: Text('跳轉至 Screen2'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/Screen3');
              },
              child: Text('跳轉至 Screen3'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/Screen4');
              },
              child: Text('跳轉至 Screen4'),
            ),
          ],
        ),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String routeResource = ModalRoute.of(context).settings.arguments;
    // 用ModalRoute.of方法接收argument傳值
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen1'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('來自 $routeResource 頁面'),
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/Screen2', arguments: 'Screen1');
              },
              child: Text('跳轉至 Screen2'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/Screen3', arguments: 'Screen1');
              },
              child: Text('跳轉至 Screen3'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/Screen4', arguments: 'Screen1');
              },
              child: Text('跳轉至 Screen4'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/Screen2');
              },
              child: Text('跳轉至 Screen2 並刪除此頁面'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed('/Screen3');
              },
              child: Text('跳轉至 Screen3 並刪除此頁面'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Screen4()));
              },
              child: Text('跳轉至 Screen4 並刪除此頁面'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).popUntil(ModalRoute.withName('/'));
              },
              child: Text('popUntil回到首頁'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                    (Route route) {
                  //可設定停止pop的頁面，利用route.settings?.name == "自訂頁面"，返回true。
                  return false;
                });
              },
              child: Text('pushAndRemoveUntil回到首頁'),
            ),
          ],
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String routeResource = ModalRoute.of(context).settings.arguments;
    // 用ModalRoute.of方法接收argument傳值
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('來自 $routeResource 頁面'),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/Screen1', arguments: 'Screen2');
              },
              child: Text('跳轉至 Screen1'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/Screen3', arguments: 'Screen2');
              },
              child: Text('跳轉至 Screen3'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/Screen4', arguments: 'Screen2');
              },
              child: Text('跳轉至 Screen4'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/Screen1');
              },
              child: Text('跳轉至 Screen1 並刪除此頁面'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed('/Screen3');
              },
              child: Text('跳轉至 Screen3 並刪除此頁面'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Screen4()));
              },
              child: Text('跳轉至 Screen4 並刪除此頁面'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).popUntil(ModalRoute.withName('/'));
              },
              child: Text('popUntil回到首頁'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                    (Route route) {
                  //可設定停止pop的頁面，利用route.settings?.name == "自訂頁面"，返回true。
                  return false;
                });
              },
              child: Text('pushAndRemoveUntil回到首頁'),
            ),
          ],
        ),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String routeResource = ModalRoute.of(context).settings.arguments;
    // 用ModalRoute.of方法接收argument傳值
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen3'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('來自 $routeResource 頁面'),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/Screen1', arguments: 'Screen3');
              },
              child: Text('跳轉至 Screen1'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/Screen2', arguments: 'Screen3');
              },
              child: Text('跳轉至 Screen2'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/Screen4', arguments: 'Screen3');
              },
              child: Text('跳轉至 Screen4'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/Screen1');
              },
              child: Text('跳轉至 Screen1 並刪除此頁面'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed('/Screen2');
              },
              child: Text('跳轉至 Screen1 並刪除此頁面'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Screen4()));
              },
              child: Text('跳轉至 Screen4 並刪除此頁面'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).popUntil(ModalRoute.withName('/'));
              },
              child: Text('popUntil回到首頁'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                    (Route route) {
                  //可設定停止pop的頁面，利用route.settings?.name == "自訂頁面"，返回true。
                  return false;
                });
              },
              child: Text('pushAndRemoveUntil回到首頁'),
            ),
          ],
        ),
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String routeResource = ModalRoute.of(context).settings.arguments;
    // 用ModalRoute.of方法接收argument傳值
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen4'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('來自 $routeResource 頁面'),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/Screen1', arguments: 'Screen4');
              },
              child: Text('跳轉至 Screen1'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/Screen2', arguments: 'Screen4');
              },
              child: Text('跳轉至 Screen2'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/Screen3', arguments: 'Screen4');
              },
              child: Text('跳轉至 Screen3'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/Screen1');
              },
              child: Text('跳轉至 Screen1 並刪除此頁面'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed('/Screen2');
              },
              child: Text('跳轉至 Screen2 並刪除此頁面'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Screen3()));
              },
              child: Text('跳轉至 Screen3 並刪除此頁面'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).popUntil(ModalRoute.withName('/'));
              },
              child: Text('popUntil回到首頁'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                    (Route route) {
                  //可設定停止pop的頁面，利用route.settings?.name == "自訂頁面"，返回true。
                  return false;
                });
              },
              child: Text('pushAndRemoveUntil回到首頁'),
            ),
          ],
        ),
      ),
    );
  }
}
