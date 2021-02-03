import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

void router({@required BuildContext context,@required Widget redirect}){
  try{
    Navigator.push(context, MaterialPageRoute(builder: (context) =>  redirect)).catchError((err)=>{
      throw FlutterError('No Such Widget was found!')
    });
  }catch(err){
    print(err);
  }
}