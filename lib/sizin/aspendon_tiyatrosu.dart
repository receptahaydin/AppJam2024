import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AspendonTiyatrosu extends StatefulWidget {
  const AspendonTiyatrosu({Key? key}) : super(key: key);

  @override
  State<AspendonTiyatrosu> createState() => _AspendonTiyatrosuState();
}

class _AspendonTiyatrosuState extends State<AspendonTiyatrosu> {
  int _selectedIndex = 0; // Track the selected index of segmented button

  @override
  Widget build(BuildContext context) {
    String historyDescription = '''
'Antalya’nın en çok ziyaret edilen antik kentlerinden Aspendos, sadece Anadolu'nun değil tüm Akdeniz dünyasının en iyi korunagelmiş Roma Dönemi tiyatrosuna sahip olmasıyla ünlüdür. Kent, Serik ilçesinin yaklaşık 8 kilometre doğusunda, bölgenin en büyük nehirlerinden Köprüçay (antik Eurymedon) yakınlarındaki tepe düzlüğünde kurulmuştur. M.Ö. 5. yüzyılda basılmış sikkelerinde adı "Estvediys" olarak geçer. Anadolu kökenli bu ad, kentin çok eskilerden beri yerleşim gördüğünün kanıtıdır. Akdeniz ile ulaşımını ve gelişmesini yakınındaki nehre ve dolayısıyla çevresindeki bereketli topraklara borçlu olan Aspendos'ta bugün, çoğunlukla tiyatro ve su yolları ziyaret edilir. Kente ait diğer yapıların kalıntıları ise tiyatronun yaslandığı tepenin düzlüğünde yer alır.'
''';
    String legendsDescription = '''
'Efsaneye göre, Aspendos'u deniz tanrısı Poseidon'un öfkesi ve bereketiyle kutsanmış bir kral yönetiyordu. Kralın tek çocuğu, güzelliği dillere destan prenses Ariadne'ydi. Bembeyaz teni, güneş ışığıyla parıldayan saçları ve masmavi gözleriyle Ariadne, şehrin gözbebeğiydi.'
''';

    return Scaffold(
      body: Stack(
        children: [
          // Image container
          Positioned.fill(
            child: Image.asset(
              "assets/images/aspendos.jpg",
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
              left: 85,
              right: 30,
              top: 0,
              bottom:700,
              child: SafeArea(
                child: Text(
                  "Aspendos Tiyatrosu",
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
