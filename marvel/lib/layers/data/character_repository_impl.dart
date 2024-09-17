import 'package:marvel/layers/data/DTOs/character/character_dto.dart';
import 'package:marvel/layers/data/datasources/external/service.dart';
import 'package:marvel/layers/data/datasources/local/local_storage.dart';
import 'package:marvel/layers/domain/entities/character_entity.dart';

import '../domain/repositories/character_repository.dart';
import 'DTOs/character/list_character_dto.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final Service _service;
  final LocalStorage _localStorage;

  CharacterRepositoryImpl({
    required Service service,
    required LocalStorage localStorage,
  })  : _service = service,
        _localStorage = localStorage;

  @override
  Future<ListCharacterDTO?> getCharacters({required int page}) async {
   
    final listFromCache = await _localStorage.getListCharacters(page: page);
    if (listFromCache != null && listFromCache.results!.isNotEmpty) {
      return listFromCache;
    }

    final request = await _service.getCharacterList(page: page);

    if (request != null && request.results!.isNotEmpty) {
      await _localStorage.saveListCharacters(page: page, list: request);
    }

    return request;
  }
}
