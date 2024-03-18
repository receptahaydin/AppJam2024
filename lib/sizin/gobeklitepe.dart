import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Gobeklitepe extends StatefulWidget {
  const Gobeklitepe({Key? key}) : super(key: key);

  @override
  State<Gobeklitepe> createState() => _GobeklitepeState();
}

class _GobeklitepeState extends State<Gobeklitepe> {
  int _selectedIndex = 0; // Track the selected index of segmented button

  @override
  Widget build(BuildContext context) {
    String historyDescription = """
  Göbeklitepe, Türkiye'nin Şanlıurfa ilinde bulunan ve dünyanın bilinen en eski tapınak merkezi olarak kabul edilen bir arkeolojik sit alanıdır. MÖ 9600-8200 yıllarına tarihlenen Göbeklitepe, insanlık tarihinin bilinen en eski yerleşim yerlerinden biridir ve Neolitik Çağ'a ait önemli bilgiler sunmaktadır.

  Kazılarda ortaya çıkarılan megalitik taş sütunlar, insan figürleri ve hayvan kabartmaları, Göbeklitepe'nin sadece bir yerleşim yeri değil, aynı zamanda dini ve sosyal bir merkez olduğunu da göstermektedir. Bu yapılar, avcı-toplayıcı toplulukların karmaşık inanç sistemlerine sahip olduğunu ve gelişmiş bir sanat ve mimari anlayışına sahip olduğunu kanıtlamaktadır.

  Göbeklitepe'nin keşfi, insanlık tarihinin başlangıcına dair bildiklerimizi kökten değiştirdi. Daha önce, ilk yerleşik toplulukların ve tapınakların Mezopotamya ve Mısır'da ortaya çıktığı düşünülüyordu. Göbeklitepe ise bu tarihlerden çok daha önce, insanların yerleşik hayata geçmeden önce bile inanç sistemlerine sahip olduğunu ve karmaşık yapılar inşa edebildiğini göstermiştir.

  Göbeklitepe'nin keşfi ve kazıları halen devam etmektedir. Bu kazılardan elde edilen bilgiler, insanlık tarihinin başlangıcına dair yeni bilgiler sunmaya devam edecek ve Göbeklitepe'nin insanlık medeniyetinin gelişmesinde oynadığı rolü daha net bir şekilde ortaya koyacaktır.
  """
    ;
    String legendsDescription = """
  Zamanın tozlu perdesinin ardında, Şanlıurfa'nın bereketli topraklarında gizemli bir tepe yükseliyordu. Göbeklitepe, adı gibi göbeği andıran bu tepe, tarih kitaplarında yazılmamış efsanelere ev sahipliği yapıyordu.

  Efsanelerden birinde, gökyüzünden inen devlerin, insanlara bilgi ve bilgelik taşıdığı rivayet edilirdi. Devler, bu bilgileri sonsuza dek korumak için Göbeklitepe'yi inşa ettiler ve her bir taş sütuna insanlığın kaderini kodladılar.

  Başka bir efsanede ise, Göbeklitepe'nin karanlığı aydınlatan bir ışık olduğuna inanılırdı. Geceleri gökyüzüne yükselen bu ışık, kayıp ruhlara yol gösterir ve onları doğru yola yönlendirirdi.

  Yıllar sonra, meraklı bir arkeolog bu gizemli tepeyi keşfetti. Kazılar başladıkça, Göbeklitepe'nin sırları yavaş yavaş ortaya çıkmaya başladı. Taş sütunlar üzerindeki figürler, insanlığın ilk inançlarını ve ritüellerini resmediyordu. Bu keşif, insanlık tarihinin bilinen en eski tapınak kompleksinin Göbeklitepe olduğunu kanıtladı.

  Göbeklitepe'nin keşfi, sadece tarih kitaplarını değil, efsaneleri de yeniden yazdı. Devlerin gökyüzünden inip bilgi taşıdığı hikayesi, belki de bir metafordu. Göbeklitepe'nin taşları, insanlığın kendi elleriyle inşa ettiği bilgi ve bilgelik tapınağıydı.

  Göbeklitepe'nin hikayesi hala tam olarak bilinmiyor. Arkeolojik kazılar devam ediyor ve her yeni keşif, bu gizemli tepe hakkında yeni bilgiler sunuyor. Belki bir gün, Göbeklitepe'nin tüm sırları çözülecek ve insanlığın ilk adımları hakkında daha net bir resim ortaya çıkacak.

  Ancak Göbeklitepe'nin gizemi, onu daha da büyüleyici kılıyor. Bu tepede, insanlığın geçmişi ve geleceği arasında bir köprü var. Göbeklitepe'nin taşları, sadece bir arkeolojik sit alanı değil, aynı zamanda insanlığın kolektif hafızasının da bir parçası.

  Göbeklitepe'nin hikayesi, sonsuza kadar anlatılacak ve insanlığın merakını ve hayal gücünü beslemeye devam edecek.
  """
    ;

    return Scaffold(
      body: Stack(
        children: [
          // Image container
          Positioned.fill(
            child: Image.asset(
              'assets/images/gobeklitepe.jpg',
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
              left: 130,
              right: 90,
              top: 0,
              bottom:700,
              child: SafeArea(
                child: Text(
                  "Göbeklitepe",
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
