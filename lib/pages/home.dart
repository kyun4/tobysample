import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tobysestatephnew/services/authServices.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool toggleDrawerShow = false;

  void toggleDrawer() {
    setState(() => {toggleDrawerShow = !toggleDrawerShow});
  }

  void signOut() {
    final _authService = Provider.of<AuthServices>(context, listen: false);
    _authService.signOut();
  } // signOut()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(15, 17, 16, 16),
        appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                toggleDrawer();
              },
              child: Container(
                  padding: const EdgeInsets.all(5),
                  child: SvgPicture.asset(
                      'assets/svg/hamburger-4-svgrepo-com.svg')),
            ),
            title: Text('Welcome ulet Tobys'),
            centerTitle: true,
            actions: [
              Container(
                  margin: const EdgeInsets.all(10),
                  child: GestureDetector(
                      onTap: () => {signOut()}, child: Icon(Icons.logout)))
            ]),
        drawer: toggleDrawerShow
            ? Drawer(
                child: ListView(padding: EdgeInsets.zero, children: <Widget>[
                DrawerHeader(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Text('Drawer')),
                ListTile(
                    leading: Icon(Icons.settings), title: Text('Settings')),
                ListTile(
                    leading: SvgPicture.asset(
                        'assets/svg/red-heart-svgrepo-com.svg'),
                    title: Text('Favorites')),
              ]))
            : SizedBox.shrink(),
        body: SafeArea(
            child: Container(
                child: Column(children: [
          Container(
              height: 100,
              width: 100,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 28, 17, 17)))
        ]))));
  }
}
