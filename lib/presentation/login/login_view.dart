
import 'package:flutter/material.dart';
import 'package:online_exam_app_c3/core/l10n/translation/app_localizations.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(AppLocalizations.of(context)!.login),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
            decoration: InputDecoration(
              label: Text("aasdas"  , style: Theme.of(context).textTheme.bodyMedium,)
            ),
          ),
          FilledButton(onPressed: null, child: Text("Login"))
        ],
      ),
    );
  }
}
