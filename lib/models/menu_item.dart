class MenuItem {
  final String id;
  final String name;
  final String category;
  final int price;
  final String imagePath;
  final String description;
  final List<String> ingredients;

  MenuItem({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imagePath,
    required this.description,
    required this.ingredients,
  });

  // Data 10 Menu sesuai file gambar di folder assets/images/
  static List<MenuItem> menuList = [
    MenuItem(
      id: '1',
      name: 'Ayam Pop',
      category: 'Olahan Ayam',
      price: 22000,
      imagePath: 'assets/images/Ayam Pop.jpg',
      description:
          'Ayam pop khas Minang dengan tekstur daging lembut dan gurih yang dimasak dengan air kelapa dan bumbu putih khas, disajikan dengan sambal tomat pedas manis.',
      ingredients: ['Ayam Kampung', 'Air Kelapa', 'Bawang Putih', 'Serai', 'Sambal Tomat'],
    ),
    MenuItem(
      id: '2',
      name: 'Ayam Goreng',
      category: 'Olahan Ayam',
      price: 20000,
      imagePath: 'assets/images/Ayam-Goreng.jpg',
      description:
          'Ayam goreng bumbu rempah tradisional yang digoreng hingga garing keemasan dengan taburan serundeng lengkuas yang renyah dan gurih.',
      ingredients: ['Daging Ayam', 'Lengkuas', 'Kunyit', 'Ketumbar', 'Bawang Merah & Putih'],
    ),
    MenuItem(
      id: '3',
      name: 'Ayam Panggang',
      category: 'Olahan Ayam',
      price: 25000,
      imagePath: 'assets/images/Ayam-Panggang.jpg',
      description:
          'Ayam panggang dengan olesan bumbu rempah manis gurih khas Nusantara, dibakar sempurna dengan aroma bakaran yang wangi.',
      ingredients: ['Daging Ayam', 'Kecap Manis', 'Bawang Merah', 'Cabai Merah', 'Minyak Wijen'],
    ),
    MenuItem(
      id: '4',
      name: 'Balado Ikan',
      category: 'Seafood & Ikan',
      price: 18000,
      imagePath: 'assets/images/Balado-Ikan.jpg',
      description:
          'Ikan goreng segar yang disiram dengan sambal balado merah pedas manis gurih, cocok dinikmati dengan nasi putih hangat.',
      ingredients: ['Ikan Segar', 'Cabai Merah Keriting', 'Tomat', 'Bawang Merah', 'Garam & Gula'],
    ),
    MenuItem(
      id: '5',
      name: 'Ikan Kembung Bakar',
      category: 'Seafood & Ikan',
      price: 18000,
      imagePath: 'assets/images/Ikan-Kembung.jpg',
      description:
          'Ikan kembung bakar bumbu kecap pedas, kaya akan omega-3 dan memiliki tekstur daging lembut dengan bumbu yang meresap hingga ke tulang.',
      ingredients: ['Ikan Kembung Segar', 'Kecap Manis', 'Jeruk Nipis', 'Bawang Putih', 'Cabai Rawit'],
    ),
    MenuItem(
      id: '6',
      name: 'Tumis Kerang',
      category: 'Seafood & Ikan',
      price: 20000,
      imagePath: 'assets/images/Kerang.jpg',
      description:
          'Kerang dara kupas segar yang ditumis dengan saus tiram, irisan cabai hijau, jahe, dan daun salam untuk menghilangkan bau amis.',
      ingredients: ['Kerang Dara Kupas', 'Saus Tiram', 'Cabai Hijau', 'Jahe', 'Bawang Bombay'],
    ),
    MenuItem(
      id: '7',
      name: 'Opor Ayam',
      category: 'Olahan Ayam',
      price: 23000,
      imagePath: 'assets/images/Opor-Ayam.jpg',
      description:
          'Masakan opor ayam kuah santan gurih berpadu rempah kunyit, serai, daun salam, dan taburan bawang goreng renyah di atasnya.',
      ingredients: ['Daging Ayam', 'Santan Kelapa', 'Kunyit & Kemiri', 'Serai & Salam', 'Bawang Goreng'],
    ),
    MenuItem(
      id: '8',
      name: 'Sup Ayam',
      category: 'Olahan Ayam',
      price: 16000,
      imagePath: 'assets/images/Sup-Ayam.jpg',
      description:
          'Sup ayam hangat kuah kaldu bening dengan potongan wortel, kentang, buncis, seledri, dan suwiran ayam gurih yang menyehatkan.',
      ingredients: ['Kaldu Ayam Murni', 'Daging Ayam Suwir', 'Wortel & Kentang', 'Buncis', 'Daun Seledri'],
    ),
    MenuItem(
      id: '9',
      name: 'Tumis Buncis',
      category: 'Sayuran',
      price: 12000,
      imagePath: 'assets/images/Tumis-Buncis.jpg',
      description:
          'Sayur buncis muda dan wortel segar ditumis renyah dengan bawang putih dan potongan cabai, sehat dan kaya serat.',
      ingredients: ['Buncis Muda', 'Wortel', 'Bawang Putih', 'Cabai Merah', 'Saus Tiram'],
    ),
    MenuItem(
      id: '10',
      name: 'Udang Tofu',
      category: 'Seafood & Ikan',
      price: 25000,
      imagePath: 'assets/images/Udang-Tofu.jpg',
      description:
          'Perpaduan udang segar kenyal dan tofu (tahu telur Jepang) goreng lembut yang dimasak dengan saus tiram gurih beraroma bawang putih.',
      ingredients: ['Udang Kupas Segar', 'Tofu Telur Sutra', 'Saus Tiram', 'Bawang Putih', 'Daun Bawang'],
    ),
  ];
}
