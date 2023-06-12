-- Adminer 4.8.1 MySQL 8.0.32 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `alembic_version` (`version_num`) VALUES
('fb04ed2873ef');

DROP TABLE IF EXISTS `contact_us`;
CREATE TABLE `contact_us` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `emanetler`;
CREATE TABLE `emanetler` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `muddeti` varchar(25) DEFAULT NULL,
  `faizderecesi` varchar(25) DEFAULT NULL,
  `valyuta` varchar(25) DEFAULT NULL,
  `image` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `emanetler` (`id`, `name`, `description`, `muddeti`, `faizderecesi`, `valyuta`, `image`) VALUES
(1,	'Universal əmanət',	'“Universal əmanət” ilə əmanət şərtlərini sərbəst şəkildə seçin və əlavə gəlir qazanın!',	'36 ayadək',	'11.30%',	'AZN/USD',	'../static/upload/xezine.png'),
(2,	'Uşaq yığım əmanəti',	'Uşaq yığım əmanəti ilə faizlərinizə faiz qazandırın və sürətlə artan məbləğlə övladınızın gələcəyini',	'216 ayadək',	'5%',	'AZN / USD',	'../static/upload/usaqyigimi.png');

DROP TABLE IF EXISTS `emanetsorgu`;
CREATE TABLE `emanetsorgu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ad` varchar(100) DEFAULT NULL,
  `soyad` varchar(100) DEFAULT NULL,
  `nomre` varchar(100) DEFAULT NULL,
  `deposit` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `kampaniyalar`;
CREATE TABLE `kampaniyalar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `date` varchar(25) DEFAULT NULL,
  `date1` varchar(25) DEFAULT NULL,
  `date2` varchar(25) DEFAULT NULL,
  `comment` text,
  `image` text,
  `kategori` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `kampaniyalar` (`id`, `name`, `date`, `date1`, `date2`, `comment`, `image`, `kategori`) VALUES
(1,	'Hər ödənişdə Mastercard müştərilərinə özəl 3 AZN bonus!',	' 30 İyun-a qədər',	'3 İyun 2023',	'30 İyun 2023',	'Mastercard kartınızla \"Asan xidmət\"də keşbek qazanmaq şansına sahibsiniz!\r\n\r\n30.06.2023 tarixinə qədər Mastercard kartınızla Asan Xidmət mərkəzlərində \"Tezödə\" ilə ödəniş edərək 3 AZN keşbek qazana bilərsiniz. Bunun üçün sadəcə tezödə sistemində qeydiyyatdan keçmək kifayətdir.\r\n\r\nÖdənişlər FİN-ə bağlı şəkildə, tam təmassız icra edilir.\r\n\r\nTezödə haqqında daha ətraflı: https://tezode.az/  ',	'../static/upload/kompkompaniyalar.webp',	'kart');

DROP TABLE IF EXISTS `kartlar`;
CREATE TABLE `kartlar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kartadi` varchar(100) DEFAULT NULL,
  `securty` varchar(100) DEFAULT NULL,
  `expires` varchar(100) DEFAULT NULL,
  `number` varchar(100) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `kartlar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `kartlar` (`id`, `kartadi`, `securty`, `expires`, `number`, `user_id`) VALUES
(1,	'Elnur Haciyev',	'414',	'12/12',	'4169 7388 5155 3169',	1),
(2,	'Haciyev Nicat',	'514',	'06/11',	'4169 7388 7882 5994',	2);

DROP TABLE IF EXISTS `onlinenovbe`;
CREATE TABLE `onlinenovbe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filial` varchar(100) DEFAULT NULL,
  `xidmet_novu` varchar(100) DEFAULT NULL,
  `tarix` varchar(100) DEFAULT NULL,
  `vaxt` varchar(100) DEFAULT NULL,
  `mobil_nomre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `slider1`;
CREATE TABLE `slider1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `meblegi` varchar(25) DEFAULT NULL,
  `faizderecesi` varchar(25) DEFAULT NULL,
  `muddeti` varchar(25) DEFAULT NULL,
  `image` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `slider1` (`id`, `name`, `description`, `meblegi`, `faizderecesi`, `muddeti`, `image`) VALUES
(1,	'Nağd pul krediti',	'Bütün ehtiyaclar üçün nağd pul krediti',	'30 000 AZN',	'12%-dən',	'48 aya qədər',	'../static/upload/287211137-390228146405222-2435774707310499160-n.png');

