import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stores/barcode.dart';
import 'package:stores/setting.dart';

import 'AddItem.dart';
import 'ReceivingPermission.dart';
import 'homePage.dart';
import 'login.dart';
import 'loginToSetting.dart';
void main() {
  runApp(ParentPage());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}
class home extends StatelessWidget {
  int mainColor=0xff4343DE;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
          fontFamily: '29ltbukra'
      ),
      debugShowCheckedModeBanner: false,
      routes: <String,WidgetBuilder>{
        '/login':(BuildContext context)=>new login(),
        '/homePage':(BuildContext context)=>new homePage(),
        '/Barcode':(BuildContext context)=>new Barcode(),
        '/ReceivingPermission':(BuildContext context)=>new ReceivingPermission(),
        '/setting':(BuildContext context)=>new setting(),
        '/loginToSetting':(BuildContext context)=>new loginToSetting(),
      },
      home: _State.userId==null?login():homePage(),

    );
  }

}
class ParentPage extends StatefulWidget {
  static int counter;
  @override
  _State createState() => _State();
}

class _State extends State<ParentPage>
{
  static String userId;
  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId=prefs.get('userID');
    });
    print("$userId lllllllllllllllllllllllllllllllllllllllllllllllll");
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
  return home();
  }}