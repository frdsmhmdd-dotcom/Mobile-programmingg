import 'package:flutter_test/flutter_test.dart';
import 'package:pepesmendoan/main.dart';

void main() {
  testWidgets('App Klik Laundry menampilkan Beranda dan tombol WhatsApp', (WidgetTester tester) async {
    await tester.pumpWidget(const KlikLaundryApp());
    expect(find.text('Klik Laundry'), findsWidgets);
    expect(find.text('Lihat Katalog Menu Cuci'), findsOneWidget);
    expect(find.text('085142669349'), findsOneWidget);
  });
}
