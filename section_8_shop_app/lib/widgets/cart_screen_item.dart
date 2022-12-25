import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartScreenItem extends StatelessWidget {
  final CartItem cartItemVals;
  final String cartItemKeys;

  CartScreenItem(this.cartItemKeys, this.cartItemVals);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItemVals.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Remove from Cart?'),
            content: Text('This will remove the item from the cart.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
                child: Text('Yes'),
              ),
            ],
          ),
        );
      },
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete, color: Colors.white, size: 40),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(cartItemKeys);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                  padding: EdgeInsets.all(5),
                  child: FittedBox(child: Text('\$${cartItemVals.price}'))),
            ),
            title: Text(cartItemVals.title),
            subtitle: Text(
                'Total: \$${(cartItemVals.price * cartItemVals.quantity)}'),
            trailing: Text('${cartItemVals.quantity} x'),
          ),
        ),
      ),
    );
  }
}
