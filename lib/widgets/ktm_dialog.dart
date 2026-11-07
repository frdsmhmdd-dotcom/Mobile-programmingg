import 'package:flutter/material.dart';

class KtmProfileDialog extends StatelessWidget {
  const KtmProfileDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Container(
        width: 340,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 16,
              offset: Offset(0, 8),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header Universitas
            Container(
              width: double.infinity,
              color: const Color(0xFF1E40AF), // Blue 800
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: const Column(
                children: [
                  Icon(
                    Icons.school,
                    size: 40,
                    color: Colors.white,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'UNIVERSITAS PGRI SEMARANG',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'KARTU TANDA MAHASISWA',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Foto / Avatar Profil
            const CircleAvatar(
              radius: 46,
              backgroundColor: Color(0xFFE2E8F0),
              child: Icon(
                Icons.person,
                size: 56,
                color: Color(0xFF64748B),
              ),
            ),

            const SizedBox(height: 16),

            // Nama Mahasiswa
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Firdaus Muhammad Dedi Riyadihd',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
            ),

            const SizedBox(height: 16),
            const Divider(indent: 24, endIndent: 24),
            const SizedBox(height: 10),

            // Info NPM & Prodi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  _buildInfoRow('NPM', '25670061'),
                  const SizedBox(height: 12),
                  _buildInfoRow('Program Studi', 'Informatika'),
                  const SizedBox(height: 12),
                  _buildInfoRow('Mata Kuliah', 'Praktikum Mobile Prog.'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Tombol Tutup
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, size: 18),
                label: const Text('Tutup'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue.shade800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF64748B),
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

