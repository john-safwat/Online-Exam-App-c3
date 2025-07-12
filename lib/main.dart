import 'package:flutter/material.dart';
import 'package:online_exam_app_c3/core/constants/constants.dart';
import 'package:online_exam_app_c3/core/l10n/translation/app_localizations.dart';
import 'package:online_exam_app_c3/core/providers/app_config_provider.dart';
import 'package:online_exam_app_c3/core/route/app_routes.dart';
import 'package:online_exam_app_c3/core/route/routes.dart';
import 'package:online_exam_app_c3/core/theme/app_theme.dart';
import 'package:provider/provider.dart';

import 'core/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await getIt<AppConfigProvider>().setSelectedLocale();
  runApp(
    ChangeNotifierProvider.value(
      value: getIt<AppConfigProvider>(),
      child: MyApp(),
    ),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  late AppConfigProvider appConfigProvider;

  @override
  Widget build(BuildContext context) {
    appConfigProvider = Provider.of(context);
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(Constants.enLocaleKey),
      onGenerateRoute: Routes.generateRoute,
      initialRoute: AppRoutes.login,
    );
  }
}
