import 'package:financeiro/bases/base_stateful.view.dart';
import 'package:financeiro/ui/home/home.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends BaseViewStateful<HomeControler> {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends BaseViewState<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget body() {
    return Column(
      children: <Widget>[Text('Sejam bem-vindos')],
    );
  }

  @override
  FloatingActionButton floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        print('teste');
      },
    );
  }
}
