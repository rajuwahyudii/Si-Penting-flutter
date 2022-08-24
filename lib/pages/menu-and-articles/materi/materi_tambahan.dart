// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stunting/common/services.dart';
import 'package:stunting/pages/menu.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/end_of_materi.dart';
import 'package:stunting/widgets/list_article_widget.dart';
import 'package:stunting/widgets/sub_judul_artikel_widget.dart';
import 'package:stunting/widgets/text_article_widget.dart';
import 'package:stunting/widgets/tittle_article_widget.dart';

class MateriTambahan extends StatefulWidget {
  const MateriTambahan({Key? key}) : super(key: key);

  @override
  State<MateriTambahan> createState() => _MateriTambahanState();
}

class _MateriTambahanState extends State<MateriTambahan> {
  PageController pageController = PageController();
  static FirebaseAuth auth = FirebaseAuth.instance;
  static User user = auth.currentUser!;
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('user');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<DocumentSnapshot>(
      future: collectionRef.doc(user.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          var materi = int.parse('${data['class']}');
          return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Menu(),
                    ),
                  );
                },
              ),
              backgroundColor: backgroundColor,
              title: Text(
                'Materi Tambahan',
                style: GoogleFonts.poppins(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
            ),
            body: SizedBox(
              width: size.width,
              height: size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const TitleArticelWidget(
                      title: 'Pengertian Stunting',
                    ),
                    Image.asset(
                      'assets/images/materi1.png',
                      width: 150,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const TextArticleWidget(
                      text:
                          'Stunting adalah kondisi gagal tumbuh pada anak balita akibat kekurangan gizi kronis, terutama pada masa 1000 hari pertama kehidupan (HPK) yaitu periode emas pertumbuhan dan perkembangan yang dimulai semenjak terbentuknya janin hingga anak berusia 2 tahun, bukan hanya terganggu pertumbuhan fisiknya (bertubuh kecil/kerdil) sajah, melainkan juga terganggu perkembangan otak yang nantinya mempengaruhi kemampuan dan prestasi di sekolah, produktivitas dan kreativitas di usia produktif.',
                    ),
                    const TitleArticelWidget(
                      title: 'GEJALA STUNTING/CIRI CIRI STUNTING',
                    ),
                    Image.asset(
                      'assets/images/materi2.png',
                      width: 200,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const ListArticleWidget(
                      text: 'Pertumbuhan melambat',
                    ),
                    const ListArticleWidget(
                      text:
                          'Usia 8-10 tahun anak menjadi lebih pendiam, tidak banyak melakukan eye contact',
                    ),
                    const ListArticleWidget(
                      text: 'Wajah tampak lebih mudah dari usianya',
                    ),
                    const ListArticleWidget(
                      text: 'Pubertas terlambat',
                    ),
                    const ListArticleWidget(
                      text: 'Pertumbuhan gigi terlambat',
                    ),
                    const TitleArticelWidget(
                      title: 'PENYEBAB STUNTING',
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const TextArticleWidget(
                      text:
                          'Diketahui penyebab stunting sangat kompleks. Namun, penyebab atau faktor risiko utama dapat dikategorikan menjadi:',
                    ),
                    const SubtitleArtikelWidget(
                      title: 'Faktor Genetik',
                    ),
                    const TextArticleWidget(
                      text:
                          'Tinggi badan orangtua sendiri sebenarnya juga dipengaruhi banyak faktor yaitu faktor internal seperti faktor genetik dan faktor eksternal seperti faktor penyakit dan asupan gizi sejak usia dini. Faktor genetik adalah faktor yang tidak dapat diubah sedangkan faktor eksternal adalah faktor yang dapat diubah. Hal ini berarti jika ayah pendek karena gen-gen yang ada pada kromosomnya memang membawa sifat pendek dan gen-gen ini diwariskan pada keturunannya, maka stunting yang timbul pada anak atau keturunannya sulit untuk ditanggulangi. Tetapi bila ayah pendek karena faktor penyakit atau asupan gizi yang kurang sejak dini, seharusnya tidak akan mempengaruhi tinggi badan anaknya. ',
                    ),
                    const TextArticleWidget(
                      text:
                          'Anak tetap dapat memiliki tinggi badan normal asalkan tidak terpapar oleh faktor-faktor risiko yang lain.',
                    ),
                    const SubtitleArtikelWidget(
                      title: 'Status Ekonomi',
                    ),
                    const TextArticleWidget(
                      text:
                          'Status ekonomi kurang dapat diartikan daya beli juga rendah sehingga kemampuan membeli bahan makanan yang baik juga rendah. Kualitas dan kuantitas makanan yang kurang menyebabkan kebutuhan zat gizi anak tidak terpenuhi, padahal anak memerlukan zat gizi yang lengkap untuk pertumbuhan dan perkembangannya. Pada kelompok status ekonomi kurang maupun status ekonomi cukup masih banyak dijumpai ibu yang memiliki pengetahuan rendah di bidang gizi. ',
                    ),
                    const TextArticleWidget(
                        text:
                            'Walaupun mereka rutin ke posyandu, namun di posyandu mereka jarang memperoleh informasi tentang gizi. Informasi tentang gizi justeru diperoleh dari tenaga kesehatan yang mereka datangi pada saat anak sakit, itupun hanya sedikit. Informasi dari media massa maupun media cetak juga tidak banyak diperoleh karena ibu tifk gemar membaca artikel tentang kesehatan. '),
                    const TextArticleWidget(
                      text:
                          'Status ekonomi kurang seharusnya tidak menjadi kendala dalam pemenuhan kebutuhan gizi keluarga karena harga bahan pangan di negara kita sebenarnya tidak mahal dan sangat terjangkau. ',
                    ),
                    const TextArticleWidget(
                      text:
                          'Jenis bahan makanan juga sangat bervariasi dan dapat diperoleh di mana saja. Namun karena pengetahuan akan gizi yang kurang menyebabkan banyak orangtua yang beranggapan bahwa zat gizi yang baik hanya terdapat dalam makanan yang mahal. Membuat masakan yang bergizi dan enak rasanya memang membutuhkan kreativitas dan kesabaran. Keterbatasan waktu terkadang membuat orangtua lebih senang membelikan makanan jajanan daripada memasak sendiri. Pada makanan jajanan sering ditambahkan zat-zat aditif yang bisa membahayakan kesehatan. Selain itu makanan jajanan kebersihan dan keamanannya sangat tidak terjamin.',
                    ),
                    const SubtitleArtikelWidget(
                      title: 'Jarak Kelahiran',
                    ),
                    const TextArticleWidget(
                      text:
                          'Jarak kelahiran mempengaruhi pola asuh orangtua terhadap anaknya. Jarak kelahiran dekat membuat orangtua cenderung lebih kerepotan sehinga kurang optimal dalam merawat anak Jarak kelahiran kurang dari dua tahun juga menyebabkan salah satu anak, biasanya yang lebih tua tidak mendapatkan ASI yang cukup karena ASI lebih diutamakan untuk adiknya. Akibat tidak memperoleh ASI dan kurangya asupan makanan, anak akan menderita malnutrisi yang bisa menyebabkan stunting.',
                    ),
                    const TextArticleWidget(
                        text:
                            'Untuk mengatasi hal ini program Keluarga Berencana harus kembali digalakkan. Setelah melahirkan, ibu atau ayah harus dihimbau supaya secepat mungkin menggunakan alat kontrasepsi untuk mencegah kehamilan. Banyak orangtua yang enggan menggunakan kontrasepsi segera setelah kelahiran anaknya, sehingga terjadi kehamilan yang sering tidak disadari sampai kehamilan tersebut sudah menginjak usia beberapa bulan. '),
                    const TextArticleWidget(
                      text:
                          'Jarak kehamilan yang terlalu dekat, selain kurang baik untuk anak yang baru dilahirkan juga kurang baik untuk ibu. Kesehatan ibu dapat terganggu karena kondisi fisik yang belum sempurna setelah melahirkan sekaligus harus merawat bayi yang membutuhkan waktu dan perhatian sangat besar. Ibu hamil yang tidak sehat akan menyebabkan gangguan pada janin yang dikandungnya. Gangguan pada janin dalam kandungan juga akan mengganggu pertumbuhan sehingga timbullah stunting.',
                    ),
                    const SubtitleArtikelWidget(
                      title: 'Riwayat BBLR',
                    ),
                    const TextArticleWidget(
                      text:
                          'Berat badan lahir rendah menandakan janin mengalami malnutrisi di dalam kandungan sedangkan underweight menandakan kondisi malnutrisi yang akut. Stunting sendiri terutama disebabkan oleh malnutrisi yang lama. Bayi yang lahir dengan berat badan kurang dari normal (<2500 gr) mungkin masih memiliki panjang badan normal pada waktu dilahirkan. Stunting baru akan terjadi beberapa bulan kemudian, walaupun hal ini sering tidak disadari oleh orangtua. ',
                    ),
                    const TextArticleWidget(
                      text:
                          'Orang tua baru mengetahui bahwa anaknya stunting umumnya setelah anak mulai bergaul dengan temantemannya sehingga terlihat anak lebih pendek dibanding teman-temannya. Oleh karena itu anak yang lahir dengan berat badan kurang atau anak yang sejak lahir berat badannya di bawah normal harus diwaspadai akan menjadi stunting. Semakin awal dilakukan penanggulangan malnutrisi maka semakin kecil risiko menjadi stunting.',
                    ),
                    const SubtitleArtikelWidget(
                      title: 'Anemia pada Ibu',
                    ),
                    const TextArticleWidget(
                      text:
                          'Anemia pada ibu hamil sebagian besar disebabkan oleh defisiensi zat gizi mikro terutama zat besi. Akibat defisiensi zat besi pada ibu hamil akan mempengaruhi pertumbuhan dan perkembangan janin sehingga janin yang dilahirkan sudah malnutrisi. Malnutrisi pada bayi jika tidak segera diatasi akan menetap sehingga menimbulkan malnutrisi kronis yang merupakan penyebab stunting. Ibu hamil dengan anemia memiliki resiko yang lebih besar untuk melahirkan bayi dengan berat di bawah normal dikarenakan anemia dapat mengurangi suplai oksigen pada metabolisme ibu sehingga dapat terjadi proses kelahiran imatur (bayi prematur). ',
                    ),
                    const TextArticleWidget(
                      text:
                          'Pengaruh metabolisme yang tidak optimal juga terjadi pada bayi karena kekurangan kadar hemoglobin untuk mengikat oksigen, sehingga kecukupan asupan gizi selama di dalam kandungan kurang dan bayi lahir dengan berat di bawah normal. Beberapa hal di atas juga dapat mengakibatkan efek fatal, yaitu kematian pada ibu saat proses persalinan atau kematian neonatal.',
                    ),
                    const SubtitleArtikelWidget(
                      title: 'Hygiene Dan Sanitasi Lingkungan',
                    ),
                    const TextArticleWidget(
                      text:
                          'Studi yang disertakan menunjukkan bahwa mikotoksin bawaan makanan, kurangnya sanitasi yang memadai, lantai tanah di rumah, bahan bakar memasak berkualitas rendah, dan pembuangan limbah lokal yang tidak memadai terkait dengan peningkatan risiko pengerdilan anak. Akses ke sumber air yang aman telah dipelajari dalam sejumlah besar studi, tetapi hasilnya tetap inklusif karena temuan studi yang tidak konsisten. Studi terbatas tersedia untuk arsenik, merkuri, dan tembakau lingkungan, dan dengan demikian peran mereka dalam pengerdilan tetap tidak meyakinkan. ',
                    ),
                    const TextArticleWidget(
                      text:
                          'Penelitian yang diidentifikasi tidak mengontrol asupan gizi. Sebuah model kausal mengidentifikasi penggunaan bahan bakar padat dan mikotoksin bawaan makanan sebagai faktor risiko lingkungan yang berpotensi memiliki efek langsung pada pertumbuhan anak.',
                    ),
                    const SubtitleArtikelWidget(
                      title: 'Defisiensi Zat Gizi',
                    ),
                    const TextArticleWidget(
                      text:
                          'Zat gizi sangat penting bagi pertumbuhan. Pertumbuhan adalah peningkatan ukuran dan massa konstituen tubuh. Pertumbuhan adalah salah satu hasil dari metabolisme tubuh.Metabolisme didefinisikan sebagai proses dimana organisme hidup mengambil dan mengubah zat padat dan cair asing yang diperlukan untuk pemeliharaan kehidupan, pertumbuhan, fungsi normal organ, dan produksi energi. ',
                    ),
                    const TextArticleWidget(
                      text:
                          'Asupan zat gizi yang menjadi faktor risiko terjadinya stunting dapat dikategorikan menjadi 2 yaitu asupan zat gizi makro atau mkronutrien dan asupan zat gizi mikro atau mikronutrien.15 Berdasarkan hasil-hasil penelitian, asupan zat gizi makro yang paling mempengaruhi terjadinya stunting adalah asupan protein, sedangkan asupan zat gizi mikro yang paling mempengaruhi kejadian stunting adalah asupan kalsium, seng, dan zat besi.',
                    ),
                    const TitleArticelWidget(
                      title: 'Dampak Stunting',
                    ),
                    Image.asset(
                      'assets/images/materi5.jpg',
                      width: 300,
                    ),
                    const SubtitleArtikelWidget(
                      title: 'Dampak dalam waktu jangka pendek',
                    ),
                    const ListArticleWidget(
                      text: 'Terganggunya perkembangan otak',
                    ),
                    const ListArticleWidget(
                      text: 'Kecerdasan berkurang',
                    ),
                    const ListArticleWidget(
                      text: 'Gangguan metabolisme dalam tubuh',
                    ),
                    const SubtitleArtikelWidget(
                      title: 'Dampak jangka panjang',
                    ),
                    const ListArticleWidget(
                      text: 'Menurunya kemampuan kognitif dan prestasi belajar',
                    ),
                    const ListArticleWidget(
                      text:
                          'Menurunnya kekebalan tubuh sehinggah mudah terserang penyakit',
                    ),
                    const ListArticleWidget(
                      text:
                          'Resiko tinggi munculnya penyakit diabetes, obesitas, penyakit antung dan pembuluh darah, kanker, stroke dan disabilitas pada usia tua',
                    ),
                    const TitleArticelWidget(
                      title: 'Pencegahan Stunting',
                    ),
                    const ListArticleWidget(
                      text: 'Perbaikan terhadap pola makan (gizi)',
                    ),
                    const ListArticleWidget(
                      text: 'Perbaikan pola asuh',
                    ),
                    const ListArticleWidget(
                      text: 'Perbaikan sanitasi dan akses air bersih',
                    ),
                    const TextArticleWidget(
                      text:
                          'Penangan stunting dilakukan melalui Intervensi Spesifik dan Intervensi Sensitif pada sasaran 1.000 hari pertama kehidupan seorang anak sampai berusia 6 tahun.',
                    ),
                    const SubtitleArtikelWidget(
                      title: 'Intervensi Gizi Spesifik',
                    ),
                    const TextArticleWidget(
                      text:
                          'Ini merupakan intervensi yang ditujukan kepada anak dalam 1.000 Hari Pertama Kehidupan (HPK) dan berkontribusi pada 30% penurunan stunting. Kerangka kegiatan intervensi gizi spesifik umumnya dilakukan pada sektor kesehatan.',
                    ),
                    const SubtitleArtikelWidget(
                      title: 'Intervensi dengan sasaran Ibu Hamil:',
                    ),
                    const ListArticleWidget(
                      text:
                          'Memberikan makanan tambahan pada ibu hamil untuk mengatasi kekurangan energi dan protein kronis.',
                    ),
                    const ListArticleWidget(
                      text: 'Mengatasi kekurangan zat besi dan asam folat.',
                    ),
                    const ListArticleWidget(
                      text: 'Mengatasi kekurangan iodium.',
                    ),
                    const ListArticleWidget(
                      text: 'Menanggulangi kecacingan pada ibu hamil.',
                    ),
                    const ListArticleWidget(
                      text: 'Melindungi ibu hamil dari Malaria.',
                    ),
                    const SubtitleArtikelWidget(
                      title:
                          'Intervensi dengan sasaran Ibu Menyusui dan Anak Usia 0-6 Bulan:',
                    ),
                    const ListArticleWidget(
                      text:
                          'Mendorong inisiasi menyusui dini (pemberian ASI jolong/colostrum).',
                    ),
                    const ListArticleWidget(
                      text: 'Mendorong pemberian ASI Eksklusif.',
                    ),
                    const SubtitleArtikelWidget(
                      title:
                          'Intervensi dengan sasaran Ibu Menyusui dan Anak Usia 7-23 bulan:',
                    ),
                    const ListArticleWidget(
                      text:
                          'Mendorong penerusan pemberian ASI hingga usia 23 bulan didampingi oleh pemberian MP-ASI.',
                    ),
                    const ListArticleWidget(
                      text: 'Menyediakan obat cacing.',
                    ),
                    const ListArticleWidget(
                      text: 'Menyediakan suplementasi zink.',
                    ),
                    const ListArticleWidget(
                      text: 'Melakukan fortifikasi zat besi ke dalam makanan.',
                    ),
                    const ListArticleWidget(
                      text: 'Memberikan perlindungan terhadap malaria.',
                    ),
                    const ListArticleWidget(
                      text: 'Memberikan imunisasi lengkap.',
                    ),
                    const SubtitleArtikelWidget(
                      title: 'Intervensi Gizi Sensitif',
                    ),
                    const TextArticleWidget(
                      text:
                          'Idealnya dilakukan melalui berbagai kegiatan pembangunan diluar sektor kesehatan dan berkontribusi pada 70% Intervensi Stunting. Sasaran dari intervensi gizi spesifik adalah masyarakat secara umum dan tidak khusus ibu hamil dan balita pada 1.000 Hari PertamaKehidupan (HPK).',
                    ),
                    const ListArticleWidget(
                      text: 'Menyediakan dan Memastikan Akses pada Air Bersih.',
                    ),
                    const ListArticleWidget(
                      text: 'Menyediakan dan Memastikan Akses pada Sanitasi.',
                    ),
                    const ListArticleWidget(
                      text: 'Melakukan Fortifikasi Bahan Pangan.',
                    ),
                    const ListArticleWidget(
                      text:
                          'Menyediakan Akses kepada Layanan Kesehatan dan Keluarga Berencana (KB).',
                    ),
                    const ListArticleWidget(
                      text: 'Menyediakan Jaminan Kesehatan Nasional (JKN).',
                    ),
                    const ListArticleWidget(
                      text:
                          'Menyediakan Jaminan Persalinan Universal (Jampersal).',
                    ),
                    const ListArticleWidget(
                      text: 'Memberikan Pendidikan Pengasuhan pada Orang tua.',
                    ),
                    const ListArticleWidget(
                      text: 'Memberikan Pendidikan Anak Usia Dini Universal.',
                    ),
                    const ListArticleWidget(
                      text: 'Memberikan Pendidikan Gizi Masyarakat.',
                    ),
                    const ListArticleWidget(
                      text:
                          'Memberikan Edukasi Kesehatan Seksual dan Reproduksi, serta Gizi pada Remaja.',
                    ),
                    const ListArticleWidget(
                      text:
                          'Menyediakan Bantuan dan Jaminan Sosial bagi Keluarga Miskin.',
                    ),
                    const ListArticleWidget(
                      text: 'Meningkatkan Ketahanan Pangan dan Gizi.',
                    ),
                    const TitleArticelWidget(
                      title: 'GIZI SEIMBANG UNTUK REMAJA',
                    ),
                    const SubtitleArtikelWidget(
                      title: 'Gizi Seimbang',
                    ),
                    Image.asset(
                      'assets/images/materi6.jpg',
                      width: 200,
                    ),
                    const TextArticleWidget(
                      text:
                          'Remaja adalah suatu tahap peralihan dari anak-anak menjadi dewasa. Masa ini biasanya diawali pada usia 14 tahun pada laki-laki dan 10 tahun pada perempuan. Kondisi penting yang berpengaruh terhadap kebutuhan zat gizi kelompok ini pertumbuhan cepat memasuki usia pubertas, kebiasaan jajan, menstruasi dan perhatian terhadap penampilan fisik citra tubuh (body image) dan dampaknya pada masalah gizi saat dewasa. Saat ini populasi remaja di dunia telah mencapai 1200 juta jiwa atau sekitar 19% dari total populasi dunia. ',
                    ),
                    const TextArticleWidget(
                      text:
                          'Masa remaja merupakan periode dari pertumbuhan dan proses kematangan manusia, pada masa ini terjadi perubahan yang berkelanjutan. Oleh karena itu sering disebut periode remaja merupakan periode kritis dimana terjadi perubahan fisik, biokimia, dan emosional yang cepat. Pada masa ini terjadi growth spurt yaitu puncak pertumbuhan tinggi badan (peak weight velocity). Kecepatan pertumbuhan tinggi badan rata-rata mencapai 20 cm/tahun pada laki-laki dan 16 cm/tahun pada perempuan. ',
                    ),
                    const TextArticleWidget(
                      text:
                          'Demikian pula kecepatan berat badan rata-rata mencapai 20 kg/tahun pada laki-laki dan 16 kg/tahun pada perempuan. Kecepatan pertumbuhan dan tinggi badan meliputi pada masa remaja ini lebih besar dibandingkan pertumbuhan tinggi badan dan berat badan pada anak-anak (usia 2 sampai 10) yang rata-rata hanya 5-6 cm/tahun dan 2-3 Kg/tahun. Selain itu pada masa ini juga terdapat puncak pertumbuhan masa tulang (peak bone mass/PBM) yang menyebabkan kebutuhan gizi pada masa ini sangat tinggi bahkan lebih tinggi fase kehidupan lainnya. ',
                    ),
                    const TextArticleWidget(
                      text:
                          'Khususnya pada remaja puteri, perhatian harus lebih ditekankan terhadap persiapan mereka sebelum menikah. Pada masa remaja akan mencoba hal yang baru. Seperti zaman sekarang ini yang penuh teknologi remaja memiliki kebiasaan berkumpul dengan genk di tempat-tempat yang dianggap trend dan biasanya remaja akan lebih suka mengonsumsi makanan cepat saji. Kebiasaan makan remaja umumnya dibentuk di keluarga, namun pengaruh perilaku makan di luar rumah cukup besar.',
                    ),
                    const TextArticleWidget(
                      text:
                          'Saat ini banyak sekali iklan makanan ditayangkan berupa makanan kaya gula, karbohidrat, lemak di televisi. Hal ini tentu saja berpengaruh besar terhadap pilihan makan remaja dan makanan siap santap (fast food) yang sangat mudah didapat juga mempengaruhi kebiasaan makan remaja. Kebiasaan makan yang salah akan terbawa ke masa kehidupan selanjutnya. Makanan makanan cepat saji perlahan-lahan mulai menggeser makanan tradisional. ',
                    ),
                    const TextArticleWidget(
                      text:
                          'Makanan tradisional sudah mulai menghilang karena remaja Indonesia lebih memilih makanan modern dan cepat saji seperti burger, pizza, kentang goreng, pasta, nugget, sosis. Makanan tradisional seperti gado-gado, ketoprak, pecal sudah sangat jarang dikonsumsi oleh remaja. Tidak jarang kita menemukan remaja baik laki-laki maupun perempuan mengalami obesitas. Kecenderungan remaja lebih menyukai makanan yang manis, tinggi lemak dan banyak mengandung garam tinggi seperti snack, kue-kue kering dan fast food. ',
                    ),
                    const TextArticleWidget(
                      text:
                          'Asupan serat yang rendah juga merupakan salah satu penyebab obesitas remaja. Beberapa penelitian menyimpulkan bahwa rasa merupakan alasan utama sulitnya remaja untuk meningkatkan asupan serat, khususnya sayuran. Sayuran dikaitkan dengan rasa negatif dan tidak menyenangkan bagi remaja, seperti pahit, asam, tidak memiliki rasa, lunak dan membosankan. Kalsium merupakan mineral dengan jumlah terbesar yang terdapat dalam tubuh. ',
                    ),
                    const TextArticleWidget(
                      text:
                          'Peranan mineral kalsium pada masa pertumbuhan remaja sangat penting. Di negara-negara maju seperti Amerika dan Australia angka kecukupan kalsium yang dianjurkan bagi remaja adalah sebesar 1200-1500 mg/hari. Remaja putri memiliki risiko sepuluh kali besar untuk menderita anemia dibandingkan dengan remaja putra. Hai ini dapat dimengerti karena remaja putri mengalami menstruasi setiap bulannya dan sedang alam masa pertumbuhan sehingga membutuhkan asupan zat besi yang lebih banyak. ',
                    ),
                    const TextArticleWidget(
                      text:
                          'Selain itu ketidakseimbangan asupan zat gizi menjadi penyebab anemia pada remaja. Kebanyakan dari remaja putri sangat memperhatikan bentuk tubuhnya dan berat badan sehingga para remaja ini membatasi konsumsi makanan dan membuat pantangan sendiri untuk menjaga tubuh mereka. Akibatnya asupan mereka akan berkurang, sehingga cadangan zat besi dibongkar untuk pemenuhan kebutuhan.Apabila keadaan ini berlanjut akan mempercepat anemia.',
                    ),
                    const SubtitleArtikelWidget(
                      title: 'Masalah Gizi pada Remaja',
                    ),
                    const ListArticleWidget(
                      text: 'Gangguan makan',
                    ),
                    const ListArticleWidget(
                      text: 'Obesitasn',
                    ),
                    const ListArticleWidget(
                      text: 'Anemia',
                    ),
                    const ListArticleWidget(
                      text: 'KEK',
                    ),
                    const SubtitleArtikelWidget(
                      title: 'Contoh Menu',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/jadwal_makan.png',
                      ),
                    ),
                    const TitleArticelWidget(
                      title: 'PERAN REMAJA DALAM PENCEGAHAN STUNTING',
                    ),
                    const TextArticleWidget(
                      text:
                          'Remaja adalah salah satu sasaran utama upaya pencegahan stunting. Para remaja kelak akan mengambil peran sebagai orangtua. Oleh karena itu, mengajak para remaja agar lebih aktif berkontribusi terhadap upaya pencegahan stunting menjadi penting untuk dilakukan. Para remaja atau mahasiswa tidak hanya sekadar tahu dan mengerti mengenai stunting untuk dirinya pribadi, tapi sekaligus menjadi agen perubahan yang mampu menyebarkan informasi stunting lebih luas lagi kepada lingkungan sekitarnya. Ini harus dilakukan bersama sebagai upaya untuk menjadikan masyarakat Indonesia sehat, sejahtera. dan produktif. ',
                    ),
                    const TextArticleWidget(
                      text:
                          'Pengguna aktif media sosial khususnya remaja di Indonesia sangat tinggi.  Mengingat data ini tercatat pada awal tahun 2020 sebelum pandemi terjadi, maka dapat diasumsikan bahwa waktu para remaja lebih banyak lagi dihabiskan untuk media sosial pada saat ini. Oleh karena itu, salah satu upaya pencegahan stunting dapat dilakukan dengan memanfaatkan media sosial. Memanfaatkan media sosial sebagai media penyebaran informasi mengenai stunting adalah salah satu cara yang efektif. ',
                    ),
                    const TextArticleWidget(
                      text:
                          'Media sosial yang paling sering diakses selanjutnya adalah WhatsApp sebesar 84%, Facebook sebesar 82%, dan Instagram 79%. Selain itu, ada media sosial baru yang cukup digemari pengguna internet di Indonesia, yaitu TikTok dengan jumlah pengguna sekitar 30,7 juta jiwa pengguna dari Indonesia menjadikan Indonesia menjadi negara pengguna TikTok terbesar keempat di dunia (Rayana, 2020). Begitu banyak pilihan media platform  sosial yang dapat digunakan untuk memberikan informasi dan pemahaman tentang stunting kepada masyarakat, terutama remaja.  Selain memanfaatkan media sosial untuk mengunggah informasi edukasi tentang stunting, media sosial juga dapat digunakan untuk menjawab berbagai informasi yang keliru tentang stunting.  ',
                    ),
                    const TextArticleWidget(
                      text:
                          'penggunaan pertanyaan "adiksimba" (apa, di mana, kapan, siapa, mengapa, bagaimana) dalam merangkai pesan untuk kampanye stunting dapat dijabarkan sebagai berikut: ',
                    ),
                    const ListArticleWidget(
                      text:
                          'What? Pesan apa yang akan disampaikan? Pengertian stunting, dampak dan upaya pencegahan stunting. ',
                    ),
                    const ListArticleWidget(
                      text:
                          'Where? Di mana kampanye ini dilakukan? Di media sosial untuk penyebaran informasi akan menjadi tempat bagi para remaja belajar lebih lanjut. ',
                    ),
                    const ListArticleWidget(
                      text:
                          'When? Kapan isu mengenai stunting perlu diketahui dan dipelajari oleh masyarakat? Mulai dari remaja dan dilaksanakan ketika 1000 Hari Pertama Kehidupan anak ',
                    ),
                    const ListArticleWidget(
                      text:
                          'Why?  Mengapa para remaja?  Sebab, mereka harus mengambil tindakan dan sebagai agen perubahan dalam upaya pencegahan stunting ini, karena remaja akan menjadi orangtua nantinya.',
                    ),
                    const ListArticleWidget(
                      text:
                          'Who?  Siapa yang harus paham?  Semua orang harus paham mengenai hal ini, tapi remaja adalah target utama.',
                    ),
                    const ListArticleWidget(
                      text:
                          'How?  Bagaimana peran remaja?  Mereka akan menjadi agen perubahan dengan ikut andil dalam kampanye ini.  Tidak terbatas untuk pengetahuan pribadi, namun diharapkan mampu menyebarluaskan informasi.',
                    ),
                    const TextArticleWidget(
                      text:
                          'Sosialisasi tentang pentingnya pola asuh dalam pencegahan stunting bisa dilakukan dengan lebih ringan dan menarik bagi para remaja.  Disampaikan dengan cara yang menyenangkan, bahasa yang sederhana, dan mudah dipahami.  Dengan demikian remaja akan jauh lebih tertarik dan perlahan mulai tumbuh rasa keingintahuan mereka untuk mempelajari dan memahami stunting lebih jauh lagi.  ',
                    ),
                    EndOfMateri(
                      text: 'Lanjut',
                      press: () async {
                        await AuthServices.nextMateri(14)
                            .then(
                              (value) =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Berhasil Menyelesaikan Materi 7"),
                                ),
                              ),
                            )
                            .onError(
                              (error, stackTrace) =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Permintaan Gagal"),
                                ),
                              ),
                            );
                        // ignore: use_build_context_synchronously
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Menu(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return Container(
          color: backgroundColor,
          child: Center(
            child: LoadingAnimationWidget.waveDots(
              color: Colors.white,
              size: 50,
            ),
          ),
        );
      },
    );
  }
}
