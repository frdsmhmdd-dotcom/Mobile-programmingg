import 'package:flutter_test/flutter_test.dart';
import 'package:pepesmendoan/main.dart';

void main() {
  testWidgets('App menampilkan halaman Beranda dan tombol Katalog', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Warung Kuliner'), findsWidgets);
    expect(find.text('Lihat Katalog Makanan'), findsOneWidget);
  });
}