DROP TABLE IF EXISTS `slider2`;
CREATE TABLE `slider2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `nagdlasdirma` varchar(25) DEFAULT NULL,
  `guzes` varchar(25) DEFAULT NULL,
  `kartlimit` varchar(25) DEFAULT NULL,
  `image` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `slider2` (`id`, `name`, `nagdlasdirma`, `guzes`, `kartlimit`, `image`) VALUES
(1,	'Kartmane Kredit kartı',	'100%',	'100 gün',	'200 - 15 000 AZN',	'../static/upload/kredit-sayt-banner.png');

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `fin` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `cins` varchar(100) DEFAULT NULL,
  `unvan` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `user` (`id`, `username`, `email`, `name`, `last_name`, `phone`, `fin`, `password`, `cins`, `unvan`, `is_active`, `is_superuser`) VALUES
(1,	'haciyevelnur',	'kg4209697@gmail.com',	'Elnur',	'Haciyev',	'515400979',	'7QW6722',	'pbkdf2:sha256:600000$SF3jNgQjuh3Kfcy9$d5fe5b958bac7395765379c6b018f4a6fc99adc293211b95580e617d1e030a8c',	'Kişi',	'Baku, Azerbaycan',	1,	1),
(2,	'nicathaciyev',	'nicat.haciyev1535@gmail.com',	'Nicat',	'Haciyev',	'517899909',	'1234567',	'pbkdf2:sha256:600000$Lz1bQU8Wr2uVvILV$21363fa992027fe9c490978b98f2af50244106621573e5d3f2aca9bbfafa95b6',	'Kişi',	'Azerbaycan, Baku',	1,	1);

DROP TABLE IF EXISTS `xeberler`;
CREATE TABLE `xeberler` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `comment` text,
  `image` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `image4` varchar(255) DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `xeberler` (`id`, `description`, `date`, `comment`, `image`, `image2`, `image3`, `image4`, `kategori`) VALUES
(2,	'Rabitəbank-la İTFC arasında 10 milyon dollarlıq müqavilə imzalandı!',	'18 May, 2023',	'Rabitəbank-ın İdarə Heyətinin sədri Aydın Hüseynov Səudiyyə Ərəbistanı Krallığının Ciddə şəhərində İslam İnkişaf Bankının (İİB) “Böhranlara Qarşı Mübarizə üçün Tərəfdaşlıqlar” mövzusunda 48-ci İllik Toplantısında iştirak edib.\r\n\r\nTədbir çərçivəsində İİB-in prezidenti Məhəmməd Süleyman Əl-Casir Bankla əməkdaşlığın yüksək qiymətləndirildiyini vurğulayaraq, həyata keçirilən birgə layihələrin ölkəmizdə iqtisadiyyatın, o cümlədən infrastrukturun inkişafı baxımından önəmini qeyd edib, əməkdaşlığın genişləndirilməsi, yaxın gələcəkdə həyata keçiriləcək layihələrdə Bankın böyük maraq göstərdiyini bildirib.\r\n\r\nToplantı çərçivəsində Rabitəbank ilə Ticarətin Maliyyələşdirilməsi üzrə Beynəlxalq İslam Korporasiyası (İTFC) arasında 10 mln USD məbləğində “Letter of Credit Confirmation Facility” (Akkreditiv) müqaviləsi imzalanmışdır. Müqavilə bir tərəfdən “Rabitəbank” ASC-nin İdarə Heyətinin sədri Aydın Hüseynov, digər tərəfdən isə İslam İnkişaf Bankı Qrupuna daxil olan Ticarətin Maliyyələşdirilməsi üzrə Beynəlxalq İslam Korporasiyası (İTFC) rəhbəri və Özəl Sektorun İnkişafı üzrə İslam Korporasiyasının baş direktoru vəzifələrini icra edən Hani Salem Sonbol arasında bağlanıb.\r\n\r\nTərəflər Azərbaycanın ölkə iqtisadiyyatının inkişafı istiqamətində İTFC ilə əməkdaşlıq, eləcə də ticarətin maliyyələşdirilməsi, kiçik və orta biznesə dəstək imkanlarının genişləndirilməsi, Azərbaycanın ixrac potensialının gücləndirilməsində və İslam maliyyəsinin tətbiqində Korporasiyanın roluna diqqət ayıraraq, bu istiqamətdə atılacaq növbəti birgə addımlarında dair geniş müzakirələr aparıb.\r\n\r\nQeyd edək ki, İslam İnkişaf Bankının (İİB) ənənəvi şəkildə keçirdiyi İllik görüşlər inkişaf məsələlərini və iqtisadi məqsədləri müzakirə etmək üçün beynəlxalq və regional təşkilatların müşahidəçiləri ilə yanaşı qrupun 57 üzv ölkəsindən nümayəndə heyətlərini bir araya gətirir. Görüşlərə adətən 2000-dən çox dövlət rəsmisi, yüksək səviyyəli dövlət xadimləri, beynəlxalq təşkilatların nümayəndələri və ekspertlər iştirak edir.\r\n\r\nBuilki görüşlər İİB qrupuna üzv ölkələrin üzləşdiyi problemləri müzakirə etmək və mövcud və potensial imkanları araşdırmaq üçün nəzərdə tutulub.',	'../static/upload/2333333.png',	'../static/upload/xeberlerdetal.jpg',	'../static/upload/20.png',	'../static/upload/21.png',	'maliye'),
(3,	'İndi daha çox ölkələrə Card to Card edə bilərsən!',	'15 May, 2023',	'Rabita Mobile-da Card to Card köçürmələrində ölkələrin sayı daha da çoxaldı! Belə ki, artıq Kartmane Visa və Mastercard sahibləri tətbiqdə İsrail, Birləşmiş Ərəb Əmirlikləri, Böyük Britaniya, Kanada, Səudiyyə Ərəbistan və daha 25 yeni ölkəyə rahatlıqla pul köçürə bilər! Tətbiqi yüklə, sən də faydalan! ',	'../static/upload/xeber2.webp',	'../static/upload/xeber-2.webp',	'',	'',	'sosial'),
(4,	'Rabitəbankın İnternet Bankçılıq xidmətindən yenilik!',	'6 Aprel, 2023',	'Rabitəbank İnternet Bankçılıq xidmətlərinə üstünlük verən müştəriləri üçün məhsuluna yeniliklər əlavə edib.\r\n\r\nBelə ki, İnternet Bankçılıq xidmətinə yeni “Sənəd dövriyyəsi” bölməsi əlavə edilib. Burada hər bir məhsul üzrə tələb olunan sənədlər kateqoriyalara bölünüb və hər bir kateqoriya üzrə tələb olunan sənədlər öz hissəsində görünür. Sənəd dövriyyəsi bölməsində müştərilər imzalanmalı olan sənədlərini görür və Asan imza ilə tək – tək və ya toplu şəkildə sənədləri imzalayırlar. Bu bölmə həmçinin “Göndərilmiş sənədlər” “Tələb olunan sənədlər” və “Qəbul edilmiş sənədlər” kimi funksiyları da özündə birləşdirir.\r\n\r\nYeniliklər bununla da yekunlaşmır: Qarantiya sifarişi bölməsinə “Təminat” seçimi əlavə olunub. Burada əmlak seçimi və ya hesabda nəğd vəsait qarant kimi seçilə bilər.\r\n\r\n“Kredit sifarişi” bölməsinə isə əlavə olaraq “Sifarişlərin maliyyələşdirilməsi” və “İnvoysların maliyyələşdirilməsi” funksiyaları əlavə olunub.\r\n\r\n“Rabitəbank” ASC Azərbaycanın 16 regionu və Bakı şəhərində 27 xidmət məntəqəsi və 74 ATM-i, “Rabita Mobile” tətbiqi, İnternet Bankçılıq platforması və “RabitaBot” çatbotu, 133 nömrəli Çağrı Mərkəzi ilə müştərilərin xidmətindədir.',	'https://www.rabitabank.com/resized/fit250x200/center/pages/2533/34.jpg',	'https://www.rabitabank.com/resized/fit1012x220/center/pages/2533/74837828-3076816889001818-6001468307914358784-n.jpg',	'',	'',	'iqtisadi'),
(5,	'Ümummilli lider Heydər Əliyevin anadan olmasının 100-cü ildönümü münasibətilə ağacəkmə aksiyası həya',	'15 Mart, 2023',	'Rabitəbank rəhbərliyi və əməkdaşları Ümummilli lider Heydər Əliyevin anadan olmasının 100-cü ildönümü münasibətilə həyata keçirilən ağacəkmə aksiyasında iştirak edərək öz töhfələrini verib.\r\n\r\n15 Mart 2023-cü il tarixində Müşfiqabad qəsəbəsində baş tutan aksiya Azərbaycan Respublikasının Mərkəzi Bankı, Ekologiya və Təbii Sərvətlər Nazirliyi, Azərbaycan Banklar Assosiasiyası, Sığortaçılar Assosiasiyası, Mikromaliyyə Assosiasiyası, Fond Bazarı İştirakçıları Assosiasiyası və Fintex Assosiasiyası arasında “Ümummilli lider Heydər Əliyevin anadan olmasının 100-cü ildönümü münasibəti ilə ağacəkmə tədbirləri üzrə əməkdaşlığa dair Anlaşma Memorandumu”una əsasən həyata keçirilmişdir. Aksiyanın məqsədi Ümummilli lider Heydər Əliyevin anadan olmasının 100-cü ildönümü münasibətilə bu ildən başlayaraq 10 il ərzində  bir milyon ağacın əkilməsi ilə bağlı müvafiq işlərin görülməsidir.',	'https://www.rabitabank.com/resized/fit250x200/center/pages/2513/333358240-1295655904638153-9186416111637013955-n.jpg',	'https://www.rabitabank.com/resized/fit1012x220/center/pages/2513/uiop.jpg',	'',	'',	'sosial'),
(6,	'Aqrar maliyyələşmə sahəsində yeni innovativ məhsullar təqdim edən bank!',	'1 Fevral, 2023',	'Rabitəbank  “Aqrar maliyyələşmə sahəsində yeni innovativ məhsullar təqdim edən bank!” mükafatına layiq görülüb.\r\n\r\nBugün Kənd Təsərrüfatı Nazirliyi yanında fəaliyyət göstərən Aqrar Kredit və İnkişaf Agentliyinin (AKİA) təşkilatçılığı ilə keçirilən II Aqrobiznesin İnkişafı Forumunda Rabitəbank “Aqrar maliyyələşmə sahəsində yeni innovativ məhsullar təqdim edən bank!” mükafatına layiq görülüb.\r\n\r\nQeyd edək ki, ölkəmizdə sahibkarlığın inkişafına dəstək göstərən və kənd təsərrüfatının inkişafı üçün daima innovativ məhsullar təqdim edən Rabitəbank Aqrar Kredit və İnkişaf Agentliyi, Sahibkarlığın İnkişafı Fondu və İpoteka və Kredit Zəmanət fondu ilə əməkdaşlıq edən öncül banklardandır.\r\n\r\nForumda dövlət və özəl qurumlarının rəsmiləri, həmçinin yerli və beynəlxalq təşkilatların nümayəndələri iştirak ediblər.\r\n\r\nForumun keçirilməsində məqsəd ölkədə aqrobiznesin inkişafında rolu olan tərəfləri bir araya gətirməklə beynəlxalq və yerli təcrübəni, mövcud vəziyyəti, imkanları, o cümlədən aqrobiznesə maliyyə dəstəyi və dövlət güzəştlərindən daha çox fermer-sahibkarın faydalanması üçün lazım olan addımları müzakirə etməkdir. ',	'https://www.rabitabank.com/resized/fit250x200/center/pages/2464/s2.png',	'https://www.rabitabank.com/resized/fit1012x220/center/pages/2464/s1.png',	'',	'',	'maliye'),
(7,	'“Rabitəbank” ASC-nin sponsorluğu ilə çap edilən “Maliyyə İqtisadiyyatı” kitabı təqdim edildi.',	'25 Yanvar, 2023',	'Maliyyə savadlılığının artırılmasının daim dəstəkçilərindən biri kimi çıxış edən “Rabitəbank” ASC-nin sponsorluğu və “Azərbaycan Dövlət İqtisad Universitetinin” təşkilatçılığı ilə Prof. Zahid Fərrux Məmmədov və Dos. Dr. Aydın Hüseynovun birgə müəllifliyi ilə ərsəyə gələn “Maliyyə İqtisadiyyatı” kitabının təqdimatı baş tutub. Kitabın elmi redaktoru İqtisad Universitetinin rektoru, professor Ədalət Muradov, məsləhətçisi Azərbaycan Banklar Assosiasiyasının (ABA) rəhbəri Zakir Nuriyevdir.\r\n\r\nTəqdimat mərasimində Milli Məclisin komitə sədri Sadiq Qurbanov, professor Ədalət Muradov, Rabitəbankın Müşahidə Şurasının sədri, ABA-nın rəhbəri Zakir Nuriyev, dövlət və özəl qurumların rəhbərləri, professor və müəllimlər iştirak ediblər.\r\n\r\nÇıxış üçün söz verilən Ə.Muradov müasir tələblərə cavab verən nəzəri və praktiki biliklərin tələbələrə balanslı şəkildə ötürülməsində “Maliyyə iqtisadiyyatı” kitabının mühüm rol oynayacağından əminliyini ifadə edib.\r\n\r\nRabitəbankın Müşahidə Şurasının sədri, ABA-nın rəhbəri Zakir Nuriyev müasir çağırışlara cavab verən kitabın sadə və anlaşılan dildə yazılmasının tələbələr üçün önəmini vurğulayıb. O, tələbələrin maliyyə sahəsi üzrə bilik və bacarıqlarının artırılmasında kitabın özünəməxsus töhfələr qazandıracağını bildirib.\r\n\r\nMilli Məclisin Komitə sədri Sadiq Qurbanlı kitabın ərsəyə gəlməsində əməyi olan hər kəsə təşəkkürünü bildirərək, orijinallığı ilə fərqlənən kitabın maliyyə və bankçılıq sahəsi üzrə qiymətli əsər olduğunu bildirib.\r\n\r\nRabitəbankın İdarə Heyətinin sədri, dosent Aydın Hüseynov universitet-sənaye əməkdaşlığı nəticəsində ərsəyə gələn kitabdakı mövzuların hazırlanması prosesində beynəlxalq təcrübədən istifadə olunduğunu, anlayışların izahlı şərhinin isə müasir Azərbaycan bank sisteminin təcrübəsinə əsaslanaraq verildiyini deyib.\r\n\r\nTəqdimat Dövlət Vergi Xidmətinin Tədris Mərkəzinin rəis müavini Mirəli Kazımov, BDU-nun kafedra müdiri, professor Kamil Səlimov və digər iştirakçıların çıxışları ilə davam edib.\r\n\r\n“Rabitəbank” ASC Azərbaycanın 16 regionu və Bakı şəhərində 27 xidmət məntəqəsi və 74 ATM-i, “Rabita Mobile” tətbiqi, İnternet Bankçılıq platforması və “RabitaBot” çatbotu, 133 nömrəli Çağrı Mərkəzi ilə müştərilərin xidmətindədir.',	'https://www.rabitabank.com/resized/fit250x200/center/pages/2440/untitled-1.png',	'https://www.rabitabank.com/resized/fit1012x220/center/pages/2440/unec-sayt.png',	'',	'',	'maliye'),
(8,	'Rabitəbank “Müştəri təmsilçisi” layihəsini yekunlaşdırıb.',	'25 Fevral, 2022',	'Sizə daha yaxşı xidmət etmək üçün əməkdaşlarımız universallaşdı!\r\n\r\nRabitəbank “Müştəri təmsilçisi” layihəsini yekunlaşdırıb. Layihə direktor, rəhbər, menecer və ekspertlərin mentorluğu ilə 5 həftəlik əsas təlimləri əhatə edir. Təlimlərdə əməliyyat və kredit sahəsi üzrə ümumi 225 əməkdaş iştirak edib.\r\n\r\nTəlim proqramını tamamlamış əməkdaşlar artıq universal işçi kimi yetişərək “Müştəri təmsilçisi” sertifikatları ilə təmin olunublar.',	'https://www.rabitabank.com/resized/fit250x200/center/pages/88/news1-0.jpg',	'https://www.rabitabank.com/resized/fit1012x220/center/pages/88/news-banner-1.jpg',	'',	'',	'investisiya'),
(9,	'Rabitəbank dünyanın öndə gedən “SIBOS 2022” maliyyə konfransında iştirak edir.',	'11 Oktyabr, 2022',	'“Rabitəbank” ASC-nin rəhbərlərliyi Amsterdam şəhərində baş tutan “SIBOS-2022” beynəlxalq maliyyə sərgi-konfransında iştirak edirlər.\r\n\r\n \r\n\r\nHər zaman müasir beynəlxalq təcrübələrə yiyələnən Rabitəbank, bu dəfə beynəlxalq əlaqələrini genişləndirmək, müxbir bank şəbəkəsini artırmaq, öndə gedən rəqəmsal həlləri izləmək üçün tədbirdə geniş tərkibdə iştirak edir.\r\n\r\nSərgi-konfransda Rabitəbank-ın təmsilçiləri bankın İdarə Heyətinin sədri Aydın Hüseynov, Baş Direktorlar – Ziya Nuriyev və Ramil Nəsibovdur.\r\n\r\n \r\n\r\n4 gün davam edəcək konfransda bankın təmsilçiləri qlobal maliyyə institutlarının nümayəndələri ilə mühim görüşlər təşkil edib, rəqəmsal bankçılıq, maliyyə texnologiyaları və müxbir hesabları sahəsində əlaqələrinin genişləndirilməsi ilə bağlı fikir mübadiləsi və təcrübə bölgüsü edəcəklər. Həmçinin, Aydın Hüseynov bildirib ki, “görüşdə mümkün əməkdaşlıq perspektivlərinin müzakirəsi aparılaraq beynəlxalq əlaqələlərimizi genişləndirməklə, təcrübələri ölkəmizdə tətbiq etməyi planlayırıq.”\r\n\r\n \r\n\r\nHər il ənənəvi olaraq keçirilən SIBOS, bu həftə 9300-dən çox iştirakçını bir araya gətirib. 1978-ci ildə bank əməliyyatları seminarı kimi başlayan tədbir, qlobal maliyyə sektorları üçün ödənişlər, qiymətli kağızlar, pul vəsaitlərinin idarə edilməsi sahələrində müzakirələr və əməkdaşlıq etmək üçün əsas biznes foruma çevrilib.\r\n\r\n \r\n\r\nBu ilki “SIBOS” konfransının təşkilatçısı Ümumdünya Banklararası Maliyyə Telekommunikasiya Cəmiyyəti (SWIFT)-dir.\r\n\r\n \r\n\r\n\"Rabitəbank\" ASC, Azərbaycanın 16 regionu və Bakı şəhərində 27 xidmət məntəqəsi və 74 ATM-i, \"Rabita Mobile\" tətbiqi, İnternet Bankçılıq platforması və \"RabitaBot\" çatbotu, 133 nömrəli Çağrı Mərkəzi ilə müştərilərin xidmətindədir.',	'https://www.rabitabank.com/resized/fit250x200/center/pages/2243/amsterdam-konfrans-press.png',	'https://www.rabitabank.com/resized/fit1012x220/center/pages/2243/310647883-449140450616203-516652144137384984-n.png',	'',	'',	'maliye'),
(10,	'Android-lilər üçün şad xəbər: Google Pay indi Rabitəbank kartları üçün də aktivdir!',	'23 Avqust, 2022',	'Bu gündən etibarən Rabitəbank müştəriləri həm Android, həm də WearOS cihazlarında “Google Pay” xidmətindən istifadə edə biləcəklər. “Google Pay”, istifadəçilərə mağazalarda (təmassız ödənişlərin aktiv olduğu), tətbiqetmələrdə və internet üzərindən təhlükəsiz alış-veriş etmək imkanı yaradır.\r\n \r\nBir neçə ay öncə Apple Pay ödəmə üsulunu  müştərilərinə təqdim edən “Rabitəbank” ASC, bu dəfə sevindirici xəbəri Android əməliyyat sistemli elektron cihaz istifadə edən müştərilərinə çatdırır. Artıq fiziki kartla ödəniş dövrü geridə qaldı! Bankın müştəriləri mobil cihaz vasitəsilə təmassız ödənişin üstünlüklərindən yararlanacaqlar.\r\n \r\nTəhlükəsizlik və məxfilik Google Pay və Google Wallet-in əsas üstünlükləridir ki, bu da çoxsaylı təhlükəsizlik təbəqələri ilə ödənişləri daha təhlükəsiz edir. Ödəniş etmək istədiyiniz yerdə təmassız ödəniş işarəsini görməyiniz kifayətdir ki, elektron cihazınızı POS-terminala yaxınlaşdıraraq ödənişi tamamlaya bilərsiniz. Google Pay-ə qoşulmaq üçün elektron cihazınıza “Google Wallet” tətbiqetməsini yükləyin, növbəti addımda + (üstəgəl) işarəsini basıb, oradakı təlimatlara əsasən Rabitəbank kredit və ya debet kartınızı əlavə etməyiniz kifayətdir.\r\n \r\nBununla yanaşı, müştərilər Google Pay vasitəsilə WearOS cihazlarına yüklənmiş tətbiqlərdə və ya internet brauzerlərində açılmış saytlarda rahat və ani alış-veriş edə bilərlər. Beləliklə, artıq qeydiyyatdan keçməyə və uzun məlumat formalarını doldurmağa ehtiyac qalmır.\r\n \r\nQeyd edək ki, Google Wallet-dən istifadə üçün telefonda Android 6.0 və daha yuxarı yeniləmə olmağı kifayətdir. Google Pay ailəsinə qoşulmuş müştərilər Rabitəbank-ın öz kart istifadəçilərinə təklif etdiyi keşbek bonusu və endirimlərdən yararlanmağa həmişəki qaydada davam edəcəklər.\r\n \r\n\"Rabitəbank\" ASC, Azərbaycanın 16 regionu və Bakı şəhərində 27 xidmət məntəqəsi və 74 ATM-i, \"Rabita Mobile\" tətbiqi, İnternet Bankçılıq platforması və \"RabitaBot\" çatbotu, 133 nömrəli Çağrı Mərkəzi ilə müştərilərin xidmətindədir.',	'https://www.rabitabank.com/resized/fit250x200/center/pages/2139/xeber-icover-1.png',	'https://www.rabitabank.com/resized/fit1012x220/center/pages/2139/xeber-ich.png',	'',	'',	'maliye'),
(11,	'Rabitəbank önəmli maliyyə institutundan böyük məbləğdə kredit cəlb edib',	'7 İyul, 2022',	'İyunun 24-də Azərbaycanın sədrliyi ilə Four Seasons oteldə Qara Dəniz Ticarət və İnkişaf Bankının (QDTİB) Rəhbərlər Şurasının 24-cü illik toplantısı keçirilmişdir.\r\n\r\n“Dəyişən dünyada diversifikasiyalaşmış və innovativ Azərbaycan iqtisadiyyatının dəstəklənməsində QDTİB-nin rolu” adlı Biznes Forumda “Rabitəbank” ASC və QDTİB arasında kredit müqaviləsi imzalanmışdır.\r\n\r\n \r\n\r\nMemorandum çərçivəsində QDTİB-dən Rabitəbank-a 36 ay müddətinə 10 milyon ABŞ dolları dəyərində kredit xətti cəlb edilmişdir.\r\n\r\n \r\n\r\nRabitəbank-ın İdarə Heyətinin Sədri Dr. Aydın Hüseynov bildirib ki, “Qara Dəniz Ticarət və İnkişaf Bankı” (QDTİB) arasında anlaşmamızın uğurlu və davamlı olacağına inanırıq. Tərəfdaşımız tərəfindən ayrılan 10 milyon dollar maliyyə dəstəyi, kiçik və orta sahibkarlığın (KOB) maliyyələşdirilməsi, qeyri-neft sektorunun davamlı inkişafı yolunda biznes mühitinin yaxşılaşdırılması, eləcə də idxal və ixrac əməliyyatlarının maliyyələşməsi üçün kifayət qədər imkanlar yaradacaq”.\r\n\r\n \r\n\r\nQDTİB-in prezidenti Dmitri Pankin Bakıda keçirilən QDTİB Biznes Forumunda imzalanmış sazişi şərh edərkən deyib: “KOB-lar Azərbaycan iqtisadiyyatının qeyri-neft sektorunda artımın əsas mənbəyini təşkil edir. İqtisadiyyatın bu mühüm seqmentinin inkişafına dəstəyimizi genişləndirmək və kiçik biznesə məşğulluq yaratmaq, ixrac potensialında rəqabət qabiliyyətini artırmaq və digər yollarla ölkədə iqtisadi artımı dəstəkləmək üçün Rabitəbank ilə bir araya gəlməkdən məmnunuq”.\r\n\r\n \r\n\r\nQeyd edək ki, hazırda QDTİB-in elan olunmuş kapitalı 3,45 milyard avro, abunə olunmuş kapitalı 2,289 milyard avro, ödənilmiş kapitalı isə 0,687 milyard avrodur.',	'https://www.rabitabank.com/resized/fit250x200/center/pages/2068/bannerblacksea.png',	'https://www.rabitabank.com/resized/fit1012x220/center/pages/2068/bannerblacksea-0.png',	'',	'',	'maliye'),
(12,	'Kartmane Debet kartı istifadəçilərinə yeni ilin ilk hədiyyəsi Rabitəbank-dan gəlir!',	'19 Dekabr, 2022',	'Yeni ilə məxsus olaraq möhtəşəm keşbek kampaniyamızı elan edirik!\r\n\r\nKampaniyanın şərtləri:\r\n\r\n19.12.2022-31.12.2022 arasında sifariş edəcəyiniz kartın 01.01.2023-31.01.2023-ci il aralığında qazandıracağı keşbekə 23% keşbek əlavə olunacaq.(23 AZN-dək)\r\nHəmçinin 01.01.2023-31.01.2023 il arasında sifariş edəcəyiniz  kartın 01.02.2023-28.02.2023-ci il aralığında qazandıracağı keşbekə 23% əlavə ediləcək.(23 AZN-dək)\r\nKeşbek 1, Keşbek 2, Keşbek 3, Xarici valyuta növlərində hesablanacaq maksimum bal- 23 bal (1bal=1AZN/USD/EUR);\r\n\r\nKeşbek 4 növü üzrə hesablanacaq maksimum bal-1150 bal;\r\nKeşbek 5 növü üzrə hesablanacaq maksimum mil-1150 mil.\r\n01.01.2023-31.01.2023 arasında qazanılan əlavə keşbek 10.02.2023-ci ilə qədər, 01.02.2023-28.02.2023 arasında qazanılmış əlavə keşbek isə 10.03.2023-ci il tarixinə qədər hesabınıza əlavə ediləcək.',	'https://www.rabitabank.com/resized/fit250x200/center/pages/2389/xeber-banner-ust-2.jpg',	'https://www.rabitabank.com/resized/fit1012x220/center/pages/2389/xeber-content-banner-new.jpg',	'',	'',	'sosial'),
(13,	'“Rəqəmsal dünyada jurnalistika” layihəsinin iştirakçılarına sertifikatlar təqdim edildi!',	'27 Dekabr, 2022',	'“Azərbaycan Jurnalistlər Şəbəkəsi” İB-nin təşkilatçılığı və “Rabitəbank” ASC-nin dəstəyi ilə keçirilən “Rəqəmsal dünyada jurnalistika” layihəsi başa çatıb. İki ay davam edən layihəni uğurla başa vuran iştirakçılara sertifikatlar təqdim olunub.\r\n\r\n“Rəqəmsal dünyada jurnalistika” layihəsi çərçivəsində iki ay müddətində jurnalistikaya marağı olan və bu sahədə fəaliyyət göstərmək istəyən gənclər üçün silsilə təlim sessiyaları təşkil olunub.\r\n\r\n“Rabitəbank” ASC-nin binasında keçirilən sertifikatların təqdim olunması mərasimində bankın İdarə Heyəti Sədrinin 1-ci müavini Orhan Gültekin iştirak edib və belə bir layihənin tərəfdaşı olmaqdan məmnunluğunu dilə gətirib. “Rabitəbank ölkəmizdə maliyyə sektorunda rəqəmsal sahənin inkişafı adına yeniliklər etməsi ilə seçilən bir maliyyə təşkilatıdır. Belə bir layihəni dəstəkləməklə jurnalistikaya marağı olan 12 gəncin bu sahədə uğurlar əldə edəcəyinə inanır və ümumilikdə ölkə mediasına bu addımla töhfə verəcəyimizi düşünürük”,-deyə Orhan Gültekin bildirib.\r\n\r\n“Azərbaycan Jurnalistlər Şəbəkəsi” İB-nin sədri Ayaz Mirzəyev çıxışında özəl sektorun medianın inkişafına istiqamətlənmiş bir layihəni dəstəkləməsinin çox təqdirəlayiq bir hal olduğunu deyib. “Rabitəbank kimi rəqəmsal sahədə sürətlə inkişaf edən bir maliyyə qurumunun bizim layihəni dəstəkləməsi bizi çox sevindirir. Bu gün gənc jurnalistlərin yetişdirilməsi prosesinə edilən bu mühüm dəstək mediamızın, eləcə də gənc jurnalistlərimizin yetişməsinə müsbət təsir edəcəyinə inanıram”,- deyə Ayaz Mirzəyev qeyd edib.\r\n\r\nQeyd edək ki, ölkənin tanınmış jurnalistləri və xaricdən dəvət olunmuş ekspertin iştirakı ilə keçirilən təlimlərdə müasir rəqəmsal alətlərdən istifadə edərək məzmun yaradılması, eləcə də biznes xəbərlərinin istehsalına dair müxtəlif bilik və bacarıqlar öyrədilib. Bundan başqa, iştirakçılar bir neçə aparıcı media qurumlarında səfər turlarında iştirak ediblər.\r\n\r\n“Rabitəbank” ASC, Azərbaycanın 16 regionu və Bakı şəhərində 27 xidmət məntəqəsi və 74 ATM-i, “Rabita Mobile” tətbiqi, İnternet Bankçılıq platforması və “RabitaBot” çatbotu, 133 nömrəli Çağrı Mərkəzi ilə müştərilərin xidmətindədir.',	'https://www.rabitabank.com/resized/fit250x200/center/pages/2408/jurnalist-sayt-cover.png',	'https://www.rabitabank.com/resized/fit1012x220/center/pages/2408/jurnalist-sayt.png',	'',	'',	'sosial'),
(14,	'Rabitəbank rəhbərliyi qazi və şəhid ailələri ilə görüş keçirib.',	'17 Noyabr, 2022',	'Rabitəbank rəhbərliyi 1-ci Qarabağ müharibəsində və Vətən müharibəsində iştirak etmiş qazi və şəhid ailələri ilə görüş keçirib. Bankın İdarə Heyəti sədrinin 1-ci müavini Orhan Gültekinin iştirakı ilə keçirilən bu görüşdə Rabitəbank-ın 8 Noyabr – Zəfər günü ilə bağlı hazırladığı videoçarxın əsas qəhrəmanları iştirak edib.\r\n\r\nMəlumat üçün bildirək ki, Rabitəbank-ın 8 Noyabr – Zəfər günü ilə bağlı hazırladığı videoçarx sosial mediada böyük maraqla qarşılanıb. “Ata vəsiyyəti” adlanan videonun əsas süjet xəttini 1-ci Qarabağ müharibəsində qazi olmuş ataların övladlarını necə vətənpərvər ruhda böyütməsi və onların Vətən Müharibəsində torpaqlarımızın işğaldan azad olması üçün göstərdikləri şücaət tərənnüm olunub.\r\n\r\nGörüşdə Ali Baş Komandanın rəhbərliyi ilə Şanlı Ordumuz tərəfindən torpaqlarımızın düşmən tapdağından azad olunmasından, əsgərlərimizin qəhrəmanlıqlarından fəxrlə söhbət açılıb, 30 illik işğala və həsrətə son qoyulduğu bildirilib. \r\n\r\n“Rabitəbank olaraq hər zaman şəhid ailələrinin, Qarabağ qazilərinin yanındayıq, dəstək göstəririk. Bu gün qazanılan zəfərin, bütün ölkənin yaşadığı qürur hissinin başlıca səbəbi sizsiniz. Hər birinizlə fəxr edir, şəhidlərimizi hörmətlə yad edirik.” deyə Orhan Gültekin bildirib.\r\n\r\nBankın rəhbərliyi həmçinin vurğulayıb ki, hər zaman öz dəyərlərinə sadiq qalan Rabitəbank müharibə və sonrakı dövrlərdə şəhid ailələri və qazi olmuş müştərilərinə, eləcə də müharibə iştirakçılarına daima dəstək göstərir.\r\n\r\nGörüşün sonunda “Ata vəsiyyəti” videoçarxında çəkilmiş qəhrəmanlara rəhbərlik tərəfindən qiymətli hədiyyələr təqdim edilmişdir.\r\n\r\nVideoçarxı izləmək üçün: https://rbt.az/zefergunu',	'https://www.rabitabank.com/resized/fit250x200/center/pages/2338/qazi-sayt-cover.png',	'https://www.rabitabank.com/resized/fit1012x220/center/pages/2338/qazi-sayt-0.png',	'',	'',	'sosial'),
(15,	'Rabitəbank rəhbərliyi və Qənirə Paşayeva Nardaranda qızların təhsilinin inkişafı yönündə görüş keçir',	'5 Noyabr, 2022',	'Ötən günlərdə “Rabitəbank” ASC-nin İdarə Heyəti sədrinin 1-ci müavini Orhan Gültekin və Milli Məclisin Mədəniyyət komitəsinin sədri Qənirə Paşayeva Bakının Nardaran qəsəbəsində 130 nömrəli məktəbi ziyarət etmiş, təhsilin inkişafı yönündə məktəblilərlə görüş keçirmişdirlər.\r\n\r\nGörüşün əsas məqsədi məktəblərdə təhsilinin inkişafına dəstək göstərmək, xüsusilə qız uşaqlarının oxumağının önəmi mövzusunda maarifləndirici çıxış etmək və məktəblilərə 400-dən çox kitab hədiyyə etmək olmuşdur.\r\n\r\nStatistikaya görə dünyada 15-19 yaş aralığında olan hər 4 qızdan 1-i işsizdir və təhsil ala bilmir. Bu gün 130 milyon qız uşağı məktəbə gedə bilmir. Pandemiya dövründən sonra isə bu hal gedərək artmağa başladı və hal-hazırda təəssüf ki, say daha çoxdur.\r\n\r\nMəktəblilərlə çox səmimi dialoqa quran Qənirə Paşayeva bildirib ki, “Qız uşaqlarının potensialına inanmalı, onları gələcəyə hazırlamalıyıq. Onlara öz qərarlarını vermə şansı, sevgi, özgüvən və doğru yolu göstərdiyimiz zaman demək ki, düzgün yoldayıq.\r\n\r\nBu gün dünyada yetkinlik yaşına çatmamış 600 milyon qız uşağı var və onların hər biri tarixdə bu günə qədər görülən ən böyük qadın liderlər nəslini yaradacaqlar. Bu isə yalnız bir şərtlə mümkündür; onlara düzgün yön göstərib, seçim şansı verməklə. Əziz məktəblilər, mənim sizə inamım böyükdür, gücünüzü bütün dünyaya göstərin!”\r\n\r\nOrhan Gültekin məktəblilərlə görüşdə onlara belə müraciət edib: “Məktəblilər olaraq özünüzü şanslı hiss etməlisiniz ki, sivil bir cəmiyyətdə əlçatan təhsil və dövlət tərəfindən tam dəstəyi görə bilirsiniz. Mən inanıram ki, gələcəkdə çoxunuz ali təhsil alaraq yüksək vəzifələrdə çalışacaq, səsinizi hər kəsə eşitdirə biləcəksiniz. Qız uşaqlarının daha yaxşı şərtlərdə təhsil almaları üçün Rabitəbank olaraq biz də hər zaman dəstək göstərməyə hazırıq.\r\n\r\nBankımızda xanımlara özəl məhsulumuz var, adı “Güc Xanımlarda”dır. Çünki biz Rabitəbank olaraq həm bank daxilində, həm də cəmiyyətdə xanımların gücünə inanır, gender bərabərliyini dəstəkləyirik. Qadınların karyera həyatında uğurlu olmaları üçün qadınlara özəl güzəştli maliyyə məhsullarımız buna gözəl nümunədir.”',	'https://www.rabitabank.com/resized/fit250x200/bottom-left/pages/2330/sayt-uz.png',	'https://www.rabitabank.com/resized/fit1012x220/center/pages/2330/nardaran-sayt-0.png',	'',	'',	'sosial'),
(16,	'Kartmane kart sahibləri 12.5 milyon manat keşbek qazanıblar',	'12 Oktyabr, 2022',	'Keşbek kartları sırasında bazarda rəqiblərinə meydan oxuyan “Rabitəbank” ASC, müştərilərinin Kartmane kartı ilə alış-verişlərində qazandıqları məbləği açıqlayıb.\r\n\r\nBelə ki, Kartmane kart sahibləri 9 ay ərzində 12.5 milyon manat keşbek əldə ediblər.\r\n\r\n \r\n\r\nRabitəbank açıqlayıb ki, bu məbləğin 6.5 milyon manatı yanacaqdoldurma məntəqələrində olunan ödənişlərə (YDM-lərdə 10% keşbek), təxminən 260 min manatı market və restoranların payına (market-restoranlarda 5% keşbek), 5.6 milyon manat isə hər yerdə olunan ödənişlərə (hər yerdə 2% keşbek) düşür.\r\n\r\nHəmçinin, qazanılan keşbeklər sırasında Azercell keşbekləri və millər də var.\r\n\r\n \r\n\r\nBəs keşbek kartı nədir, hansı üstünlükləri var?\r\n\r\nKeşbek – xərclənən pulun bir hissəsinin bonus şəklində müştərinin xeyrinə qayıtması prosesidir.\r\n\r\nMəsələn, müştəri debet kartı ilə yanacaqdoldurma məntəqəsindən yanacaq doldurur və  ümumi xərci 50 AZN təşkil edir. Bu zaman keşbek kartı tərəfindən müştəriyə qayıdan məbləğ ümumi xərcin 10%-ni təşkil edəcək.\r\n\r\n \r\n\r\nQeyd edək ki, Rabitəbank-ın məhsulu olan Kartmane-nin 5 keşbek növü mövcuddur: YDM (10%), market və restoranlar (5%), bütün ödənişlərdə (2%), Azercell keşbekləri (1 AZN=1 bal) və millər (1 AZN=1 mil).\r\n\r\nMüştəri özünə uyğun keşbek növünü seçməklə, nağdsız ödənişdə xərclədiyi məbləğləri geri qaytara bilər.\r\n\r\n \r\n\r\n500-dən çox tərəfdaşı olan Kartmane ilə edilən alış-verişlərdən 40%-dək keşbek qazanmaq mümkündür.\r\n\r\nTərəfdaşların siyahısını linkdən görə bilərsiniz: https://rbt.az/Terefdas\r\n\r\n \r\n\r\nKartmane kartları haqqında ətraflı məlumat və sifariş üçün https://rbt.az/Kart-Sifaris linkinə keçid edə, 133 Çağrı Mərkəzinə müraciət edə və ya bankın sosial media kanalları üzərindən sorğu göndərə bilərsiniz. Həmçinin bankın filiallarına yaxınlaşaraq sifarişinizi həyata keçirə bilərsiniz.',	'https://www.rabitabank.com/resized/fit250x200/center/pages/2249/125press.png',	'https://www.rabitabank.com/resized/fit1600x900/center/pages/2249/125press.png',	'',	'',	'sosial');

-- 2023-06-12 15:49:07
