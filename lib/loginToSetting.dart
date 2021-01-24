import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stores/main.dart';
import 'package:stores/AddItem.dart';
import 'Model/SuppliersModel.dart';
import 'Services/MyServices.dart';

class loginToSetting extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<loginToSetting>{
  home h=new home();
  TextEditingController password=new TextEditingController();
  final formKey1=GlobalKey<FormState>();
  MyServices api=new MyServices();
  Map<String,dynamic>ConfirmUrl;
  bool Confirmurl=true;
  int borderColor=0xffdedede;
  String pass="22@44@99";
  bool passVisibility=false;
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
                  child: Text("تسجيل الدخول",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
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
                            /*  Container(
                                  padding: EdgeInsets.only(
                                  ),
                                  width: MediaQuery.of(context).size.width*.25,
                                  child: Text("كلمة المرور",style: TextStyle(fontSize: 11))),*/
                              SizedBox(height: 10,),
                              Container(
                                width: MediaQuery.of(context).size.width*.92,
                                decoration: BoxDecoration(
                                  borderRadius:BorderRadius.all(Radius.circular(10)),
                                ),
                                child: TextFormField(
                                  textDirection: TextDirection.rtl,
                                  onFieldSubmitted: (value){
                                    FocusScope.of(context).requestFocus(FocusNode());
                                  },
                                  obscureText: passVisibility,
                                  validator: (value){
                                    if(value.isEmpty){
                                      return '';
                                    }
                                    // else if(loginValdite['Message']=="Password is incorrect.");
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 11),
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
                                    hintText: "كلمة المرور",
                                    suffixIcon:InkWell(
                                      child: Icon(passVisibility?Icons.visibility:Icons.visibility_off,color: Colors.black38,),
                                      onTap: (){
                                        setState(() {
                                          passVisibility=!passVisibility;
                                        });
                                      },
                                    ) ,
                                  ),
                                  controller: password,
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
                                        child:   Text("دخول",style: TextStyle(color:Colors.white,fontSize: 12),),
                                      ),
                                      onTap:() async =>{
                                        if(password.text!=""){
                                         if(password.text.trim()==pass){
                                           Navigator.pushNamedAndRemoveUntil(context, "/setting", (route) => false)
                                         }
                                         else{
                                           faild()
                                         }

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
                  Container(alignment: Alignment.center,child: Text(" كلمة المرور خاطئة ",textAlign: TextAlign.center,))
                ],
              ),


            ],),
          ),
        ));
  }
}