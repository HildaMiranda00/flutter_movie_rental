
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:project_hadmc/src/features/forms/controllers/form_controller.dart';
import 'package:project_hadmc/src/features/forms/controllers/user_controller.dart';

final getIt = GetIt.instance;

void configureDependencies(){
  getIt.registerFactory(() => http.Client);
  //getIt.registerFactory<UserDatasource>(() => UserDatasoucer(getIt()));
  //getIt.regsterFactory<UserRepository>(() => UserRepository(getIt()));
  getIt.registerSingleton<FormController>(FormController());
  getIt.registerSingleton<LoginController>(LoginController());


}
//a