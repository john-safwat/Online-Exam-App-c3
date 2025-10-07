
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_c3/core/l10n/translation/app_localizations.dart';
import 'package:online_exam_app_c3/presentation/login/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginViewModel>(
      create: (context) => LoginViewModel()..getLocationUpdates(),
      child: BlocBuilder<LoginViewModel, LoginViewStates>(
        builder: (context, state) {
          var cubit = BlocProvider.of<LoginViewModel>(context);
          return Scaffold(
            appBar: AppBar(title: Text(AppLocalizations.of(context)!.login)),
            body: Center(
              child:
                  state.locationData == null
                      ? CircularProgressIndicator()
                      : Text(
                        "${state.locationData?.latitude} : ${state.locationData?.longitude}",
                      ),
            ),
          );
        },
      ),
    );
  }
}
