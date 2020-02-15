// import 'package:financeiro/utils/responsivo.dart';
import 'package:flutter/material.dart';

class ViewSettingsToolbar {
  final bool visible;
  final Widget toolbarLeading;
  final List<Widget> toolbarActions;
  final Color toolbarTextColor;
  final Color toolbarColor;

  ViewSettingsToolbar({
    this.visible = true,
    this.toolbarLeading,
    this.toolbarActions,
    this.toolbarTextColor,
    this.toolbarColor,
  });
}

class ViewSettings {
  final String viewTitle;
  final ViewSettingsToolbar toolbar;
  final Color backgroundColor;
  // final double paddingHorizontal;
  // final double paddingVertical;
  // final bool noPadding;

  ViewSettings({
    this.viewTitle,
    this.toolbar,
    this.backgroundColor,
  });
}
