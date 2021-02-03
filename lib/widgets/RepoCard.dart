import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:git_search_api/utils/constants.dart';

class RepoCard extends StatelessWidget {

  final String query;
  final String repoName;
  final String username;
  final String imageURL;
  final DateTime updateDate;
  final double stars;

  const RepoCard({Key key,
    @required this.stars,
    @required this.query,
    @required this.repoName, 
    @required this.username, 
    this.imageURL,
    @required this.updateDate
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Color(kInputBorderColor),
          width: 1
        )
      ),
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 16,horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.only(left: 16,right:16,top: 12,bottom: 16),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Row(
           mainAxisSize: MainAxisSize.max,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children:[
            Text(this.repoName,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12)),
            Chip(
              backgroundColor: Color(kChipColor),
              label: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.star_border,color: Colors.white),
                  Text(this.stars.toString(),style: TextStyle(color: Colors.white))
                ]
              )
            )]),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(backgroundImage: NetworkImage(this.imageURL),radius: 20),
                SizedBox(width: 8),
                Text(this.username)
              ]
            ),
            SizedBox(height: 12),
            Divider(color: Color(kInputBorderColor),thickness: 1,indent: 16,endIndent: 16),
            Text(formatDate(this.updateDate,[dd,'.',mm]))
        ])
      )
    );
  }
}
