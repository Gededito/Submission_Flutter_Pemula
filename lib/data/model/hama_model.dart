class HamaModel {
  String name;
  String description;
  String image;
  String solusi;
  String gejala;

  HamaModel({
    required this.name,
    required this.description,
    required this.image,
    required this.solusi,
    required this.gejala,
  });
}

final List<HamaModel> hama = [
  HamaModel(
    name: 'Embun Tepung',
    image: 'assets/hama/powdery_mildew.png',
    description: 'Powdery Mildew atau embun tepung adalah penyakit jamur yang umum menyerang tanaman anggur. Penyakit ini ditandai dengan gejala yang terlihat pada daun, tunas dan ranting. Pada daun, awalnya muncul bercak putih yang menyerupai tepung',
    solusi: 'Pencegahannya dengan memilih varietas yang tahan akan penyakit, pengaturan jarak tanam dan pemangkasan yang tepat, sanitasi kebun, penggunaan sirkulasi udara dan aplikasi sulfur atau bahan organik',
    gejala: 'Powdery Mildew atau embun tepung disebabkan oleh Jamur Erysiphe Necator yang berkembang biak melalui spora yang tersebar oleh angin atau kontak langsung, kelembaban tinggi, sirkulasi udara buruk, varietas anggur rentan dan stress tanaman',
  ),
  HamaModel(
    name: 'Ulat',
    image: 'assets/hama/ulat.jpg',
    description: 'Ulat, khususnya ulat grayak dapat menjadi momok bagi para petani. Daun anggur yang semula utuh akan berubah menjadi berlubang - lubang akibat nafsu makan ulat yang rakus',
    solusi: 'Pencegahannya dengan melakukan kewaspadaan dan tindakan secara manual dan memusnahkannya. Selain itu penggunaan pestisida nabati, seperti ekstrak nimba atau bawang putih, dapat menjadi alternatif yang ramah lingkungan',
    gejala: 'Serangan ulat pada tanaman dapat dipicu oleh beberapa faktor seperti musim hujan yang memungkinkan ulat grayak lebih aktif dan berkembang biak. Serta kurangnya predator alami, seperti burung atau serangga yang membuat populasi ulat bertambah',
  ),
  HamaModel(
    name: 'Leafroll Virus',
    image: 'assets/hama/leafroll_virus.jpg',
    description: 'Leafroll Virus memberikan tanda - tanda yang khas pada tanaman anggur. Daun akan menggulung ke bawah, terutama di bagian tepinya, seperti berusaha melindungi diri dari ancaman yang tak terlihat',
    solusi: 'Pencegahannya dengan penggunaan materi tanam yang bebas virus seperti bibit atau batang bawah yang telah disertifikasi. Melakukan sanitasi kebun yang baik, termasuk membuang dan memusnahkan tanaman yang terinfeksi serta pemangkasan yang teratur',
    gejala: 'Disebabkan oleh kelompok virus dalam keluarga Closteroviridae. Virus ini tidak menyebar melalui angin atau air, melainkan bergantungan pada vektor serangga, terutama kutu putih untuk berpindah dari satu tanaman ke tanaman lainnya',
  ),
  HamaModel(
    name: 'Kutu Daun',
    image: 'assets/hama/kutu_daun.jpg',
    description: 'Kutu Daun merupakan hama kecil yang menghisap cairan tanaman dan mendatangkan malapetaka bagi tanaman anggur. Daun yang hijau berubah menjadi kuning keriting akibat cairannya disedot oleh serangga ini',
    solusi: 'Pencegahannya dengan memanfaatkan musuh alami kutu daun, seperti kumbang koksi, lacewing dan tawon parasitoid. Jika diperlukan, melakukan penyemprotan larutan sabun insektisida atau pemangkasan tanaman yang terinfeksi parah',
    gejala: 'Disebabkan oleh kondisi cuaca yang hangat dan kering sehingga memicu peningkatan populasi hama ini. Kurangnya predator alami juga memberikan kesempatan bagi kutu daun untuk berkembang biak tanpa hambatan',
  ),
  HamaModel(
    name: 'Antraknosa',
    image: 'assets/hama/anthraknosa.jpg',
    description: 'Penyakit jamur yang disebabkan oleh Elsinoe Ampelina, dapat meninggalkan bekas luka yang khas pada tanaman anggur. Daun yang terinfeksi akan dihiasi bercak - bercak berwarna coklat atau abu - abu dengan tepi merah kecoklatan yang khas',
    solusi: 'Pencegahannya dengan praktik sanitasi yang baik, seperti membuang dan memusnahkan bagian tanaman yang terinfeksi, pemilihan varietas, pengaturan jarak tanam, dan pemangkasan untuk meningkatkan sirkulasi udara dan mengurangi kelembaban',
    gejala: 'Disebabkan oleh Jamur Elsinoe Ampelina yang dapat bertahan hidup pada sisa - sisa tanaman yang terinfeksi. Percikan air hujan atau angin yang membawa spora jamur ke tanaman, kondisi lingkungan lembab dan hangat akan mempercepat perkembangan jamur',
  ),
  HamaModel(
    name: 'Thrips',
    image: 'assets/hama/thrips.jpeg',
    description: 'Thrips adalah hama kecil yang kerap menyerang tanaman anggur, dapat menyebabkan kerusakan yang merugikan. Daun yang terserang akan menunjukkan bercak keperakan atau perungguan, mengeriting atau bahkan berubah bentuk',
    solusi: 'Cara pencegahannya dengan menjaga kebersihan kebun dari gulma dan sisa tanaman, melakukan rotasi tanaman, pemasangan perangkat lengket, dan pemanfaatan predator alami seperti kumbang koksi atau penggunaan insektisida',
    gejala: 'Faktor yang menyebabkan thrips yaitu Spesies Thrips Tabaci, Frankliniella Occidentalis, dan Scirtothrips dorsalis. Selain itu kondisi lingkungan yang kering dan panas juga memicu peningkatan populasi thrips',
  ),
];