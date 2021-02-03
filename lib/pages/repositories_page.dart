import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import 'package:git_search_api/bloc/search_bloc.dart';
import 'package:git_search_api/models/search.dart';
import 'package:git_search_api/widgets/Error.dart';
import 'package:git_search_api/widgets/Loading.dart';
import 'package:git_search_api/widgets/RepoCard.dart';


class RepositoriesPage extends StatefulWidget {
  final String queryText;
  RepositoriesPage({Key key, this.queryText}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return RepositoriesPageState();
  }
}

class RepositoriesPageState extends State<RepositoriesPage> {
  SearchBloc searchBloc;

  @override
  void initState(){
    super.initState();
    searchBloc = SearchBloc(widget.queryText);
    searchBloc.getItems();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text("Резултаты поиска",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w600),textAlign: TextAlign.center),
        centerTitle: true
      ),
      body: SafeArea(
        child: Column(children: [
        SizedBox(height: 19),
        Text("По запросу: \"${widget.queryText}\" ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600)),
        SizedBox(height: 8),
        Text("найдено: ${searchBloc.subject.stream.value.items.length}"),
        Expanded(
        flex: 2,  
        child: StreamBuilder<SearchResponse>(
        stream: searchBloc.subject.stream,
        builder: (ctx,state){
          print(state.data);
          if(state.hasData){
            if (state.data.error != null && state.data.error.length > 0) {
              return ErrorShow(error: state.error);
            }
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (ctx,i){
                return RepoCard(
                query: widget.queryText, 
                repoName: state.data.items[i].repositoryName,
                stars: state.data.items[i].repoScore, 
                updateDate: DateTime.now(), 
                username: state.data.items[i].ownerName,
                imageURL: state.data.items[i].avatarURL,
                );
              },
              itemCount: state.data.items.length,
            );
          } else if(state.hasError){
            return ErrorShow(error: state.error);
          }
          else {
            return Loading();
          }
        }
        )
        )
        ]
        )
      )
    );
  }

  @override
  void dispose(){
    super.dispose();
    searchBloc.dispose();
  }
}