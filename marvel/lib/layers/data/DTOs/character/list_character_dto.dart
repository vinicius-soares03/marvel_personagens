import 'character_dto.dart';

class ListCharacterDTO {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<CharacterDto>? results;

  ListCharacterDTO({this.offset, this.limit, this.total, this.count,this.results});

  ListCharacterDTO.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null && json['results'] is List) {
      results = (json['results'] as List<dynamic>)
          .map((item) => CharacterDto.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      results = [];
    }
  
  }

  Map<String, dynamic> toJson() {
    return {
      'offset': offset,
      'limit': limit,
      'total': total,
      'count': count,
      'results': results?.map((e) => e.toJson()).toList(),
    };
  }
}
