import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_c3/core/di/di.config.dart';
import 'package:online_exam_app_c3/presentation/login/login_view.dart';
import 'package:online_exam_app_c3/presentation/login/login_view_model.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async => await getIt.init();

// factory @injectable
// singleton @singleton
// future @preResolve
// implementation for abstract @Injectable(as: Repo)
// @module
// @lazySingleton
// @factoryMethod