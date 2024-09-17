import 'package:get_it/get_it.dart';
import 'package:marvel/layers/data/datasources/local/local_storage.dart';
import 'package:marvel/layers/presentation/UI/pages/character_list/page/character_list_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../layers/data/character_repository_impl.dart';
import '../layers/data/datasources/external/service.dart';
import '../layers/domain/repositories/character_repository.dart';
import '../layers/domain/usecases/get_all_characters.dart';
import '../layers/presentation/controllers/character_list_page_controller.dart';

GetIt getIt = GetIt.instance;

class Inject {
  Future<void> initializeInject() async {
    getIt.registerSingletonAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance());

    getIt.registerLazySingleton<Service>(() => Service());
    getIt.registerFactory<LocalStorage>(
      () => LocalStorageImpl(
        sharedPreferences: getIt(),
      ),
    );

    //data
    getIt.registerFactory<CharacterRepository>(
      () => CharacterRepositoryImpl(
        service: getIt(),
        localStorage: getIt(),
      ),
    );

    //repositories
    getIt.registerFactory(
      () => GetAllCharacters(
        repository: getIt(),
      ),
    );

    //controllers
    getIt.registerLazySingleton(
      () => CharacterListPageController(getAllCharacters: getIt()),
    );
    await getIt.allReady();
  }
}
