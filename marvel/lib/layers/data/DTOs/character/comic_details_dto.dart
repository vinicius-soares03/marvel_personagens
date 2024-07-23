import 'package:marvel/layers/data/DTOs/character/character_thumbnail.dart';

class ComicDetailsDTO {
  int? id;
  int? digitalId;
  String? title;
  int? issueNumber;
  String? variantDescription;
  String? description;
  List<TextObjects>? textObjects;
  List<Urls>? urls;
  List<Prices>? prices;
  Thumbnail? thumbnail;
  List<Thumbnail>? images;

  ComicDetailsDTO(
      {this.id,
      this.digitalId,
      this.title,
      this.issueNumber,
      this.variantDescription,
      this.description,
      this.textObjects,
      this.urls,
      this.prices,
      this.thumbnail,
      this.images});

  ComicDetailsDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    digitalId = json['digitalId'];
    title = json['title'];
    issueNumber = json['issueNumber'];
    variantDescription = json['variantDescription'];
    description = json['description'];
    if (json['textObjects'] != null) {
      textObjects = <TextObjects>[];
      json['textObjects'].forEach((v) {
        textObjects!.add(new TextObjects.fromJson(v));
      });
    }
    if (json['urls'] != null) {
      urls = <Urls>[];
      json['urls'].forEach((v) {
        urls!.add(new Urls.fromJson(v));
      });
    }
    if (json['prices'] != null) {
      prices = <Prices>[];
      json['prices'].forEach((v) {
        prices!.add(new Prices.fromJson(v));
      });
    }
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    if (json['images'] != null) {
      images = <Thumbnail>[];
      json['images'].forEach((v) {
        images!.add(new Thumbnail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['digitalId'] = this.digitalId;
    data['title'] = this.title;
    data['issueNumber'] = this.issueNumber;
    data['variantDescription'] = this.variantDescription;
    data['description'] = this.description;
    if (this.textObjects != null) {
      data['textObjects'] = this.textObjects!.map((v) => v.toJson()).toList();
    }
    if (this.urls != null) {
      data['urls'] = this.urls!.map((v) => v.toJson()).toList();
    }
    if (this.prices != null) {
      data['prices'] = this.prices!.map((v) => v.toJson()).toList();
    }
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TextObjects {
  String? type;
  String? language;
  String? text;

  TextObjects({this.type, this.language, this.text});

  TextObjects.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    language = json['language'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['language'] = this.language;
    data['text'] = this.text;
    return data;
  }
}

class Urls {
  String? type;
  String? url;

  Urls({this.type, this.url});

  Urls.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}

class Prices {
  String? type;
  double? price;

  Prices({this.type, this.price});

  Prices.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['price'] = this.price;
    return data;
  }
}

