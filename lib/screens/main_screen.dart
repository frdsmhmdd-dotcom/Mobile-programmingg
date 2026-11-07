import 'package:flutter/material.dart';
import '../services/app_state.dart';
import '../widgets/ktm_dialog.dart';
import 'beranda_page.dart';
import 'menu_page.dart';
import 'keranjang_page.dart';
import 'riwayat_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  void _onTabChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _showKtmDialog() {
    showDialog(
      context: context,
      builder: (context) => const KtmProfileDialog(),
    );
  }

  String get _pageTitle {
    switch (_currentIndex) {
      case 0:
        return 'Beranda';
      case 1:
        return 'Katalog Menu';
      case 2:
        return 'Keranjang Belanja';
      case 3:
        return 'Riwayat Transaksi';
      default:
        return 'Warung Kuliner';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppState.instance,
      builder: (context, _) {
        final cartCount = AppState.instance.totalItemCount;

        return Scaffold(
          backgroundColor: const Color(0xFFF8FAFC),
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Warung Kuliner Nusantara',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _pageTitle,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            actions: [
              // Tombol KTM Mahasiswa UPGRIS
              IconButton(
                icon: const Icon(Icons.badge_outlined),
                tooltip: 'KTM Mahasiswa UPGRIS',
                onPressed: _showKtmDialog,
              ),
              const SizedBox(width: 8),
            ],
          ),
          body: IndexedStack(
            index: _currentIndex,
            children: [
              BerandaPage(onTabChange: _onTabChange),
              const MenuPage(),
              KeranjangPage(onTabChange: _onTabChange),
              RiwayatPage(onTabChange: _onTabChange),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: _onTabChange,
            indicatorColor: Colors.deepOrange.shade100,
            destinations: [
              const NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home, color: Colors.deepOrange),
                label: 'Beranda',
              ),
              const NavigationDestination(
                icon: Icon(Icons.restaurant_menu_outlined),
                selectedIcon:
                    Icon(Icons.restaurant_menu, color: Colors.deepOrange),
                label: 'Menu',
              ),
              NavigationDestination(
                icon: Badge(
                  isLabelVisible: cartCount > 0,
                  label: Text('$cartCount'),
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
                selectedIcon: Badge(
                  isLabelVisible: cartCount > 0,
                  label: Text('$cartCount'),
                  child:
                      const Icon(Icons.shopping_cart, color: Colors.deepOrange),
                ),
                label: 'Keranjang',
              ),
              const NavigationDestination(
                icon: Icon(Icons.receipt_long_outlined),
                selectedIcon:
                    Icon(Icons.receipt_long, color: Colors.deepOrange),
                label: 'Riwayat',
              ),
            ],
          ),
        );
      },
    );
  }
}
