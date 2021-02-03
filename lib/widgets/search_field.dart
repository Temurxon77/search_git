import 'package:flutter/material.dart';
import 'package:git_search_api/bloc/search_bloc.dart';
import 'package:git_search_api/pages/repositories_page.dart';
import 'package:git_search_api/utils/constants.dart';
import 'package:git_search_api/utils/helperFunctions.dart';

class SearchField extends StatelessWidget {

  final TextEditingController searchController = TextEditingController();
  
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 84),
      child: TextFormField(
        controller: searchController,
        decoration: InputDecoration(
          suffixIcon: RawMaterialButton(
            constraints: BoxConstraints(
              minWidth: 100,
              maxWidth: 100,
              minHeight: 42,
              maxHeight: 45            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kInputRadius)),
            fillColor: Color(kButtonColor),
            onPressed: ()  {
              //print(searchController.text);
              router(context: context, redirect: RepositoriesPage(queryText: searchController.text.toString()));
            },
            child: Text("найти".toUpperCase(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 12)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kInputRadius),
            borderSide: BorderSide(
              color: Color(kInputBorderColor)
            )
          )
        )
      )
    );
  }
}