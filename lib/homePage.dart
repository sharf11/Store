import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stores/main.dart';

class homePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<homePage> {
  home h = new home();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          padding: EdgeInsets.only(
            left: MediaQuery
                .of(context)
                .size
                .width * .05,
            right: MediaQuery
                .of(context)
                .size
                .width * .05,
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/LgoinBG.png"),
                  fit: BoxFit.fill)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * .015,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: InkWell(child: Icon(
                      Icons.logout, color: Color(h.mainColor), size: 30,),
                      onTap: () {
                        showMaterialDialog();
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * .45,),
              GestureDetector(
                  child: Container(
                    //margin: EdgeInsets.only(right: 35,left: 35),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(h.mainColor),
                    ),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * .06,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .65,
                    alignment: Alignment.center,
                    child: Text("أذن استلام",
                      style: TextStyle(color: Colors.white, fontSize: 14),),
                  ),
                  onTap: () async =>
                  {
                    Navigator.pushNamed(context, "/ReceivingPermission"),
                  }
              ),
              SizedBox(height: 20,),
              GestureDetector(
                  child: Container(
                    //margin: EdgeInsets.only(right: 35,left: 35),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(h.mainColor),
                    ),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * .06,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .65,
                    alignment: Alignment.center,
                    child: Text("طباعة باركود",
                      style: TextStyle(color: Colors.white, fontSize: 14),),
                  ),
                  onTap: () async =>
                  {
                    Navigator.pushNamed(context, "/Barcode"),
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }

  showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) =>
            Directionality(
              textDirection: TextDirection.rtl,
              child: new AlertDialog(
                // title: new Text("Material Dialog"),
                content: new Text("هل تريد تسجيل الخروج"),
                actions: <Widget>[
                  FlatButton(
                    child: Text('تـأكيد '),
                    onPressed: () {
                      clearData();
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/login", (route) => false);
                    },
                  ),
                  FlatButton(
                    child: Text('الغاء'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ));
  }
clearData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("userID");
  }
}