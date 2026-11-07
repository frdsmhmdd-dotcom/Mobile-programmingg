import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warung Makan Pepes Mendoan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const BerandaPage(),
    );
  }
}

// ============================================================
// HALAMAN 1: BERANDA
// ============================================================
class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  Future<void> _bukaWhatsApp() async {
    // Format nomor WA: ganti 0 di depan dengan 62
    final Uri url = Uri.parse('https://wa.me/6282328559628');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Warung Makan Pepes Mendoan'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon Restoran
            const Icon(
              Icons.restaurant,
              size: 100,
              color: Colors.orange,
            ),
            const SizedBox(height: 24),

            // Judul Warung
            const Text(
              'Warung Makan Pepes Mendoan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            // Deskripsi
            const Text(
              'Nikmati aneka masakan tradisional lezat',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Tombol ke Halaman Katalog
            ElevatedButton.icon(
              onPressed: () {
                // Navigasi ke Halaman Katalog Makanan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const KatalogPage(),
                  ),
                );
              },
              icon: const Icon(Icons.menu_book),
              label: const Text(
                'Lihat Katalog Makanan',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Teks hubungi
            const Text(
              'Jika berminat, hubungi kami:',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),

            // Tombol WhatsApp
            ElevatedButton.icon(
              onPressed: _bukaWhatsApp,
              icon: const Icon(Icons.chat),
              label: const Text(
                'Hubungi via WhatsApp',
                style: TextStyle(fontSize: 15),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF25D366), // Warna hijau WA
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 13,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// MODEL DATA MAKANAN
// ============================================================
class Makanan {
  final String nama;
  final String kategori;
  final int harga;
  final String gambar;
  final String deskripsi;

  const Makanan({
    required this.nama,
    required this.kategori,
    required this.harga,
    required this.gambar,
    required this.deskripsi,
  });
}

// Data dummy daftar makanan
final List<Makanan> daftarMakanan = [
  const Makanan(
    nama: 'Ayam Pop',
    kategori: 'Ayam',
    harga: 22000,
    gambar: 'assets/images/Ayam Pop.jpg',
    deskripsi:
        'Ayam pop khas Minang, dimasak dengan air kelapa dan bumbu putih. Lembut, gurih, dan disajikan dengan sambal tomat pedas.',
  ),
  const Makanan(
    nama: 'Ayam Goreng',
    kategori: 'Ayam',
    harga: 20000,
    gambar: 'assets/images/Ayam-Goreng.jpg',
    deskripsi:
        'Ayam goreng bumbu rempah tradisional, digoreng hingga garing keemasan dengan taburan serundeng lengkuas yang renyah.',
  ),
  const Makanan(
    nama: 'Ayam Panggang',
    kategori: 'Ayam',
    harga: 25000,
    gambar: 'assets/images/Ayam-Panggang.jpg',
    deskripsi:
        'Ayam panggang olesan bumbu kecap manis gurih, dibakar sempurna dengan aroma asap yang harum dan menggugah selera.',
  ),
  const Makanan(
    nama: 'Balado Ikan',
    kategori: 'Ikan',
    harga: 18000,
    gambar: 'assets/images/Balado-Ikan.jpg',
    deskripsi:
        'Ikan goreng disiram sambal balado merah pedas manis, cocok dimakan dengan nasi putih hangat.',
  ),
  const Makanan(
    nama: 'Ikan Kembung Bakar',
    kategori: 'Ikan',
    harga: 18000,
    gambar: 'assets/images/Ikan-Kembung.jpg',
    deskripsi:
        'Ikan kembung segar dibakar dengan bumbu kecap pedas. Kaya omega-3 dan tekstur daging yang lembut.',
  ),
  const Makanan(
    nama: 'Tumis Kerang',
    kategori: 'Seafood',
    harga: 20000,
    gambar: 'assets/images/Kerang.jpg',
    deskripsi:
        'Kerang dara kupas ditumis dengan saus tiram, cabai hijau, dan jahe. Segar dan gurih.',
  ),
  const Makanan(
    nama: 'Opor Ayam',
    kategori: 'Ayam',
    harga: 23000,
    gambar: 'assets/images/Opor-Ayam.jpg',
    deskripsi:
        'Ayam kuah santan kental bercita rasa rempah kunyit dan serai, dengan taburan bawang goreng renyah.',
  ),
  const Makanan(
    nama: 'Sup Ayam',
    kategori: 'Ayam',
    harga: 16000,
    gambar: 'assets/images/Sup-Ayam.jpg',
    deskripsi:
        'Sup ayam kuah bening hangat dengan wortel, kentang, dan suwiran ayam. Menyehatkan dan menyegarkan.',
  ),
  const Makanan(
    nama: 'Tumis Buncis',
    kategori: 'Sayuran',
    harga: 12000,
    gambar: 'assets/images/Tumis-Buncis.jpg',
    deskripsi:
        'Buncis muda dan wortel ditumis renyah dengan bawang putih dan saus tiram. Sehat dan kaya serat.',
  ),
  const Makanan(
    nama: 'Udang Tofu',
    kategori: 'Seafood',
    harga: 25000,
    gambar: 'assets/images/Udang-Tofu.jpg',
    deskripsi:
        'Udang segar dan tofu lembut dimasak dengan saus tiram dan bawang putih. Lezat dan bergizi tinggi.',
  ),
];

// ============================================================
// HALAMAN 2: KATALOG MAKANAN
// ============================================================
class KatalogPage extends StatelessWidget {
  const KatalogPage({super.key});

  String formatRupiah(int harga) {
    return 'Rp ${harga.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (m) => '${m[1]}.',
        )}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Makanan'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: daftarMakanan.length,
        itemBuilder: (context, index) {
          final makanan = daftarMakanan[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: Row(
              children: [
                // Gambar Makanan
                Image.asset(
                  makanan.gambar,
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stack) => Container(
                    width: 110,
                    height: 110,
                    color: Colors.orange.shade100,
                    child: const Icon(Icons.restaurant,
                        color: Colors.orange, size: 40),
                  ),
                ),

                // Info Makanan
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nama
                        Text(
                          makanan.nama,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),

                        // Kategori badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            makanan.kategori,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.orange.shade800,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),

                        // Deskripsi singkat
                        Text(
                          makanan.deskripsi,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),

                        // Harga
                        Text(
                          formatRupiah(makanan.harga),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

