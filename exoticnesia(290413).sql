-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 29, 2013 at 06:58 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `update`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(20) NOT NULL,
  `isAktif` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `isAktif`) VALUES
('admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `container`
--

CREATE TABLE IF NOT EXISTS `container` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `namadaerah` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `namadaerah` (`namadaerah`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `container`
--

INSERT INTO `container` (`id`, `username`, `namadaerah`) VALUES
(8, 'farahs', 'Amed'),
(9, 'farahs', 'Bulukumba'),
(10, 'farahs', 'Pulau Harapan'),
(11, 'sipuji', 'Amed');

-- --------------------------------------------------------

--
-- Table structure for table `forum`
--

CREATE TABLE IF NOT EXISTS `forum` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(120) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL,
  `is_locked` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_forum_forum` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `forum`
--

INSERT INTO `forum` (`id`, `parent_id`, `title`, `description`, `listorder`, `is_locked`) VALUES
(1, NULL, 'Forum Umum', 'Announcements', 0, 1),
(2, 1, 'Forum Umum', 'Informasi umum mengenai Exoticnesia', 10, 0),
(3, NULL, 'Forum Santai', '', 20, 0),
(4, 3, 'Rekomendasi', 'Rekomedasi daerah wisata', 10, 0),
(5, 3, 'Ngobrol Yuk!', 'Obrolan hangat pengguna Exoticnesia', 20, 0),
(6, 3, 'Kritik dan Saran', 'Kritik dan saran terhadap Exoticnesia', 30, 0);

-- --------------------------------------------------------

--
-- Table structure for table `foto`
--

CREATE TABLE IF NOT EXISTS `foto` (
  `username` varchar(15) NOT NULL,
  `profil_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(15) NOT NULL,
  PRIMARY KEY (`username`,`profil_id`,`url`),
  KEY `profil_id` (`profil_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `foto`
--

INSERT INTO `foto` (`username`, `profil_id`, `url`) VALUES
('farahs', 1, '1.PNG'),
('farahs', 1, 'exoticnesia.png'),
('farahs', 1, 'install.PNG'),
('farahs', 1, 'irs term 6.PNG'),
('farahs', 1, 'siang.png'),
('farahs', 1, 'sore.png'),
('nikenafc', 3, 'bun3.jpg'),
('sipuji', 3, 'marcoreus.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `infonesia`
--

CREATE TABLE IF NOT EXISTS `infonesia` (
  `namadaerah` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `kendaraan` text,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`namadaerah`),
  UNIQUE KEY `namadaerah` (`namadaerah`),
  UNIQUE KEY `namadaerah_2` (`namadaerah`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `infonesia`
--

INSERT INTO `infonesia` (`namadaerah`, `deskripsi`, `kendaraan`, `username`) VALUES
('Amed', 'Salah satu objek wisata di Bali yang terkenal dengan site diving dan snorkeling adalah pantai Amed. Salah satu bagian pantai di sini adalah Pantai Jemeluk Amed, memiliki pemandangan bawah laut yang eksotis baik itu terumbu karang maupun kehidupan ikan laut tropis yang ada di dalamnya. Menginjakkan kaki kita di bukit Jemeluk, kita bisa menyaksikan hamparan lautan biru yang indah, deretan perahu nelayan sepanjang bibir pantai dan perkasanya Gunung Agung yang menjulang tinggi. Liburan anda akan terasa beda dengan suasana pedesaan dengan penduduk setempat yang ramah.\r\n\r\nYang menjadi unggulan di objek wisata pantai Amed adalah surganya bagi para penyelam dan sudah terkenal sampai ke mancanegara, memiliki tekstur pantai yang berkoral, air yang bening dan tenang dan tentunya memiliki keindahan bawah laut. Banyak wisatawan dari mancanegara dan beberapa wisatawan domestik mengunjungi objek wisata di Bali ini. Yang tak kalah menariknya jika melakukan wisata di sini suasana eksotis di pagi hari, dengan cahaya kuning keemasan matahari terbit di pagi hari, dipadu dengan segarnya angin laut dan pedesan yang jauh dari polusi, sungguh merupakan terapi alam yang membuat pikiran anda refresh kembali, sehingga membuat suasan liburan anda di Bali semakin mengesankan.', 'Untuk mencapai pantai Amed, Anda dapat menggunakan kendaraan bermotor dari pusat kota Amlapura, Kabupaten Karangasem.', 'admin'),
('Bulukumba', 'Kabupaten Bulukumba terletak di ujung paling selatan Semenanjung Sulawesi Selatan, atau sekitar 153 km dari selatan kota Makassar. Bulukumba dianugrahi alam yang indah dan menyimpan keajaiban menawan tersembunyi di pantai dan bawah lautnya. Bahkan berinteraksi dengan wajah-wajah baru masyarakat setempat yang berbudaya maritim adalah hal yang akan sangat berkesan bagi Anda nantinya.\r\nKabupaten Bulukumba dikenal juga sebagai Butta Panrita Lopi atau “Bumi Pembuat Pinisi ". Masyarakat Bulukumba memang sejak dahulu memiliki keahlian sebagai pembuat ulung kapal layar pinisi  yang merupakan kebanggaan orang Bugis. Hingga saat ini keterampilan mereka bahkan didengar dan dihargai oleh berbagai pihak dari mancanegara.', 'Untuk mencapai Bulukumba, Anda dapat langsung berangkat dari Bandara Internasional Hasanuddin di Makassar menuju terminal Malengkeri dengan taksi atau kendaraan bermotor lainnya. Dari terminal, Anda dapat menaiki bus atau angkutan umum lainnya ke Bulukumba.', 'admin'),
('Bunaken', 'Bunaken berada di Teluk Manado dengan luas 8,08 km², terletak di utara pulau Sulawesi, Indonesia. Bunaken merupakan bagian dari pemerintahan kota Manado, ibu kota Sulawesi Utara. Taman laut di sekitar Bunaken adalah bagian dari Taman Nasional yang juga termasuk laut sekitar pulau Manado Tua yaitu Siladen dan Mantehage.\r\nPerairan Laut Bunaken memungkinkan orang dapat dengan jelas melihat berbagai biota laut. Ada 13 jenis terumbu karang di taman laut ini yang didominasi oleh bebatuan laut. Pemandangan yang paling menarik adalah terumbu karang terjal vertikal yang menjulang ke bawah sedalam 25-50 meter.\r\n', 'Pulau Bunaken sangat mudah di capai dari Manado dengan kapal motor. Anda dapat berangkat dari pelabuhan Manado, Molas, Kalasey, dan Pantai Ria Tasik.', 'admin'),
('Gili Trawangan', 'Gili Trawangan adalah pulau terbesar dari ketiga pulau kecil atau gili yang terdapat di sebelah barat laut Lombok. Trawangan juga satu-satunya gili yang ketinggiannya di atas permukaan laut cukup signifikan. Dengan panjang 3 km dan lebar 2 km, Gili Trawangan berpopulasi sekitar 800 jiwa. \r\nAktivitas yang populer dilakukan para wisatawan di Gili Trawangan adalah scuba diving (dengan sertifikasi PADI), snorkeling (di pantai sebelah timur laut), bermain kayak, dan berselancar. Ada juga beberapa tempat bagi para wisatawan belajar berkuda mengelilingi pulau.\r\nDi Gili Trawangan (begitu juga di dua gili yang lain), tidak terdapat kendaraan bermotor, karena tidak diizinkan oleh aturan lokal. Sarana transportasi yang lazim adalah sepeda (disewakan oleh masyarakat setempat untuk para wisatawan) dan cidomo, kereta kuda sederhana yang umum dijumpai di Lombok. \r\n', 'Untuk mencapai Pulau Gili Trawangan, Anda dapat menaiki speedboat dari Pelabuhan Bangsal, Lombok', 'admin'),
('Gunung Maras', 'Gunung ini menawarkan kedamaian alam pedesaan yang asri, dengan pesawahan yang maha luas dan pepohonan yang rindang di samping rumah-rumah penduduk. Selain itu, di sekitar Gunung yang memiliki ketinggian 699 m. dari permukaan laut ini ditumbuhi pepohonan liar yang lebat. Di pagi hari, pengunjung bisa menyaksikan matahari terbit di sela-sela pucuk pepohonan. Saat senja, pengunjung bisa menyaksikan matahari beringsut masuk di balik indahnya panorama pertanian. Sedangkan pada malam hari pengunjung akan disuguhi deritan-deritan pepohonan hutan. Agar pengunjung dapat menikmati keindahan alamnya dengan tenang, disarankan untuk membawa perbekalan makan secukupnya dan alat tidur/tenda sebelum naik gunung, karena tidak ada usaha jasa yang menawarkan fasilitas tersebut kepada pengunjung.', 'Dari Kota Sungailiat menuju ke Gunung Maras, pengunjung dapat menggunakan angkutan umum seperti bus atau mobil pedesaan, tetapi angkutan ini tidak sampai ke lokasi. Oleh karena itu, disarankan agar pengunjung menggunakan kendaraan sendiri atau menaiki ojek dari Kota Belinyu. ', 'admin'),
('Jimbaran', 'Jimbaran adalah sebuah pantai di Kabupaten Badung, Bali, Indonesia. Letaknya di sebelah selatan pulau Bali, sekitar 5 km dari Bandara Internasional Ngurah Rai. Jimbaran adalah tempat wisata favorit di Bali, menawarkan berbagai daya tarik makanan laut / seafood centre yang terletak di pinggir pantai, suasana sunset (matahari tenggelam) yang indah kemudian suasana malam pantainya yang romantis, sambil menikmati makanan di pantai diiringi alunan musik tentunya tak mungkin dilewatkan oleh wisatawan. Untuk wisata kuliner di Bali, jangan pernah lewatkan tempat ini, satu-satunya tempat yang menyediakan seafood.', 'Untuk mencapai Jimbaran dibutuhkan waktu kurang lebih 15 menit dari Bandara Internasional I Gusti Ngurah Rai dengan menggunakan kendaraan bermotor.', 'admin'),
('Kota Air Muara Teweh', 'Kota Air Muara Teweh, merupakan Ibu Kota Kabupaten Barito Utara yang mayoritas penduduknya berasal dari suku Dayak Bakumpai, subetnis Dayak di Barito yang memeluk agama Islam. Kota kecil yang dikelilingi hutan dan bentuknya memanjang mengikuti aliran sungai ini merupakan satu-satunya kota ramai di daerah pedalaman Sungai Barito, yang membelah Pulau Kalimantan dari Banjarmasin, Kalimantan Selatan, hingga Kabupaten Murung raya, Kalimantan Tengah.\r\n\r\nSebagai kota air, Muara Teweh menyuguhkan pemandangan yang unik. Di kota kecil ini, terdapat rumah apung yang cukup banyak, berderet di sepanjang tepian Sungai Barito. Jenis rumah semacam ini dapat dianggap sebagai kearifan lokal dalam menghadapi bahaya banjir. Karena banjir di Muara Teweh pada umumnya berupa genangan, bukan air bah, jadi setinggi apapun banjir yang terjadi tidak akan menenggelamkan rumah-rumah tersebut.\r\n', 'Untuk mencapai Kota Air Muara Teweh, Anda dapat menaiki kendaraan bermotor dari Banjarmasin', 'admin'),
('Lhok Seudu', 'Dengan berjarak sekitar 30 km dari kota Banda Aceh, Lhok Seudu merupakan suatu daerah yang berdekatan dengan sebelah barat Banda Aceh. LhokSeudu menyimpan potensi alam untuk wisata, khususnya untuk wisata memancing. Panorama alam kaki gunung kulu dan indahnya pantai pasir putih yang membentuk kolam seperti danau kecil di antara dua pulau membuat tempat ini menjadi salah satu tempat favorit para wisatawan maupun penduduk local untuk memancing. Selain itu, di Lhokseudu juga banyak terdapat ikan asin yang diasinkan oleh warga dan dijual dengan harga terjangkau serta memiliki rasa yang berbeda dengan daerah lainnya di Indonesia.', 'Menggunakan kendaraan bermotor, berjarak sekitar 30 km dari Banda Aceh.', 'admin'),
('Loh Liang', 'Loh Liang merupakan pintu masuk dan daerah wisata utama di Pulau Komodo. Aktivitas yang dapat dilakukan di Loh Liang antara lain pengamatan satwa komodo, rusa, babi hutan, pengamatan burung, pendakian (Loh Liang - Gunung Ara), penjelajahan (Loh Liang - Loh Sebita), Photo hunting, video shooting, Menyelam dan snorkeling di Pantai Merah (Pink beach).\r\n\r\nDi Loh Liang terdapat fasilitas yang tersedia bagi pengunjung yakni pondok wisata, pusat informasi, cafetaria, dermaga, shelter dan jalan setapak. \r\n', 'Untuk mencapai Loh Liang, Anda dapat menumpang bus atau kendaraan sewaan melalui Labuan Bajo, ibu kota Kabupaten Manggarai Barat dan dilanjutkan dengan menumpang boat menuju kawasan Taman Nasional Komodo.', 'admin'),
('Pulau Harapan', 'Pulau Harapan adalah pulau penduduk yang masih asri dan tenang. Pulau Harapan berdekatan dengan pulau-pulau wisata di Kepulauan Seribu Utara seperti Pulau Putri yang terkenal dengan Aqurium bawah lautnya, Pulau Sepa yang terkenal dengan pantai yang bersih dan berpasir putih. Selain itu Pulau Harapan adalah pulau yang berdekatan langsung dengan Bandara udara Kepulauan Seribu. Selain berdekatan dengan pulau-pulau wisata, Kondisi alam disekitar Pulau Harapan masih terjaga sehingga masih banyak ditemukan ikan maupun karang hias yang masih alami. Spot snorkling dan diving yang jauh lebih bagus, Pulau Harapan sangat mungkin akan menjadi tujuan wisata yang sangat diminati.', 'Pulau Harapan dapat dicapai dengan menggunakan kapal feri dari Dermaga Muara Angke.', 'admin'),
('Pulau Kakaban', 'Bagi Anda yang menggilai diving atau snorkeling dan ingin bermain-main dengan aman bersama ubur-ubur yang  tak menyengat di danau air payau (yang hanya ada dua saja di dunia) maka menyambangi Pulau Kakaban wajib masuk dalam agenda wisata Anda. Pulau Kakaban adalah satu dari total 31 pulau yang tergabung dalam kelompok Kepulauan Derawan dan secara administratif termasuk dalam wilayah Kabupaten Berau, Kepulauan Derawan, Kalimantan Timur.\r\n\r\nKeberadaan Danau Kakaban adalah salah satu alasan utama wisatawan berkunjung  ke pulau yang tak berpenghuni ini. Pasalnya, danau air payau tersebut memiliki ekositem yang unik (endemik) hasil evolusi dan melibatkan proses kimia, fisika, dan biologi yang rumit dan panjang selama ribuan tahun. Telah banyak peneliti dari dalam dan luar negeri mencoba memecahkan misteri tentang bagaimana sebuah ekosistem danau yang terisolasi dapat menjadi rumah bagi hewan dan tumbuhan endemik yang hidup di dalamnya. Danau endemik sekira 2,6 x 1,5 kilometer ini menjadi rumah bagi jutaan ubur-ubur yang kehilangan kemampuan menyengat, algae yang menjadi karpet di dasar danau, anemon yang berwarna putih dan memangsa ubur-ubur, ikan-ikan, dan biota endemik lainnya. Tercatat hanya ada dua danau air payau jenis ini di dunia: Danau Kakaban di Kepulauan Derawan dan Jellyfish Lake di Palau, Micronesia di kawasan tenggara Laut Pasifik.', 'Untuk mencapai Pulau Kakaban, Anda dapat menaiki speedboat berkapasitas 15 orang dari Derawan, Maratua, atau Sangalaki.', 'admin'),
('Pulau Penyengat', 'Pulau Penyengat atau Pulau Penyengat Inderasakti dalam sebutan sumber-sumber sejarah, adalah sebuah pulau kecil yang berjarak kurang lebih 3 km dari Kota Tanjungpinang, pusat pemerintahan Provinsi Kepulauan Riau. Pulau ini berukuran kurang lebih 2.500 meter x 750 meter, dan berjarak lebih kurang 35 km dari Pulau Batam.\r\nPulau Penyengat merupakan salah satu obyek wisata di Kepulauan Riau. Salah satu objek yang bisa kita liat adalah Masjid Raya Sultan Riau yang terbuat dari putih telur, makam-makam para raja, makam dari pahlawan nasional Raja Ali Haji, kompleks Istana Kantor dan benteng pertahanan di Bukit Kursi. Pulau penyengat dan komplek istana di Pulau Penyengat telah dicalonkan ke UNESCO untuk dijadikan salah satu Situs Warisan Dunia', 'Pulau ini dapat dituju dari Pelabuhan Tanjung Pinang dengan menggunakan perahu bot atau lebih dikenal dengan bot pompong.', 'admin'),
('Pulau Randayan', 'Pulau Randayan merupakan salah satu obyek wisata di Kalimantan Barat dan berada di kawasan Kepulauan Lemukutan Besar, terletak di Laut Cina Selatan di sebelah Barat Pulau Kalimantan. Jaraknya yang tidak terlalu jauh membuat Pulau Randayan sangat menarik untuk dikunjungi. Pulau Randayan memiliki alam yang sangat indah serta pemandangan bawah laut yang sangat eksotis. Selain itu, pantai pasir putih yang dimiliki Pulau Randayan sangat indah untuk menarik wisatawan datang ke pulau ini. Kita dapat ber-snorkling sambil menikmati ekosistem bawah laut yang masih terjaga keasriannya.', 'Pulau Randayan dapat dicapai dengan menggunakan perahu kelotok dari Teluk Suak atau dari Sungai Raya.', 'admin'),
('Pulau Samalona', 'Pulau yang terletak di barat kota Makassar ini mempunyai keindahan dengan eksotisme daratan berpasir putih, letaknya tak jauh dari kawasan ibukota sangat tepat bagi masyarakat perkotaan yang mencari tempat kawasan wisata ekslusif, cocok untuk menyepi menjauh dari hingar rutinitas sejenak, Pulau Samalona merupakan kawasan terpadu yang dikelola secara swadaya oleh masyarakat setempat dengan menyewakan beragam fasilitas akomodasi bagi turis yang datang.', 'Untuk mencapai pulau ini, Anda dapat berangkat menggunakan kapal temple atau kapal cepat dari Pelabuhan Pantai Losari.', 'admin'),
('Raja Ampat', 'Raja Ampat atau ''Empat Raja'' adalah nama yang diberikan untuk pulau-pulau ini. Sebuah nama yang berasal dari mitos lokal. Empat pulau utama yang dimaksud itu adalah Waigeo, Salawati, Batanta, Misool yang merupakan penghasil lukisan batu kuno.\r\n\r\nPecinta wisata bawah laut dari seluruh dunia datang ke Raja Ampat untuk menikmati pemandangan bawah laut terbaik di dunia yang mengagumkan. Dua hari sebelumnya, saat Anda berada di Bali yang ramai sekaligus sakral berbalut seni maka naiklah pesawat menuju ujung kepala burung Pulau Papua. Selanjutnya, bersiaplah untuk sebuah petualangan yang takkan terlupakan. Mulailah tur Anda dari sini dengan menyelam di bawah lautnya yang paling indah. Jelajahilah dinding bawah laut yang vertical itu. Rasakan juga ketegangan menyelamnya, berdebar-debar saat terombang-ambing arus laut. Itu pastinya akan menjadi pengalaman pribadi yang tak terlupakan di Raja Ampat.', 'Untuk mencapai Raja Ampat, Anda dapat menggunakan kapal feri yang berangkat setiap hari dari Sorong ke Waisai, ibu kota Kabupaten Raja Ampat di Pulau Waigeo.', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE IF NOT EXISTS `pengguna` (
  `username` varchar(20) NOT NULL,
  `kodeDaftar` varchar(50) NOT NULL,
  `isAktif` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`username`, `kodeDaftar`, `isAktif`) VALUES
('farahs', 'f3b2d7627dbb1407fb4112bcc169ab01', 1),
('irfanIF', 'eceec728a31cb43e57b77ed98a573d99', 1),
('nikenafc', '435caa044b0db1a43fe6b302d7fa9403', 1),
('sipuji', 'f96e78167ac5128355cdef080692fb31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `penginapan`
--

CREATE TABLE IF NOT EXISTS `penginapan` (
  `namadaerah` varchar(50) NOT NULL,
  `penginapan` varchar(200) NOT NULL,
  PRIMARY KEY (`namadaerah`,`penginapan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penginapan`
--

INSERT INTO `penginapan` (`namadaerah`, `penginapan`) VALUES
('Amed', ' Apa Kabar Villas'),
('Amed', ' Arya Amed Beach Resort'),
('Amed', ' Blue Moon Villas\r\n'),
('Amed', ' Toyabali Beach Bungalows'),
('Amed', 'Aries Bungalows Tulamben'),
('Bulukumba', ' Anda Bunglows\r\n'),
('Bulukumba', ' Bahagia Pondok Wisata Hotel'),
('Bulukumba', ' Penginapan Pasir Putih Bira'),
('Bulukumba', ' Riswan Bungalows'),
('Bulukumba', 'Penginapan Tanjung Bira'),
('Bunaken', ' Bunaken Cha Cha Nature Resort'),
('Bunaken', ' Bunaken SeaGarden Resort\r\n'),
('Bunaken', 'Bunaken Island Resort'),
('Gili Trawangan', ' Gili Palm Resort Gili Trawangan'),
('Gili Trawangan', ' Queen Villa Gili Trawangan'),
('Gili Trawangan', ' Sunrise Bungalow Gili Trawangan'),
('Gili Trawangan', 'Villa Ombak Gili Trawangan'),
('Gunung Maras', 'Camping di daerah Gunung Maras'),
('Jimbaran', ' Bukit Inn'),
('Jimbaran', ' Keraton Jimbaran Resort'),
('Jimbaran', ' Puri Bambu Hotel\r\n'),
('Jimbaran', ' Villa Bali Jegeg'),
('Jimbaran', 'MaxGramper houses'),
('Kota Air Muara Teweh', 'Tidak Ada'),
('Lhok Seudu', ' Hotel Diana, Banda Aceh'),
('Lhok Seudu', ' Siwah Hotel, Banda Aceh\r\n'),
('Lhok Seudu', 'Sulthan Hotel International, Banda Aceh'),
('Loh Liang', ' Hotel Astiti'),
('Loh Liang', ' Hotel Rai Hawu\r\n'),
('Loh Liang', 'Hotel Kristal Kupang'),
('Pulau Harapan', ' Homestay Hevik'),
('Pulau Harapan', ' Homestay Mawar\r\n'),
('Pulau Harapan', 'Homestay Anggrek'),
('Pulau Kakaban', 'Pulau Kakaban adalah pulau tak berpenghuni. Untuk memenuhi kebutuhan akomodasi Anda, resot di Kepulauan Derawan, PulauSangalaki, dan Pulau Maratua dapat menjadi pilihan.'),
('Pulau Penyengat', 'Hotel Mutiara Tanjungpinang'),
('Pulau Randayan', 'Hotel Palapa Beach, Singkawang'),
('Pulau Samalona', 'Penginapan rumah panggung'),
('Raja Ampat', ' Island Camp\r\n'),
('Raja Ampat', ' Kri Eco Resort'),
('Raja Ampat', 'Sorido Bay Resort');

-- --------------------------------------------------------

--
-- Table structure for table `pengunjungterdaftar`
--

CREATE TABLE IF NOT EXISTS `pengunjungterdaftar` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `signature` text,
  `firstseen` int(10) unsigned NOT NULL,
  `lastseen` int(10) unsigned NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengunjungterdaftar`
--

INSERT INTO `pengunjungterdaftar` (`username`, `password`, `email`, `signature`, `firstseen`, `lastseen`) VALUES
('admin', 'admin', 'admin@gmail.com', NULL, 0, 0),
('farahs', 'leoleoleo', 'farahshafira@yahoo.com', NULL, 0, 0),
('irfanIF', 'irfanirfan', 'irfanfadhillah@gmail.com', NULL, 0, 0),
('nikenafc', 'nikenniken', 'nikenafc@gmail.com', NULL, 0, 0),
('sipuji', '20maret1992', 'sipuji.dinata@gmail.com', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authorUsername` varchar(20) CHARACTER SET latin1 NOT NULL,
  `editorUsername` varchar(20) CHARACTER SET latin1 NOT NULL,
  `thread_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `created` int(10) NOT NULL,
  `updated` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `authorUsername` (`authorUsername`),
  KEY `thread_id` (`thread_id`),
  KEY `editorUsername` (`editorUsername`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `authorUsername`, `editorUsername`, `thread_id`, `content`, `created`, `updated`) VALUES
(1, 'farahs', 'farahs', 1, 'The first release is a fact!', 0, 0),
(19, 'admin', '', 19, 'adasfasfsfsfsfsf', 1366525885, 1366525885),
(20, 'sipuji', '', 1, 'fadkgjo;[pokjmn', 1366526112, 1366526112),
(32, 'farahs', '', 19, 'wrewfsfdvg', 1366953821, 1366953821),
(33, 'admin', '', 20, '**ciye banget** gaul abis *deh orang2*\r\n', 1367141486, 1367141528),
(34, 'admin', '', 19, 'sdsfsdfsdfdsf **fdsfsgd g sdg s s** *sccsxadxcscs*\r\n\r\n> csse vrcnbytmijnyhnuh`vrvbybyrbytvefewecreevfvtrvbrgvbrtg`', 1367155993, 1367155993),
(35, 'admin', '', 19, 'asdsafsfsdf', 1367156206, 1367156206),
(36, 'farahs', '', 21, 'dsggdsfvsdvfvrd **vrtvtbrgrtbgbrdgd** *gwerfvbergvbegrtvrgtrgfd*', 1367211070, 1367212258),
(37, 'farahs', '', 21, 'sadsdfgfdgfdgdfgfd \r\n\r\n> dsfsdfsdfsfsdfsdfdsffsdfsdfsfdssf`fsdfdsfdfsdfdsfsddsddsdsds`', 1367212276, 1367212276);

-- --------------------------------------------------------

--
-- Table structure for table `profil`
--

CREATE TABLE IF NOT EXISTS `profil` (
  `username` varchar(20) NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(40) NOT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`username`,`id`),
  UNIQUE KEY `username` (`username`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `profil`
--

INSERT INTO `profil` (`username`, `id`, `nama`, `contact`, `sex`, `avatar`) VALUES
('farahs', 1, 'Farah Shafira E', '6287881598072', 'Male', 'anigif.gif'),
('irfanIF', 2, 'Irfan Fadhillah', '', '', ''),
('nikenafc', 3, 'Niken Paramita', '1234', 'Male', 'poohlagilagi.gif'),
('sipuji', 4, 'Puji Martadinata', '081219657780', 'Male', 'IMG-20130408-01498.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `namadaerah` varchar(50) NOT NULL,
  `nilai` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`namadaerah`,`nilai`,`username`),
  KEY `namadaerah` (`namadaerah`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`namadaerah`, `nilai`, `username`) VALUES
('Amed', 4, 'farahs'),
('Bulukumba', 5, 'farahs'),
('Gunung Maras', 4, 'farahs'),
('Kota Air Muara Teweh', 3, 'farahs'),
('Loh Liang', 5, 'farahs'),
('Pulau Harapan', 4, 'farahs'),
('Bunaken', 3, 'nikenafc'),
('Amed', 2, 'sipuji'),
('Bulukumba', 3, 'sipuji'),
('Bunaken', 4, 'sipuji'),
('Gili Trawangan', 2, 'sipuji'),
('Jimbaran', 4, 'sipuji');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE IF NOT EXISTS `review` (
  `namadaerah` varchar(50) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isi` text NOT NULL,
  `username` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`namadaerah`, `id`, `isi`, `username`) VALUES
('Amed', 5, 'lala', 'sipuji'),
('Bulukumba', 6, 'yey', 'sipuji'),
('Amed', 7, 'haihai', 'nikenafc'),
('Amed', 8, 'adsdadsa', 'nikenafc'),
('Amed', 9, 'dsasd', 'nikenafc'),
('Amed', 10, 'dcdd', 'nikenafc'),
('Amed', 11, 'Salah satu objek wisata di Bali yang terkenal dengan site diving dan snorkeling adalah pantai Amed. Salah satu bagian pantai di sini adalah Pantai Jemeluk Amed, memiliki pemandangan bawah laut yang eksotis baik itu terumbu karang maupun kehidupan ikan laut tropis yang ada di dalamnya. Menginjakkan kaki kita di bukit Jemeluk, kita bisa menyaksikan hamparan lautan biru yang indah, deretan perahu nelayan sepanjang bibir pantai dan perkasanya Gunung Agung yang menjulang tinggi. Liburan anda akan terasa beda dengan suasana pedesaan dengan penduduk setempat yang ramah. Yang menjadi unggulan di objek wisata pantai Amed adalah surganya bagi para penyelam dan sudah terkenal sampai ke mancanegara, memiliki tekstur pantai yang berkoral, air yang bening dan tenang dan tentunya memiliki keindahan bawah laut. Banyak wisatawan dari mancanegara dan beberapa wisatawan domestik mengunjungi objek wisata di Bali ini. Yang tak kalah menariknya jika melakukan wisata di sini suasana eksotis di pagi hari, dengan cahaya kuning keemasan matahari terbit di pagi hari, dipadu dengan segarnya angin laut dan pedesan yang jauh dari polusi, sungguh merupakan terapi alam yang membuat pikiran anda refresh kembali, sehingga membuat suasan liburan anda di Bali semakin mengesankan.', 'nikenafc'),
('Amed', 12, 'Salah satu objek wisata di Bali yang terkenal dengan site diving dan snorkeling adalah pantai Amed. Salah satu bagian pantai di sini adalah Pantai Jemeluk Amed, memiliki pemandangan bawah laut yang eksotis baik itu terumbu karang maupun kehidupan ikan laut tropis yang ada di dalamnya. Menginjakkan kaki kita di bukit Jemeluk, kita bisa menyaksikan hamparan lautan biru yang indah, deretan perahu nelayan sepanjang bibir pantai dan perkasanya Gunung Agung yang menjulang tinggi. Liburan anda akan terasa beda dengan suasana pedesaan dengan penduduk setempat yang ramah. Yang menjadi unggulan di objek wisata pantai Amed adalah surganya bagi para penyelam dan sudah terkenal sampai ke mancanegara, memiliki tekstur pantai yang berkoral, air yang bening dan tenang dan tentunya memiliki keindahan bawah laut. Banyak wisatawan dari mancanegara dan beberapa wisatawan domestik mengunjungi objek wisata di Bali ini. Yang tak kalah menariknya jika melakukan wisata di sini suasana eksotis di pagi hari, dengan cahaya kuning keemasan matahari terbit di pagi hari, dipadu dengan segarnya angin laut dan pedesan yang jauh dari polusi, sungguh merupakan terapi alam yang membuat pikiran anda refresh kembali, sehingga membuat suasan liburan anda di Bali semakin mengesankan.', 'nikenafc'),
('Amed', 13, 'Salah satu objek wisata di Bali yang terkenal dengan site diving dan snorkeling adalah pantai Amed. Salah satu bagian pantai di sini adalah Pantai Jemeluk Amed, memiliki pemandangan bawah laut yang eksotis baik itu terumbu karang maupun kehidupan ikan laut tropis yang ada di dalamnya. Menginjakkan kaki kita di bukit Jemeluk, kita bisa menyaksikan hamparan lautan biru yang indah, deretan perahu nelayan sepanjang bibir pantai dan perkasanya Gunung Agung yang menjulang tinggi. Liburan anda akan terasa beda dengan suasana pedesaan dengan penduduk setempat yang ramah. Yang menjadi unggulan di objek wisata pantai Amed adalah surganya bagi para penyelam dan sudah terkenal sampai ke mancanegara, memiliki tekstur pantai yang berkoral, air yang bening dan tenang dan tentunya memiliki keindahan bawah laut. Banyak wisatawan dari mancanegara dan beberapa wisatawan domestik mengunjungi objek wisata di Bali ini. Yang tak kalah menariknya jika melakukan wisata di sini suasana eksotis di pagi hari, dengan cahaya kuning keemasan matahari terbit di pagi hari, dipadu dengan segarnya angin laut dan pedesan yang jauh dari polusi, sungguh merupakan terapi alam yang membuat pikiran anda refresh kembali, sehingga membuat suasan liburan anda di Bali semakin mengesankan.', 'nikenafc'),
('Amed', 14, 'Salah satu objek wisata di Bali yang terkenal dengan site diving dan snorkeling adalah pantai Amed. Salah satu bagian pantai di sini adalah Pantai Jemeluk Amed, memiliki pemandangan bawah laut yang eksotis baik itu terumbu karang maupun kehidupan ikan laut tropis yang ada di dalamnya. Menginjakkan kaki kita di bukit Jemeluk, kita bisa menyaksikan hamparan lautan biru yang indah, deretan perahu nelayan sepanjang bibir pantai dan perkasanya Gunung Agung yang menjulang tinggi. Liburan anda akan terasa beda dengan suasana pedesaan dengan penduduk setempat yang ramah. Yang menjadi unggulan di objek wisata pantai Amed adalah surganya bagi para penyelam dan sudah terkenal sampai ke mancanegara, memiliki tekstur pantai yang berkoral, air yang bening dan tenang dan tentunya memiliki keindahan bawah laut. Banyak wisatawan dari mancanegara dan beberapa wisatawan domestik mengunjungi objek wisata di Bali ini. Yang tak kalah menariknya jika melakukan wisata di sini suasana eksotis di pagi hari, dengan cahaya kuning keemasan matahari terbit di pagi hari, dipadu dengan segarnya angin laut dan pedesan yang jauh dari polusi, sungguh merupakan terapi alam yang membuat pikiran anda refresh kembali, sehingga membuat suasan liburan anda di Bali semakin mengesankan.', 'nikenafc'),
('Amed', 15, 'Salah satu objek wisata di Bali yang terkenal dengan site diving dan snorkeling adalah pantai Amed. Salah satu bagian pantai di sini adalah Pantai Jemeluk Amed, memiliki pemandangan bawah laut yang eksotis baik itu terumbu karang maupun kehidupan ikan laut tropis yang ada di dalamnya. Menginjakkan kaki kita di bukit Jemeluk, kita bisa menyaksikan hamparan lautan biru yang indah, deretan perahu nelayan sepanjang bibir pantai dan perkasanya Gunung Agung yang menjulang tinggi. Liburan anda akan terasa beda dengan suasana pedesaan dengan penduduk setempat yang ramah. Yang menjadi unggulan di objek wisata pantai Amed adalah surganya bagi para penyelam dan sudah terkenal sampai ke mancanegara, memiliki tekstur pantai yang berkoral, air yang bening dan tenang dan tentunya memiliki keindahan bawah laut. Banyak wisatawan dari mancanegara dan beberapa wisatawan domestik mengunjungi objek wisata di Bali ini. Yang tak kalah menariknya jika melakukan wisata di sini suasana eksotis di pagi hari, dengan cahaya kuning keemasan matahari terbit di pagi hari, dipadu dengan segarnya angin laut dan pedesan yang jauh dari polusi, sungguh merupakan terapi alam yang membuat pikiran anda refresh kembali, sehingga membuat suasan liburan anda di Bali semakin mengesankan.', 'nikenafc'),
('Amed', 16, 'Salah satu objek wisata di Bali yang terkenal dengan site diving dan snorkeling adalah pantai Amed. Salah satu bagian pantai di sini adalah Pantai Jemeluk Amed, memiliki pemandangan bawah laut yang eksotis baik itu terumbu karang maupun kehidupan ikan laut tropis yang ada di dalamnya. Menginjakkan kaki kita di bukit Jemeluk, kita bisa menyaksikan hamparan lautan biru yang indah, deretan perahu nelayan sepanjang bibir pantai dan perkasanya Gunung Agung yang menjulang tinggi. Liburan anda akan terasa beda dengan suasana pedesaan dengan penduduk setempat yang ramah. Yang menjadi unggulan di objek wisata pantai Amed adalah surganya bagi para penyelam dan sudah terkenal sampai ke mancanegara, memiliki tekstur pantai yang berkoral, air yang bening dan tenang dan tentunya memiliki keindahan bawah laut. Banyak wisatawan dari mancanegara dan beberapa wisatawan domestik mengunjungi objek wisata di Bali ini. Yang tak kalah menariknya jika melakukan wisata di sini suasana eksotis di pagi hari, dengan cahaya kuning keemasan matahari terbit di pagi hari, dipadu dengan segarnya angin laut dan pedesan yang jauh dari polusi, sungguh merupakan terapi alam yang membuat pikiran anda refresh kembali, sehingga membuat suasan liburan anda di Bali semakin mengesankan.', 'nikenafc'),
('Amed', 19, 'tempat yang bagus', 'farahs'),
('Pulau Harapan', 20, 'tempat yang indah', 'farahs'),
('Pulau Harapan', 21, 'tempat yang bagus', 'sipuji'),
('Pulau Harapan', 22, 'halo', 'sipuji');

-- --------------------------------------------------------

--
-- Table structure for table `tempatmakan`
--

CREATE TABLE IF NOT EXISTS `tempatmakan` (
  `namadaerah` varchar(50) NOT NULL,
  `tempatmakan` varchar(200) NOT NULL,
  PRIMARY KEY (`namadaerah`,`tempatmakan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tempatmakan`
--

INSERT INTO `tempatmakan` (`namadaerah`, `tempatmakan`) VALUES
('Amed', ' Warung Bobo II'),
('Amed', ' Warung Kemulan'),
('Amed', ' Warung Makan TriYoga'),
('Amed', ' Warung Segara\r\n'),
('Amed', 'Warung Enak'),
('Bulukumba', 'Bira Beach Restaurant'),
('Bunaken', 'Restoran Bunaken Indah'),
('Gili Trawangan', ' Black Penny Restaurant\r\n'),
('Gili Trawangan', ' Karma Kayak'),
('Gili Trawangan', ' Ko Ko Mo'),
('Gili Trawangan', ' Trattoria Cucina Italiana'),
('Gili Trawangan', 'Kafe Kecil & Taman Thai'),
('Gunung Maras', 'RM Gunung Maras Lestari'),
('Jimbaran', ' Grocer & Grind'),
('Jimbaran', ' Jimbaran Beach Club\r\n'),
('Jimbaran', ' Pepe Nero'),
('Jimbaran', 'Depot Joko'),
('Kota Air Muara Teweh', ' Penginapan Benteng Danum'),
('Kota Air Muara Teweh', ' Penginapan Gunung Sintuk\r\n'),
('Kota Air Muara Teweh', 'Penginapan Walet'),
('Lhok Seudu', 'Tidak ada'),
('Loh Liang', 'Restoran Taman Nasional Komodo'),
('Pulau Harapan', 'Restoran Apung'),
('Pulau Kakaban', 'Tidak ada tempat makan di Pulau Kakaban, tempat makan dapat ditemukan di Pulau Derawan, salah satunya April Resto.'),
('Pulau Penyengat', 'Warung Alamak Restaurant & Cafe'),
('Pulau Randayan', 'Tidak ada'),
('Pulau Samalona', 'Tidak ada'),
('Raja Ampat', 'Acropora Restaurant');

-- --------------------------------------------------------

--
-- Table structure for table `thread`
--

CREATE TABLE IF NOT EXISTS `thread` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` int(10) unsigned NOT NULL,
  `subject` varchar(120) NOT NULL,
  `is_sticky` tinyint(1) unsigned NOT NULL,
  `is_locked` tinyint(1) unsigned NOT NULL,
  `view_count` bigint(20) unsigned NOT NULL,
  `created` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_thread_forum` (`forum_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `thread`
--

INSERT INTO `thread` (`id`, `forum_id`, `subject`, `is_sticky`, `is_locked`, `view_count`, `created`) VALUES
(1, 2, 'First release', 1, 0, 50, 0),
(19, 2, '12343434', 0, 0, 9, 1366525884),
(20, 4, 'qwqewewew', 0, 0, 2, 1367141486),
(21, 2, 'sdfsdfdsfsd', 0, 0, 3, 1367211070);

-- --------------------------------------------------------

--
-- Table structure for table `urlpic`
--

CREATE TABLE IF NOT EXISTS `urlpic` (
  `namadaerah` varchar(50) NOT NULL,
  `urlpic` varchar(100) NOT NULL,
  PRIMARY KEY (`namadaerah`,`urlpic`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `urlpic`
--

INSERT INTO `urlpic` (`namadaerah`, `urlpic`) VALUES
('Amed', 'amed1.jpg'),
('Amed', 'amed2.jpg'),
('Amed', 'amed3.JPG'),
('Amed', 'amed4.jpg'),
('Amed', 'amed5.png'),
('Bulukumba', 'bul1.jpg'),
('Bulukumba', 'bul2.jpg'),
('Bulukumba', 'bul3.jpg'),
('Bulukumba', 'bul4.jpg'),
('Bulukumba', 'bul5.jpg'),
('Bunaken', 'bun1.jpg'),
('Bunaken', 'bun2.jpg'),
('Bunaken', 'bun3.jpg'),
('Bunaken', 'bun4.jpg'),
('Bunaken', 'bun5.jpg'),
('Gili Trawangan', 'giltraw1.jpg'),
('Gili Trawangan', 'giltraw2.jpg'),
('Gili Trawangan', 'giltraw3.jpg'),
('Gili Trawangan', 'giltraw4.jpg'),
('Gili Trawangan', 'giltraw5.jpg'),
('Gunung Maras', 'gm1.jpg'),
('Gunung Maras', 'gm2.jpg'),
('Gunung Maras', 'gm3.jpg'),
('Gunung Maras', 'gm4.jpg'),
('Gunung Maras', 'gm5.jpg'),
('Jimbaran', 'jimb1.JPG'),
('Jimbaran', 'jimb2.jpg'),
('Jimbaran', 'jimb3.jpg'),
('Jimbaran', 'jimb4.jpg'),
('Jimbaran', 'jimb5.jpg'),
('Kota Air Muara Teweh', 'kamt1.jpg'),
('Kota Air Muara Teweh', 'kamt2.jpg'),
('Kota Air Muara Teweh', 'kamt3.jpg'),
('Kota Air Muara Teweh', 'kamt4.jpg'),
('Kota Air Muara Teweh', 'kamt5.jpg'),
('Lhok Seudu', 'lhok1.jpg'),
('Lhok Seudu', 'lhok2.jpg'),
('Lhok Seudu', 'lhok3.jpg'),
('Lhok Seudu', 'lhok4.jpg'),
('Lhok Seudu', 'lhok5.jpg'),
('Loh Liang', 'lohli1.jpg'),
('Loh Liang', 'lohli2.jpg'),
('Loh Liang', 'lohli3.jpg'),
('Loh Liang', 'lohli4.jpg'),
('Loh Liang', 'lohli5.jpg'),
('Pulau Harapan', 'ph1.jpg'),
('Pulau Harapan', 'ph2.jpg'),
('Pulau Harapan', 'ph3.jpg'),
('Pulau Harapan', 'ph4.jpg'),
('Pulau Harapan', 'ph5.jpg'),
('Pulau Kakaban', 'kakaban1.jpg'),
('Pulau Kakaban', 'kakaban2.jpg'),
('Pulau Kakaban', 'kakaban3.jpg'),
('Pulau Kakaban', 'kakaban4.jpg'),
('Pulau Kakaban', 'kakaban5.jpg'),
('Pulau Penyengat', 'pp1.JPG'),
('Pulau Penyengat', 'pp2.jpg'),
('Pulau Penyengat', 'pp3.jpg'),
('Pulau Penyengat', 'pp4.jpg'),
('Pulau Penyengat', 'pp5.JPG'),
('Pulau Randayan', 'pr1.JPG'),
('Pulau Randayan', 'pr2.jpg'),
('Pulau Randayan', 'pr3.JPG'),
('Pulau Randayan', 'pr4.jpg'),
('Pulau Randayan', 'pr5.JPG'),
('Pulau Samalona', 'ps1.jpg'),
('Pulau Samalona', 'ps2.JPG'),
('Pulau Samalona', 'ps3.jpg'),
('Pulau Samalona', 'ps4.jpg'),
('Pulau Samalona', 'ps5.jpg'),
('Raja Ampat', 'ra1.jpg'),
('Raja Ampat', 'ra2.jpg'),
('Raja Ampat', 'ra3.jpg'),
('Raja Ampat', 'ra4.jpg'),
('Raja Ampat', 'ra5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE IF NOT EXISTS `wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(30) NOT NULL,
  `url` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `nama`, `url`, `username`) VALUES
(1, 'candi', 'IMG-20120210-00278.jpg', 'sipuji'),
(2, 'lapangan', 'lapangan.jpg', 'nikenafc');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_2` FOREIGN KEY (`username`) REFERENCES `pengunjungterdaftar` (`username`);

--
-- Constraints for table `container`
--
ALTER TABLE `container`
  ADD CONSTRAINT `container_ibfk_1` FOREIGN KEY (`username`) REFERENCES `pengguna` (`username`),
  ADD CONSTRAINT `container_ibfk_2` FOREIGN KEY (`namadaerah`) REFERENCES `infonesia` (`namadaerah`);

--
-- Constraints for table `forum`
--
ALTER TABLE `forum`
  ADD CONSTRAINT `FK_forum_forum` FOREIGN KEY (`parent_id`) REFERENCES `forum` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `foto_ibfk_1` FOREIGN KEY (`username`) REFERENCES `profil` (`username`),
  ADD CONSTRAINT `foto_ibfk_2` FOREIGN KEY (`profil_id`) REFERENCES `profil` (`id`);

--
-- Constraints for table `infonesia`
--
ALTER TABLE `infonesia`
  ADD CONSTRAINT `infonesia_ibfk_1` FOREIGN KEY (`username`) REFERENCES `admin` (`username`);

--
-- Constraints for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD CONSTRAINT `pengguna_ibfk_2` FOREIGN KEY (`username`) REFERENCES `pengunjungterdaftar` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penginapan`
--
ALTER TABLE `penginapan`
  ADD CONSTRAINT `penginapan_ibfk_1` FOREIGN KEY (`namadaerah`) REFERENCES `infonesia` (`namadaerah`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_12` FOREIGN KEY (`authorUsername`) REFERENCES `pengunjungterdaftar` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `post_ibfk_15` FOREIGN KEY (`authorUsername`) REFERENCES `pengunjungterdaftar` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_ibfk_16` FOREIGN KEY (`thread_id`) REFERENCES `thread` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profil`
--
ALTER TABLE `profil`
  ADD CONSTRAINT `profil_ibfk_2` FOREIGN KEY (`username`) REFERENCES `pengguna` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`namadaerah`) REFERENCES `infonesia` (`namadaerah`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`username`) REFERENCES `pengguna` (`username`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`username`) REFERENCES `pengguna` (`username`);

--
-- Constraints for table `tempatmakan`
--
ALTER TABLE `tempatmakan`
  ADD CONSTRAINT `tempatmakan_ibfk_1` FOREIGN KEY (`namadaerah`) REFERENCES `infonesia` (`namadaerah`);

--
-- Constraints for table `thread`
--
ALTER TABLE `thread`
  ADD CONSTRAINT `FK_thread_forum` FOREIGN KEY (`forum_id`) REFERENCES `forum` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `urlpic`
--
ALTER TABLE `urlpic`
  ADD CONSTRAINT `urlpic_ibfk_1` FOREIGN KEY (`namadaerah`) REFERENCES `infonesia` (`namadaerah`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`username`) REFERENCES `pengguna` (`username`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
