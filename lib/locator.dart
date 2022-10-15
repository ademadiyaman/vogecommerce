import 'package:get_it/get_it.dart';
import 'package:vog_demo/Repository/user_repository.dart';
import 'package:vog_demo/Services/firebase_auth_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => UserRepository());
}
