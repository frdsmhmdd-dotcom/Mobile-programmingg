import 'package:flutter/material.dart';

import '../models/menu_item.dart';
import '../widgets/ktm_dialog.dart';
import '../widgets/menu_image.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MenuItem> _allMenus = MenuItem.menuList;
  String _selectedCategory = 'Semua';

  final List<String> _categories = [
    'Semua',
    'Olahan Ayam',
    'Seafood & Ikan',
    'Sayuran',
  ];

  List<MenuItem> get _filteredMenus {
    if (_selectedCategory == 'Semua') {
      return _allMenus;
    }
    return _allMenus
        .where((menu) => menu.category == _selectedCategory)
        .toList();
  }

  static String _formatRupiah(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
  }

  void _showKtmDialog() {
    showDialog(
      context: context,
      builder: (context) => const KtmProfileDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Warung Kuliner Nusantara',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        actions: [
          // Tombol Kartu Mahasiswa (KTM)
          IconButton(
            icon: const Icon(Icons.badge_outlined),
            tooltip: 'KTM Mahasiswa',
            onPressed: _showKtmDialog,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Selamat Datang
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.deepOrange.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.deepOrange.shade100),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.restaurant_menu,
                        color: Colors.deepOrange, size: 36),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Selamat Datang di Katalog Menu',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Pilih menu masakan tradisional lezat di bawah untuk melihat detail resep & memesan.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Filter Kategori
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _categories.map((kategori) {
                      final isSelected = _selectedCategory == kategori;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(kategori),
                          selected: isSelected,
                          selectedColor: Colors.deepOrange,
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                          onSelected: (selected) {
                            if (selected) {
                              setState(() {
                                _selectedCategory = kategori;
                              });
                            }
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Daftar Menu (Grid Responsif untuk Web & Mobile)
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Jika layar desktop/web lebar (lebar > 700px), gunakan 3 kolom
                    // Jika layar sedang (500px - 700px), gunakan 2 kolom
                    // Jika layar hp kecil (< 500px), gunakan 1 kolom
                    int crossAxisCount = 1;
                    if (constraints.maxWidth > 700) {
                      crossAxisCount = 3;
                    } else if (constraints.maxWidth > 480) {
                      crossAxisCount = 2;
                    }

                    return GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: crossAxisCount == 1 ? 2.6 : 0.85,
                      ),
                      itemCount: _filteredMenus.length,
                      itemBuilder: (context, index) {
                        final menu = _filteredMenus[index];
                        return _buildMenuCard(context, menu, crossAxisCount == 1);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, MenuItem menu, bool isListStyle) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // Navigasi & Pengiriman data antarhalaman ke DetailPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPage(menu: menu)),
          );
        },
        child: isListStyle
            ? Row(
                children: [
                  Hero(
                    tag: 'menu_${menu.id}',
                    child: SizedBox(
                      width: 120,
                      height: double.infinity,
                      child: MenuImage(
                        imagePath: menu.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            menu.category,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange.shade700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            menu.name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Rp ${_formatRupiah(menu.price)}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Hero(
                      tag: 'menu_${menu.id}',
                      child: SizedBox(
                        width: double.infinity,
                        child: MenuImage(
                          imagePath: menu.imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          menu.category,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange.shade700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          menu.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rp ${_formatRupiah(menu.price)}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: Colors.deepOrange,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
