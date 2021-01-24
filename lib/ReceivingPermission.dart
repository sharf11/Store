import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stores/main.dart';
import 'package:stores/AddItem.dart';
import 'Model/SuppliersModel.dart';
import 'Services/MyServices.dart';

class ReceivingPermission extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<ReceivingPermission>{
  home h=new home();
  List<SuppliersItem> data=[];
  Map<String,dynamic>NewOrderData;
  SuppliersItem data1 ;
  TextEditingController supplierCode=new TextEditingController();
  bool form2=false;
  Map<String,dynamic>responceDataCode;
  Map<String,dynamic>responceDataCodeAndId;
  final formKey1=GlobalKey<FormState>();
  MyServices api=new MyServices();
  Map<String,dynamic>confirmSupplierByCode;
  bool addOrder=true;
  bool ConfirmSupplier=true;
  static String userId;
  String url;
  int borderColor=0xffdedede;
  loadUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      url=prefs.get("url");
    });
  }
  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    data=await api.allSuppliers();
    setState(() {
      userId=prefs.get('userID');
    });
    print(data);
    print("00000000000000000000000000000000000000");
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.loadData();
    loadUrl();
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
                  child: Text("إذن أستلام",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 20,),

                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                         left: MediaQuery.of(context).size.width*.05,
                         right: MediaQuery.of(context).size.width*.05
                        ),

                        decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(10),
                          border: Border.all(color: Colors.black12,width: 1.0)
                        ),
                        child: Form(
                          key: formKey1,
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                          right: 20
                                      ),
                                      width: MediaQuery.of(context).size.width*.22,
                                      child: Text("المورد",style: TextStyle(fontSize: 10),)),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: MediaQuery.of(context).size.width*.05
                                     //   right: MediaQuery.of(context).size.width*.02
                                    ),
                                    padding: EdgeInsets.only(
                                      left: 5,
                                      right: 5
                                    ),
                                    height: MediaQuery.of(context).size.height*.05,
                                    width: MediaQuery.of(context).size.width*.6,
                                    decoration: BoxDecoration(
                                      borderRadius:BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(width: 1.0,color: Colors.black12)
                                    ),
                                    child:DropdownButton<SuppliersItem>(
                                      elevation: 0,
                                      iconSize:20.0,
                                      isExpanded: true,
                                      hint:   Text('أختر المورد',
                                        style: TextStyle(fontSize:14.0),),
                                      underline: Container(),

                                      items:data.map((value) {
                                        print('${value},,,,,,vv');
                                        return DropdownMenuItem<SuppliersItem>(
                                          value: value,
                                          child: Container(
                                              padding: EdgeInsets.only(
                                                left: 5,
                                                right: 5
                                              ),
                                              child: Text(value.name,style: TextStyle(fontSize:10.0),maxLines: 1,)),
                                        );
                                      }).toList(),

                                      onChanged: (value) {
                                        // print(value);
                                        setState(() {
                                          data1 = value;
                                          ConfirmSupplier=true;
                                          form2=false;
                                          supplierCode.text=data1.code.toString();
                                        });
                                        print(data1.name);
                                      },
                                      value: data1,

                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                       //   left: MediaQuery.of(context).size.width*.02,
                                          right: 20
                                      ),
                                      width: MediaQuery.of(context).size.width*.22,
                                      child: Text("كود المورد",style: TextStyle(fontSize: 10))),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: MediaQuery.of(context).size.width*.05
                                       // right: MediaQuery.of(context).size.width*.02
                                    ),
                                    height: MediaQuery.of(context).size.height*.05,
                                    width: MediaQuery.of(context).size.width*.6,
                                    decoration: BoxDecoration(
                                      borderRadius:BorderRadius.all(Radius.circular(10)),
                                         color: Colors.black12.withOpacity(.08)
                                    ),
                                    child: TextFormField(
                                      enabled: false,
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
                                        confirmSupplierByCode=await api.confirmSupplierByCode(supplierCode.text.trim(),url);
                                        /*setState(() {
                                          data1.name=confirmSupplierByCode["Message"]["SupplierNAME"];
                                          data1.supplierId=confirmSupplierByCode["Message"]["SupplierID"];
                                        });
*/
                                      },
                                      decoration: InputDecoration(
                                        enabled: false,
                                        errorStyle: TextStyle(fontSize: 0),
                                        contentPadding: EdgeInsets.only(right: 15,left: 15,top: 0,bottom: 0),
                                        disabledBorder: new OutlineInputBorder(
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
                                      controller: supplierCode,
                                    ),
                                  ),

                                ],
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
                                          color: ConfirmSupplier?Color(h.mainColor):Color(h.mainColor).withOpacity(.5),
                                        ),
                                        height: MediaQuery.of(context).size.height*.045,
                                        width: MediaQuery.of(context).size.width*.5,
                                        alignment: Alignment.center,
                                        child:   Text("تــأكيد المورد",style: TextStyle(color:Colors.white,fontSize: 11),),
                                      ),
                                      onTap:() async =>{
                                        if(supplierCode.text!=""){

                                          print("77777777777777777777777"),
                                          //responceDataCode=await api.confirmSupplier(supplierCode.text.trim(),data1.supplierId.toString()),
                                          if(data1.name!=null){
                                            print("asd"),
                                            if(supplierCode.text == ""){
                                              print("Enter the SupplierCode")
                                            } else
                                              {
                                                responceDataCode=await api.confirmSupplier(supplierCode.text.trim(),data1.supplierId.toString(),url),

                                                if(responceDataCode["StatusCode"]==200)
                                                {

                                                  setState((){
                                                    ConfirmSupplier=false;
                                                    borderColor=0xffdedede;
                                                form2 = true;
                                                }),
                                                }
                                                else
                                                 { /*form2 = false,*/}
                                              }
                                          }
                                          else{
                                          }

                                        }
                                        else{
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
                      form2? GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(
                              left:  MediaQuery.of(context).size.width*.2,
                              right:  MediaQuery.of(context).size.width*.2
                            ),
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: addOrder?Color(h.mainColor):Color(h.mainColor).withOpacity(.5),
                            ),
                            height: MediaQuery.of(context).size.height*.05,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            child:   Text("أضافة إذن جديد",style: TextStyle(color:Colors.white,fontSize: 10),),
                          ),
                          onTap:() async =>{
                            //Navigator.pushNamed(context, "/AddItem")

                        if(addOrder){
                          NewOrderData= await  api.NewOrder(data1.supplierId.toString(), userId,url),
                          if(NewOrderData["StatusCode"]==200){
                            setState((){
                              addOrder=false;
                            }),
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AddItem(NewOrderData["Message"]["SupplierCode"],NewOrderData["Message"]["SupplierName"],NewOrderData["Message"]["ReceiveOrderID"],NewOrderData["Message"]["OrderNumber"],NewOrderData["Message"]["OrderDate"])), (route) => false),
                          }
                          else{
                            setState((){
                        addOrder=true;
                        }),
                          }
                        }

                          }
                      ):SizedBox(),
                      SizedBox(height: 20,)
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
}