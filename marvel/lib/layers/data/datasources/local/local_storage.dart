import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../DTOs/character/character_dto.dart';
import '../../DTOs/character/list_character_dto.dart';

const cachedCharacterListKey = 'CHARACTER_LIST_PAGE';

abstract class LocalStorage {
  Future<bool> saveListCharacters({
    required int page,
    required ListCharacterDTO? list,
  });

  Future<ListCharacterDTO?> getListCharacters({required int page});
  Future<bool> clearSharedPreferences();
}

class LocalStorageImpl implements LocalStorage {
  final SharedPreferences _sharedPref;

  LocalStorageImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPref = sharedPreferences;

  @override
  Future<ListCharacterDTO?> getListCharacters({required int page}) async {
    final prefs = await SharedPreferences.getInstance();
    final key = getKeyCachedPage(page);
    final jsonString = prefs.getString(key);

    if (jsonString == null) {
      return null;
    }

    final jsonMap = jsonDecode(jsonString);
    return ListCharacterDTO.fromJson(jsonMap);
  }

  @override
  Future<bool> saveListCharacters(
      {required int page, required ListCharacterDTO? list}) async {
    if (list == null || list.results == null) {
      return Future.value(false);
    }

    final prefs = await SharedPreferences.getInstance();
    final key = getKeyCachedPage(page);
    final jsonString = jsonEncode(list);
    return prefs.setString(key, jsonString);
  }

  static String getKeyCachedPage(int page) {
    return '${cachedCharacterListKey}_$page';
  }

  @override
  Future<bool> clearSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }
}
