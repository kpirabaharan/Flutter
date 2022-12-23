import 'package:flutter/material.dart';
import '../providers/cart.dart';

class CartScreenItem extends StatelessWidget {
  final CartItem cartItem;

  CartScreenItem(this.cartItem);

  @override
  Widget build(BuildContext context) {
    print(cartItem);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(child: Text('\$${cartItem.price}'))),
          ),
          title: Text(cartItem.title),
          subtitle: Text('Total: \$${(cartItem.price * cartItem.quantity)}'),
          trailing: Text('${cartItem.quantity} x'),
        ),
      ),
    );
  }
}
