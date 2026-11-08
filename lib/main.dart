import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const KlikLaundryApp());
}

class KlikLaundryApp extends StatelessWidget {
  const KlikLaundryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klik Laundry',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0F19),
        colorScheme: const ColorScheme.dark(
          primary: Colors.blue,
          secondary: Colors.lightBlueAccent,
          surface: Color(0xFF111827),
        ),
        useMaterial3: true,
      ),
      home: const BerandaPage(),
    );
  }
}

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  void _bukaWhatsApp() {
    final Uri url = Uri.parse('https://wa.me/6285142669349');
    launchUrl(url, mode: LaunchMode.platformDefault);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Klik Laundry',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 2,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/laundry.png',
                      width: double.infinity,
                      height: 260,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: 220,
                          color: const Color(0xFF1E293B),
                          child: const Icon(
                            Icons.local_laundry_service,
                            size: 80,
                            color: Colors.blue,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Selamat Datang di Klik Laundry',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Klik Laundry adalah solusi jasa pencucian pakaian profesional yang bersih, rapi, dan wangi tahan lama. Kami menggunakan mesin cuci modern dan deterjen pilihan yang aman bagi serat pakaian Anda, sehingga pakaian tetap terawat seperti baru.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.6,
                      color: Color(0xFF94A3B8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF111827),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue.withValues(alpha: 0.3)),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Icon(Icons.check_circle, color: Colors.blue),
                            SizedBox(height: 6),
                            Text(
                              'Bersih & Rapi',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.flash_on, color: Colors.blue),
                            SizedBox(height: 6),
                            Text(
                              'Cepat Tepat',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.verified, color: Colors.blue),
                            SizedBox(height: 6),
                            Text(
                              'Harga Hemat',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const KatalogPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.menu_book),
                    label: const Text(
                      'Lihat Katalog Menu Cuci',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Divider(color: Color(0xFF1E293B)),
                  const SizedBox(height: 16),
                  const Text(
                    'Jika berminat hubungi nomor:',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    '085142669349',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: _bukaWhatsApp,
                    icon: const Icon(Icons.chat),
                    label: const Text(
                      'Hubungi via WhatsApp',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF25D366),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LayananCuci {
  final String nama;
  final String deskripsi;
  final String harga;
  final String durasi;
  final IconData ikon;

  const LayananCuci({
    required this.nama,
    required this.deskripsi,
    required this.harga,
    required this.durasi,
    required this.ikon,
  });
}

final List<LayananCuci> daftarLayanan = [
  const LayananCuci(
    nama: 'Cuci Komplit Kiloan',
    deskripsi: 'Cuci bersih, pengeringan mesin, setrika uap rapi, dan parfum wangi.',
    harga: 'Rp 7.000 / kg',
    durasi: '2 Hari',
    ikon: Icons.local_laundry_service,
  ),
  const LayananCuci(
    nama: 'Cuci Kering Lipat',
    deskripsi: 'Pakaian dicuci bersih dan dikeringkan lalu dilipat rapi.',
    harga: 'Rp 5.000 / kg',
    durasi: '1 - 2 Hari',
    ikon: Icons.dry_cleaning,
  ),
  const LayananCuci(
    nama: 'Setrika Saja',
    deskripsi: 'Setrika rapi dengan setrika uap profesional dan parfum harum.',
    harga: 'Rp 4.000 / kg',
    durasi: '1 Hari',
    ikon: Icons.iron,
  ),
  const LayananCuci(
    nama: 'Cuci Kilat (Express)',
    deskripsi: 'Layanan selesai cepat untuk keperluan mendesak dalam hitungan jam.',
    harga: 'Rp 12.000 / kg',
    durasi: '5 - 6 Jam',
    ikon: Icons.bolt,
  ),
  const LayananCuci(
    nama: 'Cuci Bed Cover Besar',
    deskripsi: 'Pencucian selimut tebal dan bed cover ukuran besar agar bersih merata.',
    harga: 'Rp 25.000 / pcs',
    durasi: '2 - 3 Hari',
    ikon: Icons.bed,
  ),
  const LayananCuci(
    nama: 'Cuci Bed Cover Kecil',
    deskripsi: 'Pencucian selimut sedang atau sprei dengan pewangi lembut.',
    harga: 'Rp 18.000 / pcs',
    durasi: '2 Hari',
    ikon: Icons.single_bed,
  ),
  const LayananCuci(
    nama: 'Cuci Sepatu',
    deskripsi: 'Pembersihan mendalam sepatu sneakers atau kasual dari noda.',
    harga: 'Rp 25.000 / pasang',
    durasi: '2 Hari',
    ikon: Icons.roller_skating,
  ),
  const LayananCuci(
    nama: 'Cuci Jaket & Jas',
    deskripsi: 'Perawatan ekstra jaket tebal, mantel, jaket kulit, dan jas formal.',
    harga: 'Rp 15.000 / pcs',
    durasi: '2 Hari',
    ikon: Icons.checkroom,
  ),
  const LayananCuci(
    nama: 'Cuci Karpet',
    deskripsi: 'Pembersihan karpet rumah dari debu dan kotoran dengan sabun khusus.',
    harga: 'Rp 15.000 / m²',
    durasi: '3 Hari',
    ikon: Icons.layers,
  ),
  const LayananCuci(
    nama: 'Cuci Boneka',
    deskripsi: 'Pencucian boneka agar kembali bersih, harum, dan bebas kuman.',
    harga: 'Rp 10.000 / pcs',
    durasi: '2 Hari',
    ikon: Icons.smart_toy,
  ),
];

class KatalogPage extends StatelessWidget {
  const KatalogPage({super.key});

  void _bukaWhatsApp() {
    final Uri url = Uri.parse('https://wa.me/6285142669349');
    launchUrl(url, mode: LaunchMode.platformDefault);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Katalog Menu Cuci',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                color: const Color(0xFF111827),
                child: const Text(
                  'Daftar Tarif Layanan Cuci Klik Laundry',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: daftarLayanan.length,
                  itemBuilder: (context, index) {
                    final item = daftarLayanan[index];
                    return Card(
                      color: const Color(0xFF111827),
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.blue.withValues(alpha: 0.2)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.blue.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                item.ikon,
                                color: Colors.blue,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item.nama,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withValues(alpha: 0.2),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: Text(
                                          item.durasi,
                                          style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.lightBlueAccent,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    item.deskripsi,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF94A3B8),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    item.harga,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.black,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _bukaWhatsApp,
                    icon: const Icon(Icons.chat),
                    label: const Text(
                      'Pesan via WhatsApp: 085142669349',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF25D366),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
