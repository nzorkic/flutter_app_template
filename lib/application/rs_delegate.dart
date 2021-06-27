// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialLocalizationRsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  @override
  bool isSupported(Locale locale) => locale.languageCode == 'rs';

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      MaterialLocalizationRs();

  @override
  bool shouldReload(
          covariant LocalizationsDelegate<MaterialLocalizations> old) =>
      false;
}

class MaterialLocalizationRs extends DefaultMaterialLocalizations {}
