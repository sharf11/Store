import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stores/main.dart';
import 'package:stores/AddItem.dart';
import 'Model/SuppliersModel.dart';
import 'Services/MyServices.dart';

class setting extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<setting>{
  home h=new home();
  TextEditingController Url=new TextEditingController();
  final formKey1=GlobalKey<FormState>();
  MyServices api=new MyServices();
  Map<String,dynamic>ConfirmUrl;
  bool Confirmurl=true;
  static String userId;
  int borderColor=0xffdedede;
/*  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    data=await api.allSuppliers();
    setState(() {
      userId=prefs.get('userID');
    });
    print(data);
    print("00000000000000000000000000000000000000");
  }*/
  setData(String key,String value)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //this.loadData();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*.075,
                  color: Color(h.mainColor),
                  alignment: Alignment.center,
                  child: Text("الاعدادات",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 50,),

                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width*.05,
                            right: MediaQuery.of(context).size.width*.05
                        ),
                        padding: EdgeInsets.only(left: 15,right: 15),
                        decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            border: Border.all(color: Colors.black12,width: 1.0)
                        ),
                        child: Form(
                          key: formKey1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Container(
                                  padding: EdgeInsets.only(
                                  ),
                                  width: MediaQuery.of(context).size.width*.25,
                                  child: Text("رابط النسخة",style: TextStyle(fontSize: 11))),
                              SizedBox(height: 10,),
                              Container(
                                padding: EdgeInsets.only(
                                  //left: 20,
                                  // right: MediaQuery.of(context).size.width*.02
                                ),
                                height: MediaQuery.of(context).size.height*.05,
                                width: MediaQuery.of(context).size.width*.9,
                                decoration: BoxDecoration(
                                  borderRadius:BorderRadius.all(Radius.circular(10)),

                                ),
                                child: TextFormField(
                                  minLines: 1,
                                  maxLines: 2,
                                  style: TextStyle(fontSize: 10),
                                  onFieldSubmitted: (value){
                                    FocusScope.of(context).requestFocus(FocusNode());
                                  },
                                  validator: (val){
                                    if(val.isEmpty)
                                      return "";
                                    return null;
                                  },
                                  onChanged: (val) async {
                                    /*setState(() {
                                          data1.name=confirmSupplierByCode["Message"]["SupplierNAME"];
                                          data1.supplierId=confirmSupplierByCode["Message"]["SupplierID"];
                                        });
*/
                                  },
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(fontSize: 0),
                                    contentPadding: EdgeInsets.only(right: 15,left: 15,top: 0,bottom: 0),
                                    enabledBorder: new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Color(borderColor))
                                    ),
                                    focusedBorder:  new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.blue)
                                    ),
                                    focusedErrorBorder:new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.red)
                                    ),
                                    errorBorder:new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.red)
                                    ),
                                    hintText: "",
                                  ),
                                  controller: Url,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Divider(color: Colors.black12,height: 1.0,),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                      child: Container(
                                        decoration:BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Confirmurl?Color(h.mainColor):Color(h.mainColor).withOpacity(.5),
                                        ),
                                        height: MediaQuery.of(context).size.height*.045,
                                        width: MediaQuery.of(context).size.width*.5,
                                        alignment: Alignment.center,
                                        child:   Text("تــأكيد الرابط",style: TextStyle(color:Colors.white,fontSize: 11),),
                                      ),
                                      onTap:() async =>{
                                        if(Url.text!=""){
                                          ConfirmUrl=await api.checkUrl(Url.text.trim()),
                                          if(ConfirmUrl["StatusCode"]==200){
                                            succes(),
                                            setData("url", Url.text.trim()),
                                         Timer(Duration(seconds: 2), ()=>Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false)),
                                          }else{
                                            faild()
                                          },

                                        }else{
                                          setState((){
                                            borderColor=0xfff00f00;
                                          })
                                        }
                                      }
                                  ),

                                ],
                              ),
                              SizedBox(height: 10,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.15,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  succes() {
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
          child:  Container(height: 130.0,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12,width: 2.0)
            ),
            child: Stack(children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center
                ,crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.check_circle,color: Color(h.mainColor),size: 50),
                  SizedBox(height: 10,),
                  Container(alignment: Alignment.center,child: Text("تمت اضافة الرابط ",textAlign: TextAlign.center,))
                ],
              ),


            ],),
          ),
        ));
  }
  faild() {
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
          child:  Container(height: 130.0,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12,width: 2.0)
            ),
            child: Stack(children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center
                ,crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.clear,color: Color(h.mainColor),size: 50),
                  SizedBox(height: 10,),
                  Container(alignment: Alignment.center,child: Text("رابط خاطئ ",textAlign: TextAlign.center,))
                ],
              ),


            ],),
          ),
        ));
  }
}