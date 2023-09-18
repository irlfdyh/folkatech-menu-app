import 'package:flutter/material.dart';
import 'package:folkatech_product_app/widget/menu_item.dart';

import '../entity/menu_entity.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {

    final List<MenuEntity> menus = [
      const MenuEntity(icon: Icons.home, title: "Home"),
      const MenuEntity(icon: Icons.menu, title: "Menu"),
      const MenuEntity(icon: Icons.favorite, title: "Favorite"),
      const MenuEntity(icon: Icons.person, title: "Profile"),
      const MenuEntity(icon: Icons.message, title: "Message"),
      const MenuEntity(icon: Icons.settings, title: "Setting"),
      const MenuEntity(icon: Icons.notifications, title: "Notification"),
      const MenuEntity(icon: Icons.search, title: "Search"),
      const MenuEntity(icon: Icons.group, title: "Friend"),
      const MenuEntity(icon: Icons.browse_gallery, title: "Gallery"),
      const MenuEntity(icon: Icons.event, title: "Event"),
      const MenuEntity(icon: Icons.help, title: "Help"),
      const MenuEntity(icon: Icons.info, title: "About"),
      const MenuEntity(icon: Icons.login, title: "Login"),
      const MenuEntity(icon: Icons.share, title: "Share"),
      const MenuEntity(icon: Icons.favorite, title: "Donate"),
    ];

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text("Feature")
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8
          ),
          itemCount: menus.length,
          itemBuilder: (BuildContext context, int index) {
            return MenuItem(menu: menus[index]);
          },
          padding: const EdgeInsets.all(16),
        )
    );
  }
}
