import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MeryemAnaEvi extends StatefulWidget {
  const MeryemAnaEvi({Key? key}) : super(key: key);

  @override
  State<MeryemAnaEvi> createState() => _MeryemAnaEviState();
}

class _MeryemAnaEviState extends State<MeryemAnaEvi> {
  int _selectedIndex = 0; // Track the selected index of segmented button

  @override
  Widget build(BuildContext context) {
    String historyDescription = '''
'Meryem Ana'nın ve Meryem Ana Evi'nin Hristiyanlar için önemini anlamak, Efes'in Hristiyan tarihine dahil edilmeden mümkün değildir. Efes, Havari Aziz Yuhanna'nın Meryem'in varlığını yansıttığı ve İsa'nın Annesi'nin yaşadığı bir kenttir. Aziz Yuhanna İncil'de, İsa'nın çarmıha gerildiği sırada Meryem'i öğrencisiyle evine aldığı belirtilir. İkinci ve üçüncü yüzyıllarda gelenekler, Aziz Yuhanna'nın Efes'e geldiği konusunda hemfikirdir. Kıbrıs Episkoposu Aziz Epifanius, Kutsal Yazılar'ın Meryem'in son yılları hakkında bilgi vermediğini belirtir. Ancak, Efes geleneğine göre Meryem'in, Aziz Yuhanna'ya eşlik etmesi için Efes'e getirildiği ve burada "uykuya daldığı" düşünülmektedir. Yakubî Süryani Kilisesi ve 12. ile 13. yüzyıllarda bu inanç güçlenmiş ve Papa 14. Benedikt tarafından desteklenmiştir. Papa 15. Benedikt, Meryem'in Efes'te ikamet edip burada "uykuya daldığı" görüşünü kabul etmiştir.'
''';
    String legendsDescription = '''
"Meryem Ana'nın ve Meryem Ana Evi'nin Hristiyanlar için önemini anlamak, Efes'in Hristiyan tarihine dahil edilmeden mümkün değildir. Efes, Havari Aziz Yuhanna'nın Meryem'in varlığını yansıttığı ve İsa'nın Annesi'nin yaşadığı bir kenttir. Aziz Yuhanna İncil'de, İsa'nın çarmıha gerildiği sırada Meryem'i öğrencisiyle evine aldığı belirtilir. İkinci ve üçüncü yüzyıllarda gelenekler, Aziz Yuhanna'nın Efes'e geldiği konusunda hemfikirdir. Kıbrıs Episkoposu Aziz Epifanius, Kutsal Yazılar'ın Meryem'in son yılları hakkında bilgi vermediğini belirtir. Ancak, Efes geleneğine göre Meryem'in, Aziz Yuhanna'ya eşlik etmesi için Efes'e getirildiği ve burada 'uykuya daldığı' düşünülmektedir. Yakubî Süryani Kilisesi ve 12. ile 13. yüzyıllarda bu inanç güçlenmiş ve Papa 14. Benedikt tarafından desteklenmiştir. Papa 15. Benedikt, Meryem'in Efes'te ikamet edip burada 'uykuya daldığı' görüşünü kabul etmiştir."
''';

    return Scaffold(
      body: Stack(
        children: [
          // Image container
          Positioned.fill(
            child: Image.asset(
              'assets/images/meryemana.jpg',
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
              left: 110,
              right: 90,
              top: 0,
              bottom:700,
              child: SafeArea(
                child: Text(
                  "Meryem Ana Evi",

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
                                      Text("Natalie Idea"),SizedBox(width: 40,),Row(
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
                                subtitle: Text("Wow!"),
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
