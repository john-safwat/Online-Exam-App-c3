import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_c3/presentation/login/login_view.dart';
import 'package:online_exam_app_c3/presentation/login/login_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceLocator {
  GetIt getIt = GetIt.instance;

  inti() async {
    // factory
    getIt.registerFactory<LoginView>(() => const LoginView());
    // singleton
    getIt.registerSingleton<LoginView>(const LoginView());
    // future
    getIt.registerFactoryAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance(),
    );
    getIt.registerSingletonAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance(),
    );
    getIt.registerFactory<Repo>(()=> RepoImpl());
    // getIt.registerFactory<LoginViewModel>(()=>LoginViewModel());
    await getIt.allReady();
    getIt<LoginView>();
  }
}


abstract interface class Repo{}

@Injectable(as: Repo)
class RepoImpl implements Repo{}