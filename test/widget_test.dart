import 'package:flutter_test/flutter_test.dart';
import 'package:pepesmendoan/main.dart';

void main() {
  testWidgets('App menampilkan halaman Beranda dan tombol Katalog', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Warung Makan Pepes Mendoan'), findsWidgets);
    expect(find.text('Lihat Katalog Makanan'), findsOneWidget);
    expect(find.text('Hubungi via WhatsApp'), findsOneWidget);
  });
}
