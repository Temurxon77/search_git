class Search {
  final String repositoryName;
  final String avatarURL;
  final String ownerName;
  final double repoScore;

  Search(this.repositoryName, this.avatarURL, this.ownerName, this.repoScore);

  Search.fromJson(Map<String, dynamic> json)
      : repositoryName = json["repository"]["name"],
        avatarURL = json["repository"]["owner"]["avatar_url"],
        ownerName = json["repository"]["owner"]["login"],
        repoScore = json["score"];
}

class SearchResponse {
  final List<Search> items;
  final String error;

  SearchResponse(this.items, this.error);

  SearchResponse.fromJson(Map<String, dynamic> json) : items = (json["items"] as List).map((i) => new Search.fromJson(i)).toList(),error = "";

  SearchResponse.withError(String errorValue) : items = List(),error = errorValue;
}