import 'package:flutter_test/flutter_test.dart';
import 'package:pepesmendoan/main.dart';

void main() {
  testWidgets('App starts with 4 navigation tabs smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const PepesMendoanApp());

    // Memastikan judul dan 4 tab navigasi utama ada
    expect(find.text('Warung Kuliner Nusantara'), findsOneWidget);
    expect(find.text('Beranda'), findsWidgets);
    expect(find.text('Menu'), findsWidgets);
    expect(find.text('Keranjang'), findsWidgets);
    expect(find.text('Riwayat'), findsWidgets);
  });
}
