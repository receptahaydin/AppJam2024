import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GalataKulesi extends StatefulWidget {
  const GalataKulesi({Key? key}) : super(key: key);

  @override
  State<GalataKulesi> createState() => _GalataKulesiState();
}

class _GalataKulesiState extends State<GalataKulesi> {
  int _selectedIndex = 0; // Track the selected index of segmented button

  @override
  Widget build(BuildContext context) {
    String historyDescription = '''
'Istanbul\\'un en stratejik noktalarından birinde yer alan Galata Kulesi\\'nin ilk olarak ne zaman inşa edildiği, bir tartışma konusudur. 
Bununla beraber her şeyden önce, Kulenin İstanbul siluetinde asırlar boyu etkin bir rol oynadığı ve şehir görünümünün vazgeçilmez bir motifi olduğu bir gerçektir. 
Nitekim tarih boyu değişen egemenlikler, uygarlıklar ve zevkler, dolayısıyla fonksiyonlar; ona yeni biçimler, yeni görünümler kazandırmıştır.

Tarih literatüründe; bugünkü anlam ve boyutlarda olmasa bile; Doğu Roma İmparatorluğu sırasında M. S.500\\'lerde Hun ve Bulgar tehlikesine karşı; 
Batı sınırlarında yapılan surların bir devamı olarak, şimdiki kulenin bulunduğu bölgede, bir gözlem ve fener kulesinin yaptırıldığı ileri sürülmektedir.

Cenovalıların 1300\\'lerde siyasi entrikalar sonucu Pera’yı (Galata) ele geçirmelerinden sonra zamanla bütün surlar, burçlar ve bu arada Galata Kulesi de tamir ve inşa edilerek (1348) bugünkü kulenin temelleri atılmıştır. 
Külahın tepesinde bulunan bir haç dolayısıyla, \\"Christea Turris\\" adını da alan Kule, giderek doğudaki bu küçük Latin toplumun bir simgesi haline gelmiştir.

1509\\'da İstanbul\\'da (küçük kıyamet) diye anılan büyük depremde, Kulenin büyük ölçüde hasara uğraması nedeniyle II. Beyazıt\\'ın mimarı Murad bin Hayrettin tarafından, 13.20 m. kotundan (2 kat) itibaren yeniden inşa edildiği anlaşılmaktadır.

Kule; Kanuni zamanında (1520 - 1566) zindan olarak kullanılmış, II. Selim zamanında (1567 - 1575) geçirdiği yangınlar dolayısıyla tamirler görmüş, III. Murat zamanında (1576 - 1595) bir süre gözlem evi olarak kullanılmış, IV. Murat devrinde Hezar-ı Fen Ahmet Çelebinin Üsküdar\\'a uçuşuna tanık olmuştur. 
1717\\'de giderek sıklaşan yangınları haber vermek üzere, Kulede \\"Kös\\" çalacak bir haberleşme örgütü kurulmuştur. Yine bu devreye ait, Evliya Çelebi Seyahatnamesinde; Kuleye ait paragraf, ilk Türkçe gözlem belgesi niteliği taşır. 
Nihayet İnciciyan tarihinde de belirtildiği üzere 1794\\'de çıkan bir genel yangında, Kulenin ahşap külahı ve üst katları tamamen yanmıştır.

III. Selim tarafından 1794’te yaptırılan onarım sonucunda, kulenin üst kısmının aldığı görünüm, devrin saray mimarı A. I. Melling\\'in gravüründe görülmekte ve ayrıca Cevdet Paşa Tarihi’nde doğrulanmaktadır. 
Buna göre cihannüma katı etrafında 4 cumba yerleştirilmiş, iç kısmına da üç oda ile bir sofa inşa edilmiştir. 
Ayrıca Ayıntaplı Ayni ve Vahidi adlı şairlerin bu tamirle ilgili yapıtları, bu olayı belgelemektedir. Bu kesin bilgiler, bu devreye ait bir restitüsyonun yapılmasına olanak sağlamaktadır. 
Bu görünüm 1831 yangınına kadar 38 yıl devam edebilmiştir.

II. Mahmut, 1831 yangınından sonra, Kulenin 32.60 m.den sonraki üst kısmını tamamen yıktırmış ve \\"Ampir\\" stilde 14 büyük kârgir kemerli bir cihannüma ve 40.04 kotu üstünde de yine bir kat ve onun üzerine ahşap bir külâh inşa ettirmiştir. 
Bu ahşap külah, 1875\\'de vuku bulan şiddetli bir fırtına sonucu uçmuştur. Yerine kule ile hiç de bağdaşmayan sekizgen planlı iki gözlem katı, en üstüne de (51.65 m. kotu) bir teras inşa edilmiştir. 
Bu görünüm, 1964 yılına kadar devam etmiştir. Bu tarihe kadar, yangın ve Deniz Kuvvetleri haberleşme postası olarak kullanılan Kule, 32.35 kotu üzerindeki katları, ahşap konstrüksiyonun çürümesi, beden duvarları ve açıklık kemerlerinde bazı çatlaklar görülmesi üzerine, durum çok tehlikeli görülmüş, her türlü servise kapanmıştır. ''';
    String legendsDescription = '''
'Galata Kulesi, İstanbul\'un muhteşem manzarasıyla gökyüzüne yükselen tarihi bir yapıdır. Ancak sadece bir yapıdan ibaret değildir, aynı zamanda asırlar boyunca anlatılan gizemli efsanelerle de doludur. Bu efsanelerden biri, Romalılar tarafından nesilden nesile aktarılmıştır ve Galata Kulesi\'nin romantik atmosferine büyük bir renk katmıştır.

Söylenene göre, Galata Kulesi\'ne ilk defa çıkan bir kadın ve bir erkek beraber kuleye çıkarlarsa, onların evliliği gerçekleşirmiş. Ancak bu gizemli hikayenin bir sırrı vardır: Kadın veya erkek, ömründe ilk defa Galata Kulesi\'ne gelmiş olmalıdır. Daha önce kuleyi ziyaret edenler için bu büyü bozulurmuş. Bu durum, Galata Kulesi\'nin sadece taze ve saf duygulara açık olduğunu gösterir, geçmiş deneyimlerin izini siler ve yeni bir başlangıca davet eder.

Galata Kulesi\'nin efsaneleri ve gizemleri, İstanbul\'un romantik atmosferini ve tarihini yansıtır. Bu sebeple, Galata Kulesi evlilik teklifi etmek için de mükemmel bir yer olabilir. Göz alıcı manzarası altında sevdiklerinizle paylaşacağınız özel bir akşam yemeği, unutulmaz bir anıya dönüşebilir. Hayatınızın en önemli anlarını Galata Kulesi\'nin büyüsü altında kutlamak, sonsuza kadar sürecek bir aşkın temelini atabilir.'
''';

    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          // Image container
          Positioned.fill(
            child: Image.asset(
              'assets/images/galatakulesi.jpg',
              opacity:  AlwaysStoppedAnimation(.9),
              fit: BoxFit.cover,
            ),
          ),
          // Segmented control
          Positioned(
            left: 16,
            right: 16,
            top: 126,
            child: SizedBox(
              child: CupertinoSegmentedControl<int>(
                children: {
                  0: Text('Tarihçe'),
                  1: Text('Efsaneler'),
                  // Add more options as needed
                },
                onValueChanged: (int newValue) {
                  setState(() {
                    _selectedIndex = newValue;
                  });
                },
                selectedColor: Color(0xFF2b2831),
                unselectedColor: Colors.white70,
                borderColor: Colors.white70,
                pressedColor: Color(0xFF2b2831).withOpacity(0.5),
                groupValue: _selectedIndex,
              ),
            ),
          ),
          // Container with text
          Positioned(
            left: 30,
            right: 30,
            top: 180,
            bottom: 70,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFF2b2831).withOpacity(0.9),
              ),
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _selectedIndex == 0 ? 'Tarihçe' : 'Efsaneler',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      _selectedIndex == 0 ? historyDescription : legendsDescription,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              left: 125,
              right: 90,
              top: 0,
              bottom:700,
              child: SafeArea(
                child: Text(
                  "Galata Kulesi",
                  style: TextStyle(color: Colors.white,fontSize: 24,shadows: [
                    Shadow(blurRadius: 2,color: Colors.black54,offset: Offset(2,2))
                  ]),
                ),
              )
          ),
          Positioned(
            left: 140,
            right: 130,
            top: 60,
            bottom:670,
            child: Row(
              children: [
                for (int i = 0; i < 5; i++)
                  GestureDetector(
                    onTap: () {showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.person),
                                title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                      Text("Bojan Hofic"),SizedBox(width: 40,),Row(
                                        children: [Icon(Icons.star, color: Colors.yellow),
                                          Icon(Icons.star, color: Colors.yellow),
                                          Icon(Icons.star, color: Colors.yellow),
                                          Icon(Icons.star, color: Colors.yellow),
                                          Icon(Icons.star, color: Colors.yellow),],
                                      ),
                                    ]
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                subtitle: Text("What a building"),
                              ),
                              ListTile(
                                leading: Icon(Icons.person),
                                title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                      Text("Nuran Katır"),SizedBox(width: 40,),Row(
                                        children: [Icon(Icons.star, color: Colors.yellow),
                                          Icon(Icons.star, color: Colors.yellow),
                                          Icon(Icons.star, color: Colors.yellow),
                                          Icon(Icons.star, color: Colors.yellow),
                                          Icon(Icons.star, color: Colors.yellow),],
                                      ),
                                    ]
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                subtitle: Text("Ne güzel bir yapı"),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                      // Yıldızın tıklanma işlemini burada işleyin
                    },
                    child: Icon(
                      Icons.star,
                      color: i < 5 ? Colors.yellow : Colors.grey,
                    ),
                  ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
