import 'package:marvel/layers/domain/entities/character_entity.dart';
import 'package:marvel/layers/domain/repositories/character_repository.dart';

import '../../data/DTOs/character/character_dto.dart';

class GetComicsInfosCharacters {
  GetComicsInfosCharacters({
    required CharacterRepository repository,
  }) : _repository = repository;

  final CharacterRepository _repository;

  // Future<List<ComicDetailsDTO>?> call({String? url}) async {
  //   final listCharacters = await _repository.getComi(page: page);
  //   return listCharacters;
  // }
}
