import 'package:flutter/foundation.dart';
import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

///List of _orders
class Orders with ChangeNotifier {
  final List<OrderItem> _orders = [];

  ///getter of _orders
  List<OrderItem> get orders {
    return [..._orders];
  }

  ///Function for adding an order
  void addOrder(List<CartItem> cartProducts, double total) {
    final date = DateTime.now();
    _orders.insert(
      0,
      OrderItem(
        id: date.toString(),
        amount: total,
        dateTime: date,
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
