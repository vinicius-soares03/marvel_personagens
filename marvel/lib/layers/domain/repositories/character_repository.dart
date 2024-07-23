import 'package:marvel/layers/domain/entities/character_entity.dart';

import '../../data/DTOs/character/character_dto.dart';
import '../../data/DTOs/character/list_character_dto.dart';

abstract class CharacterRepository {
  Future<ListCharacterDTO?> getCharacters({required int page});
}
