class VarietasModel {
  String name;
  String description;
  String karakteristik;
  String image;

  VarietasModel({
    required this.name,
    required this.description,
    required this.karakteristik,
    required this.image,
  });
}

final List<VarietasModel> varietas = [
  VarietasModel(
    name: 'Anggur Isabella',
    image: 'assets/varietas/isabella.jpg',
    description: 'Anggur Isabella adalah varietas anggur yang menarik dengan sejarah panjang, kualitas rasa dan aroma yang unik. Dengan rasa manisnya yang khas dan aroma strawberry yang menggoda menjadi ciri khas unik pada anggur isabella',
    karakteristik: 'Anggur Isabella memiliki warna kulit ungu tua dan rasa manis dengan sedikit aroma "foxy" yang khas dari spesies anggur labrusca. Anggur Isabella juga memiliki "slip skins" yang memudahkan pemisahan kulit dari daging buahnya',
  ),
  VarietasModel(
    name: 'Anggur Muscat',
    image: 'assets/varietas/muscat.jpg',
    description: 'Anggur Muscat adalah salah satu varietas anggur tertua dan paling berharga di dunia. Dengan aroma khasnya yang menggoda, rasa manis yang kaya dan kemampuannya untuk menghasilkan wine yang luar biasa',
    karakteristik: 'Anggur Muscat memiliki aroma floral yang kuat dan rasa manis yang khas. Daging buahnya cenderung padat dan berdaging, dengan biji kecil atau tanpa biji sama sekali',
  ),
  VarietasModel(
    name: 'Anggur Black Panther',
    image: 'assets/varietas/black_panther.jpg',
    description: 'Anggur Black Panther merupakan sebuah varietas anggur yang berasal dari Ukraina. Memiliki tingkat kemanisan yang tinggi mencapai 17-19 brix sehingga menjami kepuasaan bagi para pecinta buah manis',
    karakteristik: 'Anggur Black Panther memiliki rasa manis dengan tingkat kemanisan mencapai 17-19 brick, buahnya berbentuk oval dengan kulit tebal dan meskipun berbiji, tetapi dagingnya tetap renyah dan berair',
  ),
  VarietasModel(
    name: 'Anggur Dixon',
    image: 'assets/varietas/dixon.jpg',
    description: 'Anggur Dixon adalah anggur meja yang berasal dari Amerika Serikat dan telah mencuri perhatian dari para pecinta buah di seluruh dunia dengan kualitasnya yang luar biasa. Anggur ini dikembangkan melalui persilangan antara varietas anggur Vitis Vinifera dan Vitis Labrusca',
    karakteristik: 'Anggur Dixon memiliki buah yang berukuran besar, berbentuk oval, dengan warna kulit hijau kekuningan yang menarik. Daging buahnya renyah dan berair, memberikan pengalaman makan yang memuaskan serta ketananan terhadap penyakit',
  ),
  VarietasModel(
    name: 'Anggur Harold',
    image: 'assets/varietas/harlod.jpg',
    description: 'Anggur Harlod adalah varietas anggur meja impor unggulan yang dihasilkan dari persilangan tiga varietas anggur terkenal yaitu Delight, Arcadia, dan Muscat. Anggur ini adalah simbol kemewahan dan cita rasa tinggi serta cocok untuk dinikmati',
    karakteristik: 'Anggur Harlod memiliki buah berukuran besar, berkulit tipis namun kuat, dengan daging renyah dan berair. Warnanya ungu gelap hingga hitam saat matang. Anggur ini cepat berbuah bahkan bisa mulai memproduksi dalam waktu kurang dari setahun',
  ),
  VarietasModel(
    name: 'Anggur Victor',
    image: 'assets/varietas/victor.jpg',
    description: 'Anggur Victor adalah varietas anggur meja yang dikenal karena rasa manisnya yang intens dengan sedikit sentuhan asam, memberikan pengalaman rasa yang seimbang dan menyegarkan',
    karakteristik: 'Anggur Victor memiliki bentuk buah yang oval, besar, dan berwarna ungu tua hingga hitam saat matang, memberikan daya tarik visual yang menggugah selera. Memiliki produktivitas yang tinggi, ketahanannya terhadap penyakit dan mampu beradaptasi',
  ),
  VarietasModel(
    name: 'Anggur Transfigurasi',
    image: 'assets/varietas/transfigurasi.jpg',
    description: 'Anggur Transfigurasi adalah varietas anggur meja yang memukau dengan kemampuan berubah warna dari hijau menjadi merah muda atau ungu tua saat matang. Rasanya manis dengan sedikit asam, kulitnya tipis, dan daging buahnya renyah berair',
    karakteristik: 'Anggur Transfigurasi memiliki kemampuan warna selama proses pematangan, memiliki rasa manis yang khas diimbangi dengan sedikit sentuhan asam, kulitnya tipis, daging buahnya renyah dan berair, serta dikenal sebagai varietas memiliki daya tahan yang baik',
  ),
  VarietasModel(
    name: 'Anggur Jupiter',
    image: 'assets/varietas/jupiter.jpg',
    description: 'Anggur Jupiter adalah varietas anggur meja tanpa biji yang menarik dengan warna biru tua yang indah dan rasa manis yang khas. Dengan keunggulan seperti ketahanan terhadap penyakit dan produktivitas tinggi dan kemudahan konsumsi',
    karakteristik: 'Anggur Jupiter memiliki warna biru tua yang saat matang sempurna, bentuknya bulat hingga sedikit oval dengan ukuran yang cukup besar. Ketahanannya terhadap penyakit dan produktivitas tinggi menjadikannya pilihan ideal bagi petani',
  ),
  VarietasModel(
    name: 'Anggur Julian',
    image: 'assets/varietas/julian.jpg',
    description: 'Anggur Julian adalah varietas anggur meja yang menarik perhatian dengan buahnya yang berwarna merah muda dengan semburat hijau. Rasanya yang harmonis berpadu dengan tekstur daging buah yang renyah dan kulit yang tipis',
    karakteristik: 'Anggur Julian memiliki sejumlah karakteristik yang membuatnya unggul. Dengan kematangan awal hanya dalam 95 - 105 hari, Anda dapat menikmati panen lebih cepat, memiliki ketahanan terhadap penyakit dan memudahkan perawatan',
  ),
];