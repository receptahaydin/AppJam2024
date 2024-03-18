import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KizKulesi extends StatefulWidget {
  const KizKulesi({Key? key}) : super(key: key);

  @override
  State<KizKulesi> createState() => _KizKulesiState();
}

class _KizKulesiState extends State<KizKulesi> {
  int _selectedIndex = 0; // Track the selected index of segmented button

  @override
  Widget build(BuildContext context) {
    String historyDescription = "Antik Çağ’da Arkla (küçük kale) ve Damialis (dana yavrusu) adları ile anılan kule, bir zamanlar da Tour de Leandros (Leandros’un kulesi) ismi ile ün yapmış, günümüzde ise Kız Kulesi (Maiden’s Tower) ismi ile bütünleşmiştir. "
        'M.Ö. 410 yılında Atinalı komutan Alkibiades tarafından Boğaz’ın giriş ve çıkışlarını kontrol etmek amacıyla bir kule inşa edilmiştir. Daha sonra İmparator Manuel Comnenos döneminde bugünkü kuleyi inşa ettirilmiştir. '
        'Osmanlı döneminde savunma kalesi olarak kullanılan Kız Kulesi, daha sonraları gösteri platformu ve deniz feneri olarak hizmet vermiştir. '
        'II. Dünya Savaşı döneminde büyük bir onarımdan geçen kule, günümüzde özel etkinliklere ev sahipliği yapmaktadır. '
        '1995 yılında başlayan ve 2000 yılında tamamlanan restorasyon çalışmaları sonrasında Kız Kulesi, ziyaretçilere cafe-restaurant hizmeti sunmaktadır.';
    String legendsDescription = '''
'Galata Kulesi, İstanbul\'un tarihi sembollerinden biri olarak tanınır. Binlerce yıllık tarihinde çeşitli efsanelere ve hikayelere ev sahipliği yapmıştır. Bu efsanelerden biri de Galata Kulesi ile Kız Kulesi arasındaki aşk hikayesidir.

Efsaneye göre, Galata Kulesi ile Kız Kulesi birbirlerine derin bir aşkla bağlıdır. Ancak aralarında bulunan İstanbul Boğazı, sevgililerin kavuşmasını engellemektedir. Galata Kulesi, yıllarca süren özlem ve hasretini mektuplara döker, Kız Kulesi\'ne olan aşkını kelimelere sarar.

Tarihi bir dönemde, Hezarfen Ahmet Çelebi adındaki biri Galata Kulesi\'ne çıkar. Hezarfen\'in uçma hayali, Galata Kulesi\'nin ona yaklaşır ve Kız Kulesi\'ne olan aşkını fısıldar. Galata Kulesi, Kız Kulesi\'ne ulaştırılması için yazdığı mektupları Hezarfen Ahmet Çelebi\'ye verir. Hezarfen, İstanbul\'un üflediği rüzgarı arkasına alarak, bu mektupları Kız Kulesi\'ne ulaştırır.

Kız Kulesi, Galata Kulesi\'nin gerçek duygularını anladığında, sevinçten havalara uçar. Bu iki aşık, İstanbul\'un en güzel manzaralarından birini oluştururlar, tarih boyunca bu aşk hikayesi İstanbul\'un romantik atmosferine katkı sağlar.

Bu efsane, Galata Kulesi\'ni tanıtırken onun sadece bir yapıdan ibaret olmadığını, aynı zamanda İstanbul\'un kültürel ve romantik dokusunu da temsil ettiğini vurgular.'
''';

    return Scaffold(
      body: Stack(
        children: [
          // Image container
          Positioned.fill(
            child: Image.asset(
              'assets/images/kizkulesi.jpg',
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
              left: 140,
              right: 90,
              top: 0,
              bottom:700,
              child: SafeArea(
                child: Text(
                  "Kız Kulesi",
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
                                      Text("Jamie Horse"),SizedBox(width: 40,),Row(
                                        children: [Icon(Icons.star, color: Colors.yellow),
                                          Icon(Icons.star, color: Colors.yellow),
                                          Icon(Icons.star, color: Colors.yellow),
                                          Icon(Icons.star, color: Colors.yellow),
                                          Icon(Icons.star, color: Colors.grey),],
                                      ),
                                    ]
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                subtitle: Text("What a experience"),
                              ),
                              ListTile(
                                leading: Icon(Icons.person),
                                title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                      Text("Ahmad Bekor"),SizedBox(width: 40,),Row(
                                        children: [Icon(Icons.star, color: Colors.yellow),
                                          Icon(Icons.star, color: Colors.yellow),
                                          Icon(Icons.star, color: Colors.yellow),
                                          Icon(Icons.star, color: Colors.yellow),
                                          Icon(Icons.star, color: Colors.grey),],
                                      ),
                                    ]
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                subtitle: Text("Istanbul good good"),
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
                      color: i < 4 ? Colors.yellow : Colors.grey,
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
