import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stores/Model/SuppliersModel.dart';

class MyServices{
  Future<List<SuppliersItem>>allSuppliers()async
  {
    var url="https://www.edumisr.com/APP_API/Hyper/index.php?r=store/allSuppliers";
    print(url);
    var header={
      "Content-Type":"application/json",
      "X-Auth-Token":"cc868cdf1e3c3947980a894e0c3eac68"
    };
   // print(header);
    //print("sssssssssssssss");
    try
    {
      final response = await http.post(url,headers: header);
      print('${json.decode(response.body)},,,,,,dddddddddddddddddddddddddddddddddddddddddddddddd');
      if(response.statusCode==200 && response.body!=null)
      {
        List slideritems = json.decode(utf8.decode(response.bodyBytes))['Message'];
        // print('${slideritems.map((e) => SliderData.fromJson(e)).toList()},,,,,,dddddddddddddddddddddddddddddddddddddddddddddddddddddd');
        return slideritems.map((e) => SuppliersItem.fromJson(e)).toList();
      }
    }
    catch(e)
    {
      print('&{e},,,,error slidder');
    }
  }
  Future<Map<String,dynamic>>loginServices(var username,var password,var userUrl)async{
    String url=userUrl+"store/login";
    var body={
      "username": username,
      "password":password
    } ;
    print('$url,,,,,,,,,,,,url');
    print('${json.encode(body)},,,,,,,,,,,,bodyyyyy');
 var header={
      "Content-Type":"application/json",
      "X-Auth-Token":"cc868cdf1e3c3947980a894e0c3eac68"
    };
    print('$header,,,,,,,,,,,,header');
    try{
      final responce=await http.post(url,body:json.encode(body),headers: header);
      if(responce.statusCode==200 && responce.body.isNotEmpty)
      {
        print(responce.body);
        return json.decode(responce.body);
      }

    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<Map<String,dynamic>>confirmSupplierByCode(var code,var userUrl)async{
    String url=userUrl+"store/confirmSupplier";
    var body={
      "supplierCODE": code,
    }  ;
    print('$url,,,,,,,,,,,,url');
    print('${json.encode(body)},,,,,,,,,,,,bodyyyyy');
    var header={
      "Content-Type":"application/json",
      "X-Auth-Token":"cc868cdf1e3c3947980a894e0c3eac68"
    };
    print('$header,,,,,,,,,,,,header');
    try{
      final responce=await http.post(url,body:json.encode(body),headers: header);
      if(responce.statusCode==200 && responce.body.isNotEmpty)
      {
        print(responce.body);
        return json.decode(responce.body);
      }

    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<Map<String,dynamic>>confirmSupplier(var code,var id,var userUrl)async{
    String url=userUrl+"store/confirmSupplier";
    var body={
      "supplierCODE": code,
      "supplierID": id
    }  ;
    print('$url,,,,,,,,,,,,url');
    print('${json.encode(body)},,,,,,,,,,,,bodyyyyy');
    var header={
      "Content-Type":"application/json",
      "X-Auth-Token":"cc868cdf1e3c3947980a894e0c3eac68"
    };
    print('$header,,,,,,,,,,,,header');
    try{
      final responce=await http.post(url,body:json.encode(body),headers: header);
      if(responce.statusCode==200 && responce.body.isNotEmpty)
      {
        print(responce.body);
        return json.decode(responce.body);
      }

    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<Map<String,dynamic>>NewOrder(var SupplierID,var UserID,var userUrl)async{
    String url=userUrl+"store/newOrder";
    var body={
      "SupplierID":SupplierID,
      "UserID":UserID
    }  ;
    print('$url,,,,,,,,,,,,url');
    print('${json.encode(body)},,,,,,,,,,,,bodyyyyy');
    var header={
      "Content-Type":"application/json",
      "X-Auth-Token":"cc868cdf1e3c3947980a894e0c3eac68"
    };
    print('$header,,,,,,,,,,,,header');
    try{
      final responce=await http.post(url,body:json.encode(body),headers: header);
      if(responce.statusCode==200 && responce.body.isNotEmpty)
      {
        print(responce.body);
        return json.decode(responce.body);
      }

    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<Map<String,dynamic>>closeOrder(var userUrl)async{
    String url=userUrl+"store/closeOrder";
    var body= {
        "OrderID":1,
        "UserID":1
      };
    print('$url,,,,,,,,,,,,url');
    print('${json.encode(body)},,,,,,,,,,,,bodyyyyy');
    var header={
      "Content-Type":"application/json",
      "X-Auth-Token":"cc868cdf1e3c3947980a894e0c3eac68"
    };
    print('$header,,,,,,,,,,,,header');
    try{
      final responce=await http.post(url,body:json.encode(body),headers: header);
      if(responce.statusCode==200 && responce.body.isNotEmpty)
      {
        print(responce.body);
        return json.decode(responce.body);
      }

    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<Map<String,dynamic>>ConfirmBarcode(var barcode,var userUrl)async{
    String url=userUrl+"store/confirmItem";
    var body={
      "Barcode": barcode
    }  ;
    print('$url,,,,,,,,,,,,url');
    print('${json.encode(body)},,,,,,,,,,,,bodyyyyy');
    var header={
      "Content-Type":"application/json",
      "X-Auth-Token":"cc868cdf1e3c3947980a894e0c3eac68"
    };
    print('$header,,,,,,,,,,,,header');
    try{
      final responce=await http.post(url,body:json.encode(body),headers: header);
      if(responce.statusCode==200 && responce.body.isNotEmpty)
      {
        print(responce.body);
        return json.decode(responce.body);
      }

    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<Map<String,dynamic>>newOrderItem(var orderID,var barcode,var receivedQuantity,var userUrl)async{
    String url=userUrl+"store/newOrderItem";
    var body={
      "OrderID":orderID,
      "Barcode":barcode,
      "ReceivedQuantity":receivedQuantity,
      "Bonus":0
    } ;
    print('$url,,,,,,,,,,,,url');
    print('${json.encode(body)},,,,,,,,,,,,bodyyyyy');
    var header={
      "Content-Type":"application/json",
      "X-Auth-Token":"cc868cdf1e3c3947980a894e0c3eac68"
    };
    print('$header,,,,,,,,,,,,header');
    try{
      final responce=await http.post(url,body:json.encode(body),headers: header);
      if(responce.statusCode==200 && responce.body.isNotEmpty)
      {
        print(responce.body);
        return json.decode(responce.body);
      }

    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<Map<String,dynamic>>checkUrl(var userUrl)async
  {
    var url=userUrl+"store/allSuppliers";
    print(url);
    var header={
      "Content-Type":"application/json",
      "X-Auth-Token":"cc868cdf1e3c3947980a894e0c3eac68"
    };
    // print(header);
    //print("sssssssssssssss");
    try
    {
      final response = await http.post(url,headers: header);
      print('${json.decode(response.body)},,,,,,dddddddddddddddddddddddddddddddddddddddddddddddd');
      if(response.statusCode==200 && response.body!=null)
      {

        // print('${slideritems.map((e) => SliderData.fromJson(e)).toList()},,,,,,dddddddddddddddddddddddddddddddddddddddddddddddddddddd');
        return json.decode(utf8.decode(response.bodyBytes));
      }
    }
    catch(e)
    {
      Map<String,dynamic>error={"StatusCode":"100"};
      print('&{e},,,,error slidder');
      return error;
    }
  }
}