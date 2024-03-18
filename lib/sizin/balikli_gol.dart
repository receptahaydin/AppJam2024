import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BalikliGol extends StatefulWidget {
  const BalikliGol({Key? key}) : super(key: key);

  @override
  State<BalikliGol> createState() => _BalikliGolState();
}

class _BalikliGolState extends State<BalikliGol> {
  int _selectedIndex = 0; // Track the selected index of segmented button

  @override
  Widget build(BuildContext context) {
    String historyDescription = '''
'Edessa olan Urfa’nın başına gelen felakete çok üzülen Bizans imparatoru I. Justinianos, 527 yılında tahta çıkınca İstanbul’dan Urfa’ya birçok mühendis, uzman ve yüklü miktarda para göndermiştir. Mühendisler ve uzmanlar, işçilerin yardımıyla önce günümüze ulaşan bir taşkın önleme duvarı yaptılar. Daha sonra derelerden toplanıp gelen suların akış yönünü şehrin etrafına yönlendiren büyük bir dere (Karakoyun Deresi) kazdılar. Halepli Bahçesi suların taşkınlarından kurtarıldı. Karakoyun Deresi adını verdiğimiz bu dere, şehrin batısından başlayarak kuzey ve doğudan şehri dolaşır. O dönemdeki Urfa halkı, efendilerinin bu büyük iyiliğinden dolayı ona teşekkür etmek amacıyla uzun bir zaman şehri imparatorun adıyla birlikte “Justinianopolis” (Jüstinyen Şehri) olarak çağırdılar. Halilürrahman Gölü, 150 m. Uzunluğunda ve 30 m. genişliğindedir. Aynzeliha Gölü, ise 50 m. uzunluğunda ve 30 m. genişliğindedir. 1940-1970 yılları arasında bu gölde yüzme yarışmaları ve su sporları yapılırdı. Göllerin bulunduğu yer, şehre gelen yerli ve yabancı turistlerin mutlaka uğradıkları şehrin en gözde yeridir. Halilürrahman Gölü’nün kuzeyinde Rızvaniye Camii ve Medresesi, güneybatı köşesinde ise Hali'
''';
    String legendsDescription = '''
'Balıklı Göl, Şanlıurfa'nın tarihi ve mistik dokusunu oluşturan önemli bir yerdir. Efsanelere göre, bu göl Hz. İbrahim'in yaşadığı döneme kadar uzanan bir geçmişe sahiptir. Hz. İbrahim'in Nemrut'un zalimliklerine karşı çıkışı ve putperestliğe karşı getirdiği eleştiriler, Balıklı Göl efsanesinin temelini oluşturur. Hz. İbrahim'in yaşadığı dönemde, kent halkı ve özellikle Nemrut'un kızı Zeliha, Hz. İbrahim'in öğretilerine inanmıştır. Ancak Nemrut, Hz. İbrahim'in etkisini azaltmak ve kendisine karşı gelenleri cezalandırmak amacıyla onu ateşe atmak ister. Hz. İbrahim'in atıldığı ateşin ise bir mucizeyle göle dönüştüğü, ateşte yanan odunların ise balıklara dönüştüğü söylenir. Bu efsane, Balıklı Göl'e adını verir ve gölün çevresi kutsal bir yer olarak kabul edilir. Aynı efsaneye göre, Hz. İbrahim'in Nemrut'un zalimliklerine karşı duruşu ve göle atılması sonrasında, Nemrut'un kızı Zeliha da derin bir hüzne kapılır ve gözyaşları dökerek gölün yanında başka bir göl oluşturur. Bu göl de Ayn Zeliha adını alır. Balıklı Göl, günümüzde Şanlıurfa'nın önemli bir turistik ve dini mekânı olarak ziyaret edilmektedir. Ziyaretçiler, gölün mistik atmosferini hissederek Hz. İbrahim'in ve bu kutsal mekânın hikayelerini dinlemektedirler.'
''';

    return Scaffold(
      body: Stack(
        children: [
          // Image container
          Positioned.fill(
            child: Image.asset(
              "assets/images/D7UbfrBWsAAwKWT.jpg",
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
              left: 145,
              right: 90,
              top: 0,
              bottom:700,
              child: SafeArea(
                child: Text(
                  "Balıklı Göl",
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
                                      Text("Jack Horse"),SizedBox(width: 40,),Row(
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
                                subtitle: Text("Amazing"),
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
                                subtitle: Text("Masallah"),
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
