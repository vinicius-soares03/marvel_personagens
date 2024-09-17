import 'dart:convert';

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
    super.description,
    super.modified,
    thumbnail,
    this.resourceUri,
  });

  factory CharacterDto.fromRawJson(String str) =>
      CharacterDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toMap());


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
   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['modified'] = modified;
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    data['resourceURI'] = resourceUri;
    if (comics != null) {
      data['comics'] = comics!.toMap();
    }
    if (series != null) {
      data['series'] = series!.toMap();
    }
    if (stories != null) {
      data['stories'] = stories!.toMap();
    }
    if (events != null) {
      data['events'] = events!.toMap();
    }
    if (urls != null) {
      data['urls'] = urls!.map((v) => v.toMap()).toList();
    }
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'modified': modified,
      'description': description,
      'name': name,
      'resourceUri': resourceUri,
      'comics': comics?.toMap(),
      'series': series?.toMap(),
      'stories': stories?.toMap(),
      'thumbnail': thumbnail?.toMap(),
      'events': events?.toMap(),
      'urls': urls?.map((url) => url.toMap()).toList(),
    };
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
  Map<String, dynamic> toMap() {
    return {
      'available': available,
      'collectionUri': collectionUri,
      'items': items?.map((item) => item.toMap()).toList(),
      'returned': returned,
    };
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
  Map<String, dynamic> toMap() {
    return {
      'resourceUri': resourceUri,
      'name': name,
    };
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

    Map<String, dynamic> toMap() {
    return {
      'available': available,
      'collectionUri': collectionUri,
      'items': items?.map((item) => item.toMap()).toList(),
      'returned': returned,
    };
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
    Map<String, dynamic> toMap() {
    return {
      'resourceUri': resourceUri,
      'name': name,
      'type': type,
    };
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
    Map<String, dynamic> toMap() {
    return {
      'type': type,
      'url': url,
    };
  }
}
