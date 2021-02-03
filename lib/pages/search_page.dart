import 'package:flutter/material.dart';
import 'package:git_search_api/widgets/search_field.dart';


class GitSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Поиск",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600)),
          centerTitle: true,
          elevation: 1
      ),
      body: SearchField()
    );
  }
}