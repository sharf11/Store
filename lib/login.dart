import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stores/Services/MyServices.dart';
import 'package:stores/main.dart';
class login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return  _State();
  }

}
class _State extends State<login>{
  setData(String key,String value)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
  home h=new home();
  String Message="";
  bool enableBtn=true;
  MyServices api=new MyServices();
  Map<String ,dynamic> data;
  TextEditingController username =new TextEditingController();
  TextEditingController password=new TextEditingController();
  final formKey=GlobalKey<FormState>();
  bool passVisibility=true;
  final passwordNode=FocusNode();
  String url;
  loadUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      url=prefs.get("url");
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUrl();
  }
  @override
  Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          //height: MediaQuery.of(context).size.height,
          /*padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width*.07,
            right: MediaQuery.of(context).size.width*.07,
          ),*/
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/LgoinBG.png"), fit: BoxFit.fill)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*.18,),
              Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*.07,
                  right: MediaQuery.of(context).size.width*.07,
                ),
                  child: Text("تسجيل الدخول",style: TextStyle(decoration: TextDecoration.none,fontSize: 17,fontWeight:FontWeight.bold,color: Color(h.mainColor)),)),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*.07,
                  right: MediaQuery.of(context).size.width*.07,
                ),
                child: Container(

                  height: 2.0,
                  margin: EdgeInsets.zero,
                  width: MediaQuery.of(context).size.width*.35,
                  color: Color(h.mainColor),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width*.07,
                    right: MediaQuery.of(context).size.width*.07,
                  ),
                  child: Text("مرحبــا بــــك",textAlign: TextAlign.right,style: TextStyle(color: Colors.black54,fontSize: 15,decoration: TextDecoration.none,),)),
              SizedBox(height: MediaQuery.of(context).size.height*.12,),
              Expanded(
                child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Container(

                        child:Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width*.1,
                                right: MediaQuery.of(context).size.width*.1,
                              ),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width*.9,
                                      decoration: BoxDecoration(
                                        borderRadius:BorderRadius.all(Radius.circular(10)),
                                      ),

                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        onFieldSubmitted: (value){
                                          FocusScope.of(context).requestFocus(passwordNode);
                                        },
                                        validator: (value){
                                          if(value.isEmpty){
                                            return '';
                                          }
                                          return null;
                                        },
                                        //textDirection: lang=="ar"?TextDirection.rtl:TextDirection.ltr,
                                        decoration: InputDecoration(
                                          errorStyle: TextStyle(fontSize: 0),
                                            contentPadding: EdgeInsets.only(right: 15,left: 15,top: 0,bottom: 0),
                                            enabledBorder: new OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colors.black12)
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
                                            hintText:'اسم المستخدم' ,
                                            hintStyle: TextStyle(color: Colors.black38)
                                        ),
                                        controller: username,
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Container(
                                      width: MediaQuery.of(context).size.width*.92,
                                      decoration: BoxDecoration(
                                        borderRadius:BorderRadius.all(Radius.circular(10)),
                                      ),
                                      child: TextFormField(
                                        onFieldSubmitted: (value){
                                          FocusScope.of(context).requestFocus(FocusNode());
                                        },
                                        focusNode: passwordNode,
                                        obscureText: passVisibility,
                                        validator: (value){
                                          if(value.isEmpty){
                                            return '';
                                          }
                                          // else if(loginValdite['Message']=="Password is incorrect.");
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          errorStyle: TextStyle(fontSize: 0),
                                          contentPadding: EdgeInsets.only(right: 15,left: 15,top: 0,bottom: 0),
                                          enabledBorder: new OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide(color: Colors.black12)
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

                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*.025,),
                            Text("$Message",style: TextStyle(fontSize: 13,color: Message=="Message"?Colors.white:Colors.red),),
                            SizedBox(height: MediaQuery.of(context).size.height*.025,),
                            GestureDetector(
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width*.1,
                                    right: MediaQuery.of(context).size.width*.1,
                                  ),
                                  decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: enableBtn?Color(h.mainColor):Colors.black12,
                                  ),
                                  height: MediaQuery.of(context).size.height*.06,
                                  width: MediaQuery.of(context).size.width*.9,
                                  alignment: Alignment.center,
                                  child:   Text("تسجيل الدخول",style: TextStyle(color:Colors.white,fontSize: 14),),
                                ),
                                onTap:() async =>{
                                if(url!=null){
                                  if(formKey.currentState.validate()){
                                    if(enableBtn){
                                      setState((){
                                        enableBtn=false;
                                      }),
                                      data=await api.loginServices(username.text.trim(), password.text.trim(),url),
                                      if(data["StatusCode"]==200)
                                        {
                                          setData("userID", data["Message"]["UserID"].toString()),
                                          Navigator.pushNamedAndRemoveUntil(context, "/homePage", (route) => false)
                                        }
                                      else{
                                        setState((){
                                          Message=data["Message"];
                                          enableBtn=true;
                                        }),
                                      }
                                    }

                                  }
                                }else{
                                  faild()
                                }
                                }
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*.01,),
                            Divider(color: Colors.black12,thickness: 1.0,),
                            SizedBox(height: MediaQuery.of(context).size.height*.01,),
                            GestureDetector(
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width*.1,
                                    right: MediaQuery.of(context).size.width*.1,
                                  ),
                                  //margin: EdgeInsets.only(right: 35,left: 35),
                                  decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(h.mainColor),
                                  ),
                                  height: MediaQuery.of(context).size.height*.06,
                                  width: MediaQuery.of(context).size.width*.9,
                                  alignment: Alignment.center,
                                  child:   Text("الاعدادت",style: TextStyle(color:Colors.white,fontSize: 14),),
                                ),
                                onTap:() =>{
                                  Navigator.pushNamed(context, "/loginToSetting"),
                               }
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*.08,),

                          ],
                        ),
                      )
                    ],
                  ),

              )

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
                  Container(alignment: Alignment.center,child: Text("قم بضبط الاعدادات",textAlign: TextAlign.center,))
                ],
              ),


            ],),
          ),
        ));
  }
}