import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExtensions on BuildContext {
  AppLocalizations get tr => AppLocalizations.of(this)!;
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  ThemeData get theme => Theme.of(this);

  Size get msize => mediaQuery.size;
}
