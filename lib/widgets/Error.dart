import 'package:flutter/material.dart';

class ErrorShow extends StatelessWidget {

  final String error;

  const ErrorShow({Key key, @required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error",style: Theme.of(context).textTheme.subtitle),
      ],
    ));
  }
}