import 'package:flutter/material.dart';
import 'package:online_exam_app_c3/core/di/di.dart';
import 'package:online_exam_app_c3/core/l10n/translation/app_localizations.dart';
import 'package:online_exam_app_c3/core/providers/app_config_provider.dart';
import 'package:online_exam_app_c3/core/route/app_routes.dart';
import 'package:online_exam_app_c3/presentation/login/login_view.dart';

abstract class Routes {
  static Route generateRoute(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? "/");

    switch (url.path) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_)=> LoginView());
      default:
        return MaterialPageRoute(
          builder:
              (context) => Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Row(),
                    Text(AppLocalizations.of(context)!.appName),
                    FilledButton(onPressed: () {
                      if(getIt<AppConfigProvider>().isEn()){
                        getIt<AppConfigProvider>().changeLocale("ar");
                      }else{
                        getIt<AppConfigProvider>().changeLocale("en");
                      }
                    }, child: const Text("Test")),
                  ],
                ),
              ),
        );
    }
  }
}
