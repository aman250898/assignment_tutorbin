import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../item_list/item_list.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetolistItem();
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.orange, // navigation bar color
        statusBarColor: Colors.orange,
        statusBarIconBrightness: Brightness.dark // status bar color
    ));

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Image(
              image: AssetImage("images/logo.png"),
            ),
          ),
        ),
      ),
    );
  }

  _navigatetolistItem() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ListItem()));
    });
  }
}
