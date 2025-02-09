import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leadingIcon;
  final VoidCallback? leadingOnPressed;
  final List<Widget>? actionButtons;
  final bool automaticallyImplyLeading;

  const AppBarCustom({
    super.key,
    this.title,
    this.leadingIcon,
    this.leadingOnPressed,
    this.actionButtons,
    this.automaticallyImplyLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null
          ? Text(
              title!,
            )
          : null,
      leading: leadingIcon != null
          ? IconButton(
              icon: leadingIcon!,
              onPressed: leadingOnPressed ??
                  () {
                    Navigator.of(context).pop();
                  },
            )
          : null,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: actionButtons,
      centerTitle: true,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
