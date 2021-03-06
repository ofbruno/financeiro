import 'package:financeiro/bases/base.controller.dart';
import 'package:financeiro/bases/view_settings.dart';
import 'package:financeiro/utils/responsivo.dart';
import 'package:financeiro/widgets/app/appbar.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BaseViewStateful<Controller extends BaseController> extends StatefulWidget {
  final Controller controller;

  BaseViewStateful({Key key, this.controller}) : super(key: key);
}

abstract class BaseViewState<View extends BaseViewStateful> extends State<View> {
  String title() => '';
  ViewSettings viewSettings() => ViewSettings();
  FloatingActionButton floatingActionButton() => null;
  Widget body();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _toolbarApp(),
      body: Container(
        color: viewSettings().backgroundColor ?? Theme.of(context).backgroundColor,
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(Responsivo.fracaoLarguraTela(10.0)),
        child: body(),
      ),
      floatingActionButton: floatingActionButton(),
    );
  }

  AppBarApp _toolbarApp() {
    if (viewSettings().appBar == null || viewSettings().appBar.visible) {
      return AppBarApp(
        title: title(),
        backgroundColor: viewSettings().appBar?.toolbarColor,
      );
    }

    return null;
  }
}
