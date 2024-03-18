import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ayasofya extends StatefulWidget {
  const Ayasofya({Key? key}) : super(key: key);

  @override
  State<Ayasofya> createState() => _AyasofyaState();
}

class _AyasofyaState extends State<Ayasofya> {
  int _selectedIndex = 0; // Track the selected index of segmented button

  @override
  Widget build(BuildContext context) {
    String historyDescription = 'Ayasofya aynı yere üç kez inşa edilmiş bir eserdir. Günümüzdeki Ayasofya “Üçüncü Ayasofya” olarak bilinmektedir. '
        'Ayasofya’nın ilk inşaatı Hıristiyanlığı Roma İmparatorluğu’nun resmi dini olarak kabul eden I. Konstantin döneminde başlatılmıştır. '
        'İstanbul’un yedi tepesinden birincisi üzerinde ahşap çatılı bir bazilika olarak inşa edilen ve o dönemde ‘Büyük Kilise’ ismiyle anılan bu yapının açılışı, 360 yılında II. Konstantin döneminde gerçekleşmiştir. '
        '404 yılında başlayan isyanda çıkan bir yangın neticesinde büyük ölçüde harap olan bu yapıdan günümüze ulaşan bir kalıntı bulunmamaktadır. '
        '\n\nİkinci Ayasofya, İmparator II. Theodosius tarafından birincisinin üzerine inşa ettirilmiş ve 415 yılında ibadete açılmıştır. Yine bazilika şeklinde ve ahşap çatılı olarak inşa edilen bu yapı ise, 532 yılında İmparator Jüstinyen aleyhinde çıkan Nika Ayaklanması’nda isyancılar tarafından yakılıp yıkılmıştır. '
        '\n\nİmparator Jüstinyen isyanın hemen ardından ilk ikisinden çok daha büyük ve görkemli bir Ayasofya yaptırmaya karar vermiştir. Üçüncü Ayasofya Bizans İmparatoru I. Jüstinyen tarafından 532-537 yıllarında inşa ettirilmiştir. '
        '\n\nDoğu Roma’nın İmparatorluk Kilisesi olarak kullanılan Ayasofya, tarih boyunca isyanlar, savaşlar ve doğal afetler yüzünden sık sık tahrip olmuştur. '
        'Ayasofya en büyük yıkımlardan birini 1204’te 4. Haçlı Seferi’nde şehrin istila edilmesiyle yaşamıştır. '
        '\n\nCiddi hasarlar almış olan Ayasofya, İstanbul’da tekrar Doğu Roma idaresinin sağlanmasının ardından tamirlerle ayakta tutulmaya çalışılmıştır. '
        '\n\nOsmanlılar fethin nişanesi olarak kabul ettikleri ve kıymet verdikleri Ayasofya Camii’ne Fatih Sultan Mehmed Han’dan itibaren büyük özen göstermiş, bakım-onarım faaliyetlerini sürekli hale getirmiş ve camiyi eskisinden çok daha sağlam bir yapıya kavuşturmuştur. '
        '\n\nAyasofya’ya en fazla ilgi gösteren Osmanlı padişahlarından biri de Sultan II. Selim Han’dır. '
        '\n\nFetihle birlikte camiye dönüştürülen ve 481 yıl cami olarak hizmet veren Ayasofya, 1930’lu yıllarda restorasyon çalışmalarının başlamasıyla halka kapatılmıştır. '
        '\n\nArdından, 24 Kasım 1934 tarihli bir Bakanlar Kurulu kararıyla müzeye dönüştürülmüştür. Danıştay, 10 Temmuz 2020 tarihinde söz konusu Bakanlar Kurulu kararını iptal etmiştir. '
        'Hemen ardından Cumhurbaşkanı Sayın Recep Tayyip Erdoğan imzası ile yayımlanan 2729 sayılı Cumhurbaşkanlığı kararnamesiyle Ayasofya yeniden ibadete açılmıştır.';
    String legendsDescription = '''
'Ayasofya'nın içinde bulunan dilek sütununun hikayesi, binlerce yıl öncesine dayanan gizemli bir efsaneye dayanır. Söylentiye göre, bu sütun Meryem Ana'nın evinde bulunuyormuş ve Hz. İsa'nın acılarını gözyaşlarıyla paylaşırken oluşmuş. Hz. İsa'nın işkence gördüğü sırada döktüğü gözyaşları, bu sütunu eritmiş ve ona mistik bir güç vermiş. Daha sonra Ayasofya'nın inşası sırasında, bu kutsal sütunun buraya getirilerek yapıya entegre edilmesi kararlaştırılmış. Sütunun üzerinde bulunan delik ise özel bir anlam taşır. Efsaneye göre, bu deliğe baş parmağınızı sokup elinizi 360 derece çevirirseniz, dileklerinizin kabul olacağına inanılır. Ziyaretçiler, bu ritüeli gerçekleştirerek dileklerini diler ve umutla beklerler. Bu efsane, Ayasofya'nın sadece bir yapı olmadığını, aynı zamanda derin bir tarihi ve dini mirasa sahip olduğunu gösterir. Binlerce yıldır insanların ziyaret ettiği ve ibadet ettiği bu kutsal mekan, gizemli ve büyülü atmosferiyle her daim ziyaretçilerini etkilemeye devam eder. Dilek sütunu da Ayasofya'nın ruhunu ve mistik gücünü yansıtan önemli bir simgedir.'
''';

    return Scaffold(
      body: Stack(
        children: [
          // Image container
          Positioned.fill(
            child: Image.asset(
              "assets/images/ayasofya.jpg",
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
                  "Ayasofya",
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
