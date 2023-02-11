import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../screens/orders_screen.dart';
import '../screens/user_products_screen.dart';
// import '../helpers/custom_route.dart';

class AppDrawer extends StatelessWidget {
  Widget buildListTile(
      BuildContext ctx, String title, IconData iconData, VoidCallback onPress) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(
        title,
        style: Theme.of(ctx).textTheme.titleLarge,
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
              // Change just this screen
              // Navigator.of(context).pushReplacement(
              //     CustomRoute(builder: (ctx) => OrdersScreen()));
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
          Divider(),
          buildListTile(
            context,
            'Logout',
            Icons.exit_to_app,
            () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/');
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
