import 'package:flutter/material.dart';

class ToolbarApp extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;

  const ToolbarApp({
    this.title,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        this.title ?? "Controle financeiro",
      ),
      backgroundColor: this.backgroundColor ?? Theme.of(context).primaryColor,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(60);
}
