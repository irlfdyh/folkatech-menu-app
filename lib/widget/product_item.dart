import 'package:flutter/material.dart';

/// Reusable item to show product in grid layout
class ListItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final VoidCallback onTap;

  const ListItemWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: InkWell(
          splashColor: Colors.grey.withAlpha(30),
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.network(
                imageUrl,
                width: MediaQuery.of(context).size.width,
                height: 128,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child:  Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                        subtitle,
                        style: Theme.of(context).textTheme.titleSmall
                    )
                  ],
                ),
              )
            ],
          )
      )
    );
  }
}
