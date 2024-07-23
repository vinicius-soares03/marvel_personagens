class Comics {
  int? available;
  String? collectionUri;
  List<ComicsItem>? items;
  int? returned;

  Comics({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  Comics.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionUri = json['collectionURI'];
    if (json['items'] != null) {
      items = <ComicsItem>[];
      json['items'].forEach((v) {
        items!.add(new ComicsItem.fromJson(v));
      });
    }
    returned = json['returned'];
  }
}

class ComicsItem {
  String? resourceUri;
  String? name;

  ComicsItem({
    this.resourceUri,
    this.name,
  });
  ComicsItem.fromJson(Map<String, dynamic> json) {
    resourceUri = json['resourceURI'];
    name = json['name'];
  }
}
