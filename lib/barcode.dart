import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stores/main.dart';

class Barcode extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return _state();
  }
}
class _state extends State<Barcode>{
  home h=new home();
  TextEditingController searchKey=new TextEditingController();
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
                child: Text("طباعة باركود",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("المورد"),
                  SizedBox(width: 10,),
                  Container(
                    height: MediaQuery.of(context).size.height*.055,
                    width: MediaQuery.of(context).size.width*.5,
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.all(Radius.circular(10)),
                    ),
                    child: TextFormField(
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
                        hintText: "المورد",
                      ),
                      controller: searchKey,
                    ),
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                      child: Container(
                        //margin: EdgeInsets.only(right: 35,left: 35),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(h.mainColor),
                        ),
                        height: MediaQuery.of(context).size.height*.05,
                        width: MediaQuery.of(context).size.width*.2,
                        alignment: Alignment.center,
                        child:   Text("بحث",style: TextStyle(color:Colors.white,fontSize: 14),),
                      ),
                      onTap:() async =>{
                      }
                  ),

                ],
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width*.03,
                    right: MediaQuery.of(context).size.width*.03,
                ),
                padding: EdgeInsets.only(
                    top: 3,
                    bottom: 3
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  border: Border.all(color: Colors.black38,width: 1.5)
                ),
                child: Column(
                  children: [
                     Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                              width:MediaQuery.of(context).size.width*.08,
                             child: Text("م")),
                          Container(color: Colors.black38,height: 20,width: 1.0,),
                          Container(
                              alignment: Alignment.center,
                              width:MediaQuery.of(context).size.width*.28,
                              child: Text("الباركود")),
                          Container(color: Colors.black38,height: 20,width: 1.0,),
                          Container(
                              alignment: Alignment.center,
                              width:MediaQuery.of(context).size.width*.28,
                              child: Text("الصنف")),
                          Container(color: Colors.black38,height: 20,width: 1.0,)
                          ,  Container(
                              alignment: Alignment.center,
                              width:MediaQuery.of(context).size.width*.28,
                              child: Text("الكمية")),
                        ],
                      ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context,index){
                    return  Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width*.03,
                        right: MediaQuery.of(context).size.width*.03,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          border: Border.all(color: Colors.black26,width: 1.0)
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(
                                      top: 4,
                                      bottom: 4
                                  ),
                                  alignment: Alignment.center,
                                  width:MediaQuery.of(context).size.width*.08,
                                  child: Text("$index")),
                              Container(color: Colors.black26,height: 25,width: 1.0,),
                              Container(
                                  padding: EdgeInsets.only(
                                      top: 4,
                                      bottom: 4
                                  ),
                                  alignment: Alignment.center,
                                  width:MediaQuery.of(context).size.width*.28,
                                  child: Text("452862DFE",style: TextStyle(fontSize: 12))),
                              Container(color: Colors.black26,height: 25,width: 1.0,),
                              Container(
                                  padding: EdgeInsets.only(
                                      top: 4,
                                      bottom: 4
                                  ),
                                  alignment: Alignment.center,
                                  width:MediaQuery.of(context).size.width*.28,
                                  child: Text("منتج1",style: TextStyle(fontSize: 12))),
                              Container(color: Colors.black26,height: 25,width: 1.0,)
                              ,  Container(
                                  padding: EdgeInsets.only(
                                      top: 4,
                                      bottom: 4
                                  ),
                                  alignment: Alignment.center,
                                  width:MediaQuery.of(context).size.width*.28,
                                  child: Text("20",style: TextStyle(fontSize: 12),)),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                  child: Container(
                    //margin: EdgeInsets.only(right: 35,left: 35),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(h.mainColor),
                    ),
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width*.05,
                        right: MediaQuery.of(context).size.width*.05
                    ),
                    height: MediaQuery.of(context).size.height*.055,
                    width: MediaQuery.of(context).size.width*.5,
                    alignment: Alignment.center,
                    child:   Text("طباعة",style: TextStyle(color:Colors.white,fontSize: 14),),
                  ),
                  onTap:() async =>{
                  }
              ),
              SizedBox(height: 20,)
            ],
          ),
          ),
        ),
      ),
    );
  }
}