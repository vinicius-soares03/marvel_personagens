import 'package:marvel/layers/domain/entities/character_entity.dart';
import 'package:marvel/layers/domain/repositories/character_repository.dart';

import '../../data/DTOs/character/character_dto.dart';

class GetAllCharacters {
  GetAllCharacters({
    required CharacterRepository repository,
  }) : _repository = repository;

  final CharacterRepository _repository;

  Future<List<CharacterDto>?> call({int page = 0}) async {
    final listCharacters = await _repository.getCharacters(page: page);
    return listCharacters;
  }
}
