import 'package:git_search_api/models/search.dart';
import 'package:git_search_api/api/GitSearchAPI.dart';

class SearchRepository{
  SearchApiProvider _apiProvider = SearchApiProvider();

  Future<SearchResponse> getItems(){
    return _apiProvider.getItems();
  }
}