import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../services/app_state.dart';
import '../widgets/menu_image.dart';

class DetailPage extends StatefulWidget {
  // Pengiriman data dari Halaman Utama
  final MenuItem menu;

  const DetailPage({super.key, required this.menu});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _porsi = 1;

  void _tambahPorsi() {
    setState(() {
      _porsi++;
    });
  }

  void _kurangPorsi() {
    if (_porsi > 1) {
      setState(() {
        _porsi--;
      });
    }
  }

  void _tambahKeKeranjang() {
    AppState.instance.addToCart(widget.menu, quantity: _porsi);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green.shade700,
        content: Text(
          '$_porsi porsi ${widget.menu.name} berhasil masuk ke keranjang!',
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
    Navigator.pop(context);
  }

  static String _formatRupiah(int price) {
    return price.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
        );
  }

  @override
  Widget build(BuildContext context) {
    final menu = widget.menu;
    final int totalBayar = menu.price * _porsi;

    return Scaffold(
      appBar: AppBar(
        title: Text(menu.name),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar Menu dengan Animasi Hero
                Hero(
                  tag: 'menu_${menu.id}',
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: MenuImage(
                      imagePath: menu.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Kategori & Harga Satuan
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Chip(
                            label: Text(menu.category),
                            backgroundColor: Colors.deepOrange.shade50,
                            side: BorderSide(color: Colors.deepOrange.shade200),
                            labelStyle: TextStyle(
                              color: Colors.deepOrange.shade800,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Rp ${_formatRupiah(menu.price)} / porsi',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // Nama Menu
                      Text(
                        menu.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                        ),
                      ),

                      const SizedBox(height: 14),
                      const Divider(),
                      const SizedBox(height: 14),

                      // Deskripsi
                      const Text(
                        'Deskripsi Menu:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        menu.description,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.6,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Bahan / Komposisi
                      const Text(
                        'Bahan-Bahan:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: menu.ingredients.map((bahan) {
                          return Chip(
                            avatar: const Icon(Icons.check,
                                size: 16, color: Colors.green),
                            label: Text(bahan),
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.grey.shade300),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 24),
                      const Divider(),
                      const SizedBox(height: 16),

                      // Hitung Porsi
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Jumlah Pesanan:',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              IconButton.filledTonal(
                                onPressed: _kurangPorsi,
                                icon: const Icon(Icons.remove),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  '$_porsi',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              IconButton.filledTonal(
                                onPressed: _tambahPorsi,
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Total & Tombol Tambah ke Keranjang
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.deepOrange.shade100),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Total Tagihan:',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                ),
                                Text(
                                  'Rp ${_formatRupiah(totalBayar)}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton.icon(
                              onPressed: _tambahKeKeranjang,
                              icon: const Icon(Icons.add_shopping_cart),
                              label: const Text('Tambah ke Keranjang'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrange,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
