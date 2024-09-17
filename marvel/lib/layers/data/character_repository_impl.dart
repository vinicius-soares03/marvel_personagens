import 'package:marvel/layers/data/DTOs/character/character_dto.dart';
import 'package:marvel/layers/data/datasources/external/service.dart';
import 'package:marvel/layers/data/datasources/local/local_storage.dart';
import 'package:marvel/layers/domain/entities/character_entity.dart';

import '../domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final Service _service;
  final LocalStorage _localStorage;

  CharacterRepositoryImpl({
    required Service service,
    required LocalStorage localStorage,
  })  : _service = service,
        _localStorage = localStorage;

  @override
  Future<List<CharacterDto>?> getCharacters({int page = 0}) async {
    // //TESTE, MUDAR PARA CHAMADA COM DIO
    //List<CharacterEntity> list = [CharacterEntity(id: 1, name: 'teste')];

    final request = await _service.getCharacterList();
   
    return request;
  }
}
