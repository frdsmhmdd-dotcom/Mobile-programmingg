import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../models/cart_item.dart';
import '../models/order_history.dart';

class AppState extends ChangeNotifier {
  // Singleton instance agar state mudah diakses di seluruh halaman
  static final AppState instance = AppState._internal();
  AppState._internal() {
    _initInitialData();
  }

  final List<CartItem> _cartItems = [];
  final List<OrderHistory> _orderHistory = [];

  List<CartItem> get cartItems => List.unmodifiable(_cartItems);
  List<OrderHistory> get orderHistory => List.unmodifiable(_orderHistory);

  int get totalItemCount =>
      _cartItems.fold(0, (sum, item) => sum + item.quantity);

  int get subtotalPrice =>
      _cartItems.fold(0, (sum, item) => sum + item.totalPrice);

  int get serviceFee => _cartItems.isEmpty ? 0 : 2000;

  int get grandTotal => subtotalPrice + serviceFee;

  void _initInitialData() {
    // Data contoh awal di keranjang agar tidak kosong saat baru dibuka
    if (MenuItem.menuList.isNotEmpty) {
      _cartItems.add(CartItem(menu: MenuItem.menuList[0], quantity: 2));
    }

    // Data contoh riwayat pesanan sebelumnya
    if (MenuItem.menuList.length > 2) {
      _orderHistory.add(
        OrderHistory(
          id: 'TRX-20261107-001',
          date: DateTime.now().subtract(const Duration(hours: 3)),
          items: [
            CartItem(menu: MenuItem.menuList[1], quantity: 1), // Ayam Goreng
            CartItem(menu: MenuItem.menuList[8], quantity: 1), // Tumis Buncis
          ],
          totalAmount: 34000,
          status: 'Selesai',
        ),
      );
    }
  }

  void addToCart(MenuItem menu, {int quantity = 1}) {
    final existingIndex =
        _cartItems.indexWhere((item) => item.menu.id == menu.id);
    if (existingIndex != -1) {
      _cartItems[existingIndex].quantity += quantity;
    } else {
      _cartItems.add(CartItem(menu: menu, quantity: quantity));
    }
    notifyListeners();
  }

  void updateQuantity(String menuId, int delta) {
    final index = _cartItems.indexWhere((item) => item.menu.id == menuId);
    if (index != -1) {
      _cartItems[index].quantity += delta;
      if (_cartItems[index].quantity <= 0) {
        _cartItems.removeAt(index);
      }
      notifyListeners();
    }
  }

  void removeFromCart(String menuId) {
    _cartItems.removeWhere((item) => item.menu.id == menuId);
    notifyListeners();
  }

  OrderHistory? checkout() {
    if (_cartItems.isEmpty) return null;

    final newOrder = OrderHistory(
      id: 'TRX-${DateTime.now().millisecondsSinceEpoch.toString().substring(5)}',
      date: DateTime.now(),
      items: List.from(_cartItems),
      totalAmount: grandTotal,
      status: 'Diproses',
    );

    _orderHistory.insert(0, newOrder);
    _cartItems.clear();
    notifyListeners();
    return newOrder;
  }
}
