import 'package:git_search_api/api/GitSearchAPI.dart';
import 'package:git_search_api/models/search.dart';
import 'package:rxdart/rxdart.dart';
import 'package:git_search_api/models/search.dart';


class SearchBloc {  

  final String query;

  SearchApiProvider repository = SearchApiProvider();
  final BehaviorSubject<SearchResponse> _subject = BehaviorSubject<SearchResponse>();

  SearchBloc(this.query);

  getItems() async {
    print(this.query);
    SearchResponse response = await repository.getItems(query: query);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<SearchResponse> get subject => _subject;
  
}