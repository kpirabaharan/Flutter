import 'package:flutter/material.dart';

import '../screens/orders_screen.dart';
import '../screens/user_products_screen.dart';

class AppDrawer extends StatelessWidget {
  Widget buildListTile(
      BuildContext ctx, String title, IconData iconData, VoidCallback onPress) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(
        title,
        style: Theme.of(ctx).textTheme.headline6,
      ),
      onTap: onPress,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('MyShop'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          buildListTile(
            context,
            'Shop',
            Icons.shop,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          buildListTile(
            context,
            'Orders',
            Icons.payment,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
          ),
          Divider(),
          buildListTile(
            context,
            'Manage Products',
            Icons.edit,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
