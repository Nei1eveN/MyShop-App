import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  ///Map for cart items

  Map<String, CartItem> get items => {..._items};

  ///getter of _items

  int get itemCount => _items.length;

  ///Counts the number of _items in the cart

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  /// Computes the total price of items in the cart. The price of the item multiplied by the quantity, then the total of items.

  void addItem(
    ///Function for adding items in the cart
    String productId,
    double price,
    String title,
  ) {
    if (_items.containsKey(productId)) {
      ///if the _items have the existing productId in the map, the quantity of an item will add up
      // change quantity...
      _items.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity + 1,
              ));
    } else {
      ///if there is no existing productId, a new item will be added
      _items.putIfAbsent(
        productId,
        () {
          return CartItem(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: 1,
          );
        },
      );
    }
    notifyListeners();

    ///Notifies the provider about the changes in the cart
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  ///Removes an item in the cart

  void removeSingleItem(String productId) {
    ///This function is used by the snackbar when the UNDO button is pressed
    if (!_items.containsKey(productId)) {
      ///If the productId is not present in the cart items, it will return nothing
      return;
    }
    if (_items[productId].quantity > 1) {
      ///If the productId is present in the cart items, when the UNDO button is pressed, it will deduct the recently added item
      _items.update(productId, (existingCartItem) {
        return CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity - 1,
        );
      });
    } else { ///Removes the item
      _items.remove(productId);
    }
    notifyListeners(); ///Notifies the provider about changes in the cart items
  }

// clear cart
  void clear() {
    _items = {};
    notifyListeners();
  }
}
