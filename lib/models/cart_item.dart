import 'menu_item.dart';

class CartItem {
  final MenuItem menu;
  int quantity;

  CartItem({
    required this.menu,
    this.quantity = 1,
  });

  int get totalPrice => menu.price * quantity;
}
