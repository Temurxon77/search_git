import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Center(child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
      Text("Wait for a while..."),
      SizedBox(height: 20),
      CircularProgressIndicator(
      )
    ]
    ));
  }
}