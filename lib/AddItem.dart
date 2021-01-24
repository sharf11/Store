import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stores/Services/MyServices.dart';
import 'package:toast/toast.dart';

import 'main.dart';

class AddItem extends StatefulWidget{
  var SupplierCode;
  var SupplierName;
  var OrderId;
  var OrderNumber;
  var OrderDate;
  AddItem(var SupplierCode,var SupplierName,var OrderId,var OrderNumber,var OrderDate){
    this.OrderNumber=OrderNumber;
    this.OrderDate=OrderDate;
    this.SupplierName=SupplierName;
    this.SupplierCode=SupplierCode;
    this.OrderId=OrderId;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State(this.SupplierCode,this.SupplierName,this.OrderId,this.OrderNumber,this.OrderDate);
  }
}
class _State extends State<AddItem>{
  bool confirmEndOrderBtn=true;
  bool confirmAddItemBtn=true;
  var SupplierCode;
  var SupplierName;
  var OrderId;
  var OrderNumber;
  var OrderDate;
  _State(var SupplierCode,var SupplierName, var OrderId,var OrderNumber,var OrderDate){
    this.OrderNumber=OrderNumber;
    this.OrderDate=OrderDate;
    this.SupplierName=SupplierName;
    this.SupplierCode=SupplierCode;
    this.OrderId=OrderId;
  }
  home h=new home();
  final formKey=GlobalKey<FormState>();
  TextEditingController barcode=new TextEditingController();
  TextEditingController productName=new TextEditingController();
  TextEditingController unit=new TextEditingController();
  TextEditingController quantity=new TextEditingController();
  TextEditingController recieve=new TextEditingController();
  TextEditingController bones=new TextEditingController();
  TextEditingController cost=new TextEditingController();
  TextEditingController total=new TextEditingController();
  FocusNode N1=new FocusNode();
  FocusNode N2=new FocusNode();
  FocusNode N3=new FocusNode();
  FocusNode N4=new FocusNode();
  FocusNode N5=new FocusNode();
  FocusNode N6=new FocusNode();
  FocusNode N7=new FocusNode();
  bool confirmBtn=true;
  bool addBtn=false;
  int BorderColor=0xffdedede;
  bool disablBarcode=true;
  Map<String ,dynamic>confirmBarcode;
  Map<String ,dynamic>NewItem;
  MyServices api=new MyServices();
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
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*.075,
                  color: Color(h.mainColor),
                  alignment: Alignment.center,
                  child: Text("أضافة عنصر ",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1.0,color: Colors.black12)
                        ),
                        margin: EdgeInsets.only(
                          top: 7,
                          bottom: 7,
                          left:  MediaQuery.of(context).size.width*.05,
                          right: MediaQuery.of(context).size.width*.05
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 8,),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(
                                        right: 20
                                    ),
                                    width: MediaQuery.of(context).size.width*.28,
                                    child: Text("أسم المورد",style: TextStyle(fontSize: 11),)),
                                //SizedBox(width: 20,),
                                Container(
                                  margin: EdgeInsets.only(
                                     // left: MediaQuery.of(context).size.width*.05
                                    //   right: MediaQuery.of(context).size.width*.02
                                  ),
                                  height: MediaQuery.of(context).size.height*.04,
                                  width: MediaQuery.of(context).size.width*.59,
                                  decoration: BoxDecoration(
                                      borderRadius:BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(width: 1.0,color: Colors.black12),
                                      color: Colors.black12.withOpacity(.06)
                                  ),
                                  alignment: Alignment.center,
                                  child:Text(this.SupplierName,style: TextStyle(fontSize: 11))
                                ),

                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(
                                      //   left: MediaQuery.of(context).size.width*.02,
                                        right: 20
                                    ),
                                    width: MediaQuery.of(context).size.width*.28,
                                    child: Text("كود المورد",style: TextStyle(fontSize: 11))),
                               // SizedBox(width: 20,),
                                Container(
                                  padding: EdgeInsets.only(
                                    //left: 20,
                                    // right: MediaQuery.of(context).size.width*.02
                                  ),
                                  height: MediaQuery.of(context).size.height*.04,
                                  width: MediaQuery.of(context).size.width*.59,
                                  decoration: BoxDecoration(
                                    borderRadius:BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(color: Colors.black12,width: 1.0),
                                      color: Colors.black12.withOpacity(.06)
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(this.SupplierCode.toString(),style: TextStyle(fontSize: 11)),
                                ),

                              ],
                            ),
                            SizedBox(height: 8,),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1.0,color: Colors.black12)
                        ),
                        margin: EdgeInsets.only(

                            bottom: 8,
                            left:  MediaQuery.of(context).size.width*.05,
                            right: MediaQuery.of(context).size.width*.05
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 8,),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(
                                        right: 20
                                    ),
                                    width: MediaQuery.of(context).size.width*.28,
                                    child: Text("رقم الطلب",style: TextStyle(fontSize: 11),)),
                                Container(

                                    height: MediaQuery.of(context).size.height*.04,
                                    width: MediaQuery.of(context).size.width*.59,
                                    decoration: BoxDecoration(
                                        borderRadius:BorderRadius.all(Radius.circular(10)),
                                        border: Border.all(width: 1.0,color: Colors.black12),
                                        color: Colors.black12.withOpacity(.06)
                                    ),
                                    alignment: Alignment.center,
                                    child:Text(this.OrderNumber.toString(),style: TextStyle(fontSize: 11))
                                ),

                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(
                                      //   left: MediaQuery.of(context).size.width*.02,
                                        right: 20
                                    ),
                                    width: MediaQuery.of(context).size.width*.28,
                                    child: Text("تاريخ الطلب",style: TextStyle(fontSize: 12),maxLines: 1,)),

                                Container(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    right: 10
                                    // right: MediaQuery.of(context).size.width*.02
                                  ),
                                  height: MediaQuery.of(context).size.height*.04,
                                  width: MediaQuery.of(context).size.width*.4,
                                  decoration: BoxDecoration(
                                      borderRadius:BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(color: Colors.black12,width: 1.0),
                                      color: Colors.black12.withOpacity(.06)
                                  ),

                                  alignment: Alignment.center,
                                  child: Text(this.OrderDate.toString(),style: TextStyle(fontSize: 11),maxLines: 1,),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*.02,),
                                GestureDetector(
                                    child: Container(
                                      decoration:BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color(h.mainColor),
                                      ),
                                      height: MediaQuery.of(context).size.height*.039,
                                      width: MediaQuery.of(context).size.width*.17,
                                      alignment: Alignment.center,
                                      child:   Text("أنهاء الطلب",style: TextStyle(color:Colors.white,fontSize: 7.5),),
                                    ),
                                    onTap:() async =>{
                                      EndOrderDialog(),
                                    }
                                )

                              ],
                            ),
                            SizedBox(height: 8,),
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                     Form(
                        key: formKey,
                        child:Container(
                          decoration: BoxDecoration(
                              borderRadius:BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.black12,width: 1.0)
                          ),
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width*.05,
                              right: MediaQuery.of(context).size.width*.05,
                          ),
                          padding: EdgeInsets.only(
                              //left: MediaQuery.of(context).size.width*.015,
                              //right: MediaQuery.of(context).size.width*.015,
                            top: 8,
                            bottom: 8
                          ),
                          child: Column(
                            children: [
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                              padding: EdgeInsets.only(
                              //   left: MediaQuery.of(context).size.width*.02,
                              right: 20
                              ),
                                      width: MediaQuery.of(context).size.width*.28,
                                      child: Text("باركود",style: TextStyle(fontSize: 11))),
                                  Container(
                                    height: MediaQuery.of(context).size.height*.04,
                                    width: MediaQuery.of(context).size.width*.4,
                                    decoration: BoxDecoration(
                                      borderRadius:BorderRadius.all(Radius.circular(10)),
                                      color: disablBarcode?Colors.white:Colors.black12.withOpacity(.08)
                                    ),
                                    child: TextFormField(
                                      autofocus: true,
                                      enabled: disablBarcode,
                                      validator: (val){
                                        if(val.isEmpty)
                                          return "";
                                           return null;
                                      },
                                      style: TextStyle(fontSize: 11),
                                      focusNode: N1,
                                      onFieldSubmitted: (value){
                                        FocusScope.of(context).requestFocus(N2);
                                      },
                                      decoration: InputDecoration(
                                        errorStyle: TextStyle(fontSize: 0),
                                        contentPadding: EdgeInsets.only(right: 15,left: 15,top: 0,bottom: 0),
                                        enabledBorder: new OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(color: Colors.black12)
                                        ),
                                        disabledBorder: new OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(color: Colors.black12.withOpacity(.08))
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
                                      controller: barcode,
                                    ),
                                  ),
                                  SizedBox(width: MediaQuery.of(context).size.width*.02,),
                                  GestureDetector(
                                      child: Container(
                                        decoration:BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: confirmBtn?Color(h.mainColor):Color(h.mainColor).withOpacity(.5),
                                        ),
                                        height: MediaQuery.of(context).size.height*.039,
                                        width: MediaQuery.of(context).size.width*.17,
                                        alignment: Alignment.center,
                                        child:   Text("تـأكيد",style: TextStyle(color:Colors.white,fontSize: 7.5),),
                                      ),
                                      onTap:() async =>{
                                        print("Ssssssssssssssssssssss"),
                                       if(confirmBtn){
                                         confirmBarcode=await api.ConfirmBarcode(barcode.text.trim(),url),
                                         if(confirmBarcode["StatusCode"]==200){

                                           setState((){
                                             addBtn=true;
                                             confirmBtn=false;
                                             disablBarcode=false;
                                             productName.text=confirmBarcode["Message"]["Name"];
                                             cost.text=confirmBarcode["Message"]["SalePrice"].toString();
                                             unit.text=confirmBarcode["Message"]["UnitID"].toString();
                                             bones.text="0";
                                             quantity.text="0";
                                             recieve.text="0";
                                             total.text="0";
                                           }),
                                           print(unit.text),
                                           print("@@@@@@@@@@@@")
                                         }else{
                                           Toast.show(
                                               "باركود خاطئ ", context,
                                               duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER),
                                         }
                                       }
                                      }
                                  )

                                ],
                              ),
                              SizedBox(height: 8,),
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                              padding: EdgeInsets.only(
                              //   left: MediaQuery.of(context).size.width*.02,
                              right: 20
                              ),
                                      width: MediaQuery.of(context).size.width*.28,
                                      child: Text("أسم الصنف",style: TextStyle(fontSize: 11),)),
                                  Container(
                                    height: MediaQuery.of(context).size.height*.04,
                                    width: MediaQuery.of(context).size.width*.59,
                                    decoration: BoxDecoration(
                                      borderRadius:BorderRadius.all(Radius.circular(10)),
                                      color: Colors.black12.withOpacity(.06),
                                    ),
                                    child: TextFormField(
                                      enabled: false,
                                      validator: (val){
                                        if(val.isEmpty)
                                          return "";
                                        return null;
                                      },
                                      style: TextStyle(fontSize: 11),
                                      onFieldSubmitted: (value){
                                        FocusScope.of(context).requestFocus(N1);
                                      },
                                      decoration: InputDecoration(
                                        errorStyle: TextStyle(fontSize: 0),
                                        contentPadding: EdgeInsets.only(right: 15,left: 15,top: 0,bottom: 0),
                                        disabledBorder: new OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(color: Colors.black12.withOpacity(.08))
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
                                      controller: productName,
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 8,),
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                        //   left: MediaQuery.of(context).size.width*.02,
                                          right: 20
                                      ),
                                      width: MediaQuery.of(context).size.width*.28,
                                      child: Text("الوحدة",style: TextStyle(fontSize: 10))),

                                  Container(
                                    height: MediaQuery.of(context).size.height*.04,
                                    width: MediaQuery.of(context).size.width*.59,
                                    decoration: BoxDecoration(
                                      borderRadius:BorderRadius.all(Radius.circular(10)),
                                      color: Colors.black12.withOpacity(.06),
                                    ),
                                    child: TextFormField(
                                      enabled: false,
                                      validator: (val){
                                        if(val.isEmpty)
                                          return "";
                                        return null;
                                      },
                                      style: TextStyle(fontSize: 11),
                                      focusNode: N2,
                                      onFieldSubmitted: (value){
                                        FocusScope.of(context).requestFocus(N3);
                                      },
                                      decoration: InputDecoration(
                                        errorStyle: TextStyle(fontSize: 0),
                                        contentPadding: EdgeInsets.only(right: 15,left: 15,top: 0,bottom: 0),
                                        disabledBorder: new OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(color: Colors.black12.withOpacity(.08))
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
                                      controller: unit,
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 8,),
                              Row(
                               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                        //   left: MediaQuery.of(context).size.width*.02,
                                          right: 20
                                      ),
                                      width: MediaQuery.of(context).size.width*.28,
                                      child: Text("الكمية",style: TextStyle(fontSize: 11))),
                                  Container(
                                    height: MediaQuery.of(context).size.height*.04,
                                    width: MediaQuery.of(context).size.width*.59,
                                    decoration: BoxDecoration(
                                      borderRadius:BorderRadius.all(Radius.circular(10)),
                                      color: Colors.black12.withOpacity(.06),
                                    ),
                                    child: TextFormField(
                                      enabled: false,
                                      keyboardType: TextInputType.number,
                                      validator: (val){
                                        if(val.isEmpty)
                                          return "";
                                        return null;
                                      },
                                      style: TextStyle(fontSize: 11),
                                      focusNode: N3,
                                      onFieldSubmitted: (value){
                                        FocusScope.of(context).requestFocus(N4);
                                      },
                                      decoration: InputDecoration(
                                        errorStyle: TextStyle(fontSize: 0),
                                        contentPadding: EdgeInsets.only(right: 15,left: 15,top: 0,bottom: 0),
                                        disabledBorder: new OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(color: Colors.black12.withOpacity(.08))
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
                                      controller: quantity,
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 8,),
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                        //   left: MediaQuery.of(context).size.width*.02,
                                          right: 20
                                      ),
                                      width: MediaQuery.of(context).size.width*.28,
                                      child: Text("المستلم",style: TextStyle(fontSize: 11))),
                                  Container(
                                    height: MediaQuery.of(context).size.height*.04,
                                    width: MediaQuery.of(context).size.width*.59,
                                    decoration: BoxDecoration(
                                      borderRadius:BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: TextFormField(
                                      autofocus: false,
                                      keyboardType: TextInputType.number,
                                      validator: (val){
                                        if(val.isEmpty)
                                          return "";
                                        return null;
                                      },
                                      onChanged: (val){
                                       if(val.isNotEmpty){
                                         print(confirmBarcode["Message"]["SalePrice"].toString());
                                         print(val.toString());
                                         print("aaaaaaaaaaaaaaaaaa");
                                         double a=double.parse(confirmBarcode["Message"]["SalePrice"].toString());
                                         int b=int.parse(val.toString());
                                         print(a.toString());
                                         setState((){
                                           total.text=(a*b).toString();
                                         });
                                         print(total.text);
                                       }
                                      },
                                      style: TextStyle(fontSize: 11),
                                      focusNode: N4,
                                      onFieldSubmitted: (value){
                                        FocusScope.of(context).requestFocus(N5);
                                      },
                                      decoration: InputDecoration(
                                        errorStyle: TextStyle(fontSize: 0),
                                        contentPadding: EdgeInsets.only(right: 15,left: 15,top: 0,bottom: 0),
                                        enabledBorder: new OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(color: Color(BorderColor))
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
                                      controller: recieve,
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 8,),
                              Row(
                               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                        //   left: MediaQuery.of(context).size.width*.02,
                                          right: 20
                                      ),
                                      width: MediaQuery.of(context).size.width*.28,
                                      child: Text("البونص",style: TextStyle(fontSize: 11))),
                                  Container(
                                    height: MediaQuery.of(context).size.height*.04,
                                    width: MediaQuery.of(context).size.width*.59,
                                    decoration: BoxDecoration(
                                      borderRadius:BorderRadius.all(Radius.circular(10)),
                                        color: Colors.black12.withOpacity(.06)
                                    ),
                                    child: TextFormField(
                                      enabled: false,
                                      keyboardType: TextInputType.number,
                                      validator: (val){
                                        if(val.isEmpty)
                                          return "";
                                        return null;
                                      },
                                      focusNode: N5,
                                      onFieldSubmitted: (value){
                                        FocusScope.of(context).requestFocus(N6);
                                      },
                                      style: TextStyle(fontSize: 11),
                                      decoration: InputDecoration(
                                        errorStyle: TextStyle(fontSize: 0),
                                        contentPadding: EdgeInsets.only(right: 15,left: 15,top: 0,bottom: 0),
                                        disabledBorder: new OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(color: Colors.black12.withOpacity(.08))
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
                                      controller: bones,
                                    ),
                                  ),

                                ],
                              ),
                              ///////////////////////////
                              SizedBox(height: 8,),
                              Row(
                               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                        //   left: MediaQuery.of(context).size.width*.02,
                                          right: 20
                                      ),
                                      width: MediaQuery.of(context).size.width*.28,
                                      child: Text("التكلفة",style: TextStyle(fontSize: 11))),
                                  Container(
                                    height: MediaQuery.of(context).size.height*.04,
                                    width: MediaQuery.of(context).size.width*.59,
                                    decoration: BoxDecoration(
                                      borderRadius:BorderRadius.all(Radius.circular(10)),
                                      color: Colors.black12.withOpacity(.06),
                                    ),
                                    child: TextFormField(
                                      enabled: false,
                                      validator: (val){
                                        if(val.isEmpty)
                                          return "";
                                        return null;
                                      },
                                      style: TextStyle(fontSize: 11),
                                      focusNode: N6,
                                      onFieldSubmitted: (value){
                                        FocusScope.of(context).requestFocus(N7);
                                      },
                                      decoration: InputDecoration(
                                        errorStyle: TextStyle(fontSize: 0),
                                        contentPadding: EdgeInsets.only(right: 15,left: 15,top: 0,bottom: 0),
                                        disabledBorder: new OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(color: Colors.black12.withOpacity(.08))
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
                                      controller: cost,
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 8,),
                              Row(
                               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                        //   left: MediaQuery.of(context).size.width*.02,
                                          right: 20
                                      ),
                                      width: MediaQuery.of(context).size.width*.28,
                                      child: Text("الاجمالي",style: TextStyle(fontSize: 11))),
                                  Container(
                                    height: MediaQuery.of(context).size.height*.04,
                                    width: MediaQuery.of(context).size.width*.59,
                                    decoration: BoxDecoration(
                                      borderRadius:BorderRadius.all(Radius.circular(10)),
                                      color: Colors.black12.withOpacity(.06),
                                    ),
                                    child: TextFormField(
                                      enabled: false,
                                      validator: (val){
                                        if(val.isEmpty)
                                          return "";
                                        return null;
                                      },
                                      focusNode: N7,
                                      onFieldSubmitted: (value){
                                        FocusScope.of(context).requestFocus(FocusNode());
                                      },
                                      style: TextStyle(fontSize: 11),
                                      decoration: InputDecoration(
                                        errorStyle: TextStyle(fontSize: 0),
                                        contentPadding: EdgeInsets.only(right: 15,left: 15,top: 0,bottom: 0),
                                        disabledBorder: new OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(color: Colors.black12.withOpacity(.08))
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
                                      controller: total,
                                    ),
                                  ),

                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      GestureDetector(
                          child: Container(
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:addBtn? Color(h.mainColor):Color(h.mainColor).withOpacity(.5),
                            ),
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width*.25,
                                right: MediaQuery.of(context).size.width*.25
                            ),
                            height: MediaQuery.of(context).size.height*.045,
                            width: MediaQuery.of(context).size.width*.5,
                            alignment: Alignment.center,
                            child:   Text("أضافة",style: TextStyle(color:Colors.white,fontSize: 14),),
                          ),
                          onTap:() async =>{
                           if(addBtn){
                             if(recieve.text!="0"){
                               checkAddedDialog(),
                             }
                             else{
                               setState((){
                                 BorderColor=0xfff00f00;
                               }),
                               icorrect()
                             }
                           }
                          }
                      ),
                      SizedBox(height: 15,)
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
  EndOrderDialog() {
    showDialog(
        context: context,
        builder: (_) =>
            Directionality(
              textDirection: TextDirection.rtl,
              child: new AlertDialog(
                // title: new Text("Material Dialog"),
                content: new Text("هل تريد انهاء الطلب"),
                actions: <Widget>[
                  FlatButton(
                    child: Text('تـأكيد ',style: TextStyle(color:confirmEndOrderBtn?Colors.black:Colors.black26 ),),
                    onPressed: () {
                     if(confirmEndOrderBtn){
                       setState((){
                         confirmEndOrderBtn=false;
                       });
                       api.closeOrder(url);
                       Navigator.pushNamedAndRemoveUntil(
                           context, "/homePage", (route) => false);

                     }
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
  checkAddedDialog() {
    showDialog(
        context: context,
        builder: (_) =>
            Directionality(
              textDirection: TextDirection.rtl,
              child: new AlertDialog(
                // title: new Text("Material Dialog"),
                content: new Text("هل تريد أضافة هذا العنصر"),
                actions: <Widget>[
                  FlatButton(
                    child: Text('تـأكيد ',style: TextStyle(color:confirmAddItemBtn?Colors.black: Colors.black12),),
                    onPressed: () async {
                     if(confirmAddItemBtn){
                       NewItem=await api.newOrderItem(this.OrderId, barcode.text.trim(), recieve.text.trim(),url);
                       if(NewItem["StatusCode"]==200){

                         /* Toast.show(
                                    "تم اضافة العنصر ", context,
                                    duration: Toast.LENGTH_SHORT, gravity:Toast.BOTTOM),*/
                         print("999999999999999999999999");
                         setState((){
                           confirmAddItemBtn=false;
                           addBtn=false;
                           confirmBtn=true;
                           disablBarcode=true;
                           barcode.text="";
                           cost.text="";
                           productName.text="";
                           quantity.text="";
                           recieve.text="";
                           bones.text="";
                           cost.text="";
                           total.text="";
                           unit.text="";
                         });/*
                      Toast.show(
                          "تمت اضافة العنصر ", context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);*/
                         orderAddedDialog();
                         Timer(Duration(seconds: 2), ()=>Navigator.pop(context));
                         Timer(Duration(seconds: 2), ()=>Navigator.pop(context));
                         //Navigator.pop(context);
                       }
                     }
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
  orderAddedDialog() {
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
                  Container(alignment: Alignment.center,child: Text("تمت اضافة العنصر ",textAlign: TextAlign.center,))
                ],
              ),


            ],),
          ),
        ));
  }
  icorrect() {
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
                  Container(alignment: Alignment.center,child: Text("لا يمكن اضافة المستلم 0 ",textAlign: TextAlign.center,))
                ],
              ),


            ],),
          ),
        ));
  }
}