import 'package:shared_preferences/shared_preferences.dart';

import '../../DTOs/character/character_dto.dart';

abstract class LocalStorage {

    Future<bool> saveListCharacters({
    required int page,
    required List<CharacterDto> list,
  });

  List<CharacterDto> getListCharacters({required int page});
}

class LocalStorageImpl implements LocalStorage {
  final SharedPreferences _sharedPref;

  LocalStorageImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPref = sharedPreferences;


  @override
  List<CharacterDto> getListCharacters({required int page}) {
    // TODO: implement getListCharacters
    throw UnimplementedError();
  }

  @override
  Future<bool> saveListCharacters({required int page, required List<CharacterDto> list}) {
    // TODO: implement saveListCharacters
    throw UnimplementedError();
  }}