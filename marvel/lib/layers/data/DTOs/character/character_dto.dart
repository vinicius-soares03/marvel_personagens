import 'package:marvel/layers/data/DTOs/character/character_thumbnail.dart';
import 'package:marvel/layers/domain/entities/character_entity.dart';

class CharacterDto extends CharacterEntity {
  String? resourceUri;
  Comics? comics;
  Comics? series;
  Stories? stories;
  Comics? events;
  List<Url>? urls;

  CharacterDto({
    super.id,
    super.name,
    this.resourceUri,
  });

  CharacterDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    resourceUri = json['resourceURI'];
    comics =
        json['comics'] != null ? new Comics.fromJson(json['comics']) : null;
    series =
        json['series'] != null ? new Comics.fromJson(json['series']) : null;
    stories =
        json['stories'] != null ? new Stories.fromJson(json['stories']) : null;
    events =
        json['events'] != null ? new Comics.fromJson(json['events']) : null;
    if (json['urls'] != null) {
      urls = <Url>[];
      json['urls'].forEach((v) {
        urls!.add(new Url.fromJson(v));
      });
    }
  }
}

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

class Stories {
  int? available;
  String? collectionUri;
  List<StoriesItem>? items;
  int? returned;

  Stories({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });
  Stories.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionUri = json['collectionURI'];
    if (json['items'] != null) {
      items = <StoriesItem>[];
      json['items'].forEach((v) {
        items!.add(new StoriesItem.fromJson(v));
      });
    }
    returned = json['returned'];
  }
}

class StoriesItem {
  String? resourceUri;
  String? name;
  String? type;

  StoriesItem({
    this.resourceUri,
    this.name,
    this.type,
  });

  StoriesItem.fromJson(Map<String, dynamic> json) {
    resourceUri = json['resourceURI'];
    name = json['name'];
  }
}

class Url {
  String? type;
  String? url;

  Url({
    this.type,
    this.url,
  });
   Url.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }
}
