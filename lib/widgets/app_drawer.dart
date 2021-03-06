import 'package:flutter/material.dart';

import '../screens/orders_screen.dart';
import '../screens/products_overview_screen.dart';
import '../screens/user_products_screen.dart';

///Shows the App Drawer
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () => Navigator.of(context).popAndPushNamed(ProductsOverviewScreen.routeName),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () => Navigator.of(context).popAndPushNamed(OrdersScreen.routeName),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () => Navigator.of(context).popAndPushNamed(UserProductsScreen.routeName),
          ),
        ],
      ),
    );
  }
}
