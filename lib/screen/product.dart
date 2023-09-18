import 'package:flutter/material.dart';
import 'package:folkatech_product_app/provider/product_provider.dart';
import 'package:folkatech_product_app/screen/menu.dart';
import 'package:folkatech_product_app/screen/product_detail.dart';
import 'package:folkatech_product_app/widget/menu_item.dart';
import 'package:provider/provider.dart';

import '../entity/menu_entity.dart';
import '../widget/product_item.dart';

/// Screen that display product data
class Product extends StatefulWidget {
  const Product({ super.key });

  @override
  State<StatefulWidget> createState() {
    return ProductState();
  }
}

class ProductState extends State<Product> {

  final List<MenuEntity> menus = [
    const MenuEntity(icon: Icons.home, title: "Home"),
    const MenuEntity(icon: Icons.menu, title: "Menu"),
    const MenuEntity(icon: Icons.favorite, title: "Favorite"),
    const MenuEntity(icon: Icons.person, title: "Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      builder: (context, child) => Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: const Text("List Product")
          ),
          body: Consumer<ProductProvider>(
              builder: (context, product, child) => FutureBuilder(
                  future: product.fetchProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: (1 / 1.05)
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListItemWidget(
                            title: snapshot.data![index].name,
                            subtitle: snapshot.data![index].price.toString(),
                            imageUrl: snapshot.data![index].cover,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetail(product: snapshot.data![index])
                                  )
                              );
                            },
                          );
                        },
                        padding: const EdgeInsets.all(8),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.error}'),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      ) ;
                    }

                  }),
          ),
        floatingActionButton: GestureDetector(
          onVerticalDragUpdate: (details) {
            int sensitivity = 8;
            if (details.delta.dy < -sensitivity) {
              Navigator.of(context).push(navigateToMenu());
            }
          },
          child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24))
              ),
              child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    left: 32,
                    right: 32
                  ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MenuItem(menu: menus[0]),
                    const SizedBox(width: 16),
                    MenuItem(menu: menus[1]),
                    const SizedBox(width: 16),
                    MenuItem(menu: menus[2]),
                    const SizedBox(width: 16),
                    MenuItem(menu: menus[3]),
                  ],
                ),
              )
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

/// Function to help navigate to menu screen with animation
Route navigateToMenu() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Menu(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
