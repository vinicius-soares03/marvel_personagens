import 'package:marvel/layers/domain/entities/character_entity.dart';

import '../../data/DTOs/character/character_dto.dart';

abstract class CharacterRepository {
  Future<List<CharacterDto>?> getCharacters({int page = 0});
}
