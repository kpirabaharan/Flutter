import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';
import '../models/products.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsContainer = Provider.of<Products>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.Favorites) {
                productsContainer.showFavoritesOnly();
              } else {
                productsContainer.showAll();
              }
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
