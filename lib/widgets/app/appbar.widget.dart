import 'package:flutter/material.dart';

class AppBarApp extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;

  const AppBarApp({
    this.title,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        this.title ?? "Controle financeiro",
      ),
      backgroundColor: this.backgroundColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(60);
}
