import 'cart_item.dart';

class OrderHistory {
  final String id;
  final DateTime date;
  final List<CartItem> items;
  final int totalAmount;
  final String status; // 'Diproses' atau 'Selesai'

  OrderHistory({
    required this.id,
    required this.date,
    required this.items,
    required this.totalAmount,
    this.status = 'Selesai',
  });
}

