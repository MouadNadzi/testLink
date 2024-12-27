/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/main_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showProfileAction;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showProfileAction = true,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MainController>(context, listen: false);
    
    return AppBar(
      title: Text(title),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: controller.openDrawer,
      ),
      actions: [
        if (actions != null) ...actions!,
        if (showProfileAction)
          GestureDetector(
            onTap: () {
              controller.setIndex(3); // Switch to profile tab
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}*/
// File: lib/widgets/common/custom_app_bar.dart
/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/main_controller.dart';
import '../../controllers/auth_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showMenuButton;
  final bool showProfileButton;
  final List<Widget>? actions;
  final Widget? leading;
  final VoidCallback? onLeadingPressed;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showMenuButton = true,
    this.showProfileButton = true,
    this.actions,
    this.leading,
    this.onLeadingPressed,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    final mainController = context.read<MainController>();
    final user = context.watch<AuthController>().currentUser;

    return AppBar(
      title: Text(title),
      centerTitle: centerTitle,
      leading: leading ??
          (showMenuButton
              ? IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: onLeadingPressed ?? mainController.openDrawer,
                )
              : null),
      actions: [
        if (actions != null) ...actions!,
        if (showProfileButton) ...[
          GestureDetector(
            onTap: () => mainController.setIndex(3),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: CircleAvatar(
                backgroundImage: user?.photoUrl != null
                    ? NetworkImage(user!.photoUrl!)
                    : null,
                child: user?.photoUrl == null
                    ? Text(user?.name?.substring(0, 1).toUpperCase() ?? 'U')
                    : null,
              ),
            ),
          ),
        ],
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback? onMenuPressed;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;

  const SearchAppBar({
    super.key,
    required this.controller,
    this.hintText = 'Search...',
    this.onMenuPressed,
    this.onChanged,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: onMenuPressed ?? context.read<MainController>().openDrawer,
      ),
      title: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              controller.clear();
              onClear?.call();
            },
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}*/
/*
// File: lib/widgets/common/custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';
import '../../config/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final VoidCallback? onMenuPressed;
  final bool showProfileButton;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.onMenuPressed,
    this.showProfileButton = true,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: centerTitle,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: onMenuPressed ?? () {
          Scaffold.of(context).openDrawer();
        },
      ),
      backgroundColor: AppTheme.backgroundColor,
      elevation: 0,
      actions: [
        if (actions != null) ...actions!,
        if (showProfileButton) ...[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: _buildProfileButton(context),
          ),
        ],
      ],
    );
  }

  Widget _buildProfileButton(BuildContext context) {
    final user = context.watch<AuthController>().currentUser;
    
    return GestureDetector(
      onTap: () {
        // Navigate to profile screen
      },
      child: CircleAvatar(
        backgroundColor: AppTheme.primaryColor,
        child: user?.photoUrl != null
            ? ClipOval(
                child: Image.network(
                  user!.photoUrl!,
                  width: 36,
                  height: 36,
                  fit: BoxFit.cover,
                ),
              )
            : Text(
                user?.name?.substring(0, 1).toUpperCase() ?? 'U',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';
import '../../config/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onProfileTap;
  final bool showProfileButton;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.onMenuPressed,
    this.onProfileTap,
    this.showProfileButton = true,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthController>().currentUser;
    
    return AppBar(
      title: Text(title),
      centerTitle: centerTitle,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: onMenuPressed ?? () {
          Scaffold.of(context).openDrawer();
        },
      ),
      backgroundColor: AppTheme.backgroundColor,
      elevation: 0,
      actions: [
        if (actions != null) ...actions!,
        if (showProfileButton) ...[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: onProfileTap,
              child: CircleAvatar(
                backgroundColor: AppTheme.primaryColor,
                child: user?.photoUrl != null
                    ? ClipOval(
                        child: Image.network(
                          user!.photoUrl!,
                          width: 36,
                          height: 36,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Text(
                        user?.name?.substring(0, 1).toUpperCase() ?? 'U',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
