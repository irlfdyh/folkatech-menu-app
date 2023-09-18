import 'package:flutter/material.dart';

import '../entity/menu_entity.dart';

class MenuItem extends StatelessWidget {

  final MenuEntity menu;

  const MenuItem({
    super.key,
    required this.menu
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Ink(
            width: 40,
            height: 40,
            decoration: const ShapeDecoration(
              color: Colors.lightBlue,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(menu.icon),
              color: Colors.white,
              onPressed: () { },
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          menu.title,
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }

}