import 'package:marvel/layers/data/DTOs/character/list_character_dto.dart';
import 'package:marvel/layers/domain/entities/character_entity.dart';
import 'package:marvel/layers/domain/repositories/character_repository.dart';

import '../../data/DTOs/character/character_dto.dart';

class GetAllCharacters {
  GetAllCharacters({
    required CharacterRepository repository,
  }) : _repository = repository;

  final CharacterRepository _repository;

  Future<ListCharacterDTO?> call({int page = 0}) async {
    final listCharacters = await _repository.getCharacters(page: page);
    return listCharacters;
  }
}
