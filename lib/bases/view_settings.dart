// import 'package:financeiro/utils/responsivo.dart';
import 'package:flutter/material.dart';

class ViewSettingsAppBar {
  final bool visible;
  final Widget toolbarLeading;
  final List<Widget> toolbarActions;
  final Color toolbarTextColor;
  final Color toolbarColor;

  ViewSettingsAppBar({
    this.visible = true,
    this.toolbarLeading,
    this.toolbarActions,
    this.toolbarTextColor,
    this.toolbarColor,
  });
}

class ViewSettings {
  //final String viewTitle;
  final ViewSettingsAppBar appBar;
  final Color backgroundColor;

  ViewSettings({
    //this.viewTitle,
    this.appBar,
    this.backgroundColor,
  });
}
