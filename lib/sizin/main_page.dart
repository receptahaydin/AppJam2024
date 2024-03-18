import 'package:app_jam_2024/reusable_widgets/reusable_widget.dart';
import 'package:app_jam_2024/screens/signIn_screen.dart';
import 'package:app_jam_2024/sizin/aspendon_tiyatrosu.dart';
import 'package:app_jam_2024/sizin/ayasofya.dart';
import 'package:app_jam_2024/sizin/balikli_gol.dart';
import 'package:app_jam_2024/sizin/galata_kulesi.dart';
import 'package:app_jam_2024/sizin/gobeklitepe.dart';
import 'package:app_jam_2024/sizin/kiz_kulesi.dart';
import 'package:app_jam_2024/sizin/meryem_ana_evi.dart';
import 'package:app_jam_2024/sizin/place.dart';
import 'package:app_jam_2024/sizin/yerebatan_sarnici.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var tfController = TextEditingController();
  int _selectedIndex = 0;
  final TextEditingController _textField1Controller = TextEditingController();
  final TextEditingController _textField2Controller = TextEditingController();

  String? _selectedCity;
  String? _userEmail;

  final List<String> _cities = [
    'Müze',
    'Ulusal Park',
    'Cami',
    'Saray',
    'Antik Kent',
  ];

  @override
  void initState() {
    super.initState();
    _getUserEmail(); // Call method to get user's email when the widget initializes
  }

  void _getUserEmail() async {
    User? user = FirebaseAuth.instance.currentUser; // Get the current user
    if (user != null) {
      setState(() {
        _userEmail = user.email; // Set the user's email to the variable
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Place> places = [
    Place(name: "Yerebatan S.", city: "İstanbul", image: "assets/images/sarnic.jpg"),
    Place(
        name: "Göbeklitepe",
        city: "Şanlıurfa",
        image: "assets/images/gobeklitepe.jpg"),
    Place(
        name: "Galata Kulesi",
        city: "İstanbul",
        image: "assets/images/galatakulesi.jpg"),
    Place(name: "Kız Kulesi", city: "İstanbul", image: "assets/images/kizkulesi.jpg"),
    Place(name: "Ayasofya", city: "İstanbul", image: "assets/images/ayasofya.jpg"),
    Place(
        name: "Balıklı Göl",
        city: "Şanlıurfa",
        image: "assets/images/D7UbfrBWsAAwKWT.jpg"),
    Place(name: "Meryem A.E", city: "İzmir", image: "assets/images/meryemana.jpg"),
    Place(name: "Aspendos T.", city: "Antalya", image: "assets/images/aspendos.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    tfController.addListener(() {
      setState(() {});
    });

    return Scaffold(
      backgroundColor: Color(0xCC1C1B1F),
      body: _buildBody(_selectedIndex), //buildBody çağır
      //NavigationBar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(20), bottom: Radius.circular(20)),
          child: BottomNavigationBar(
            backgroundColor: Color(0xFF2b2831),
            selectedItemColor: Color(0xFFBF244d),
            unselectedItemColor: Color(0xFF6d6a71),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Anasayfa"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.map), label: "Kayıp Yerler"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profil"),
            ],
            currentIndex: _selectedIndex,
            onTap:
                _onItemTapped, // seçilen indexi selectedIndex variable'ına atıyor.
          ),
        ),
      ),
    );
  }

  Widget _buildBody(int index) {
    //scaffold body yükleme yeri
    switch (index) {
      case 0:
        List<Place> filteredPlaces = places.where((place) {
          print('Arama Metni: ${tfController.text}');
          print(
              'Karşılaştırma: ${place.name.toLowerCase().contains(tfController.text.toLowerCase())}');
          return place.name
                  .toLowerCase()
                  .contains(tfController.text.toLowerCase()) ||
              place.city
                  .toLowerCase()
                  .contains(tfController.text.toLowerCase());
        }).toList();
        return SafeArea(
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Center(
                      child: Image.asset(
                          "assets/images/Frame 7004.png"))), //headerImage
              Positioned(
                left: 0,
                right: 0,
                top: 180,
                child: Container(
                  //search button başlangıç
                  //TODO gezilecek yerleri arama
                  //TODO filtre şehirler
                  margin: EdgeInsets.all(13), //değişebilir
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey[200],
                  ),
                  child: TextField(
                    controller: tfController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      icon: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.search),
                      ),
                      labelText: "Gitmek istediğin yeri ara",
                      hintText: "Yeni yerler keşfet",
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Positioned(
                //Gezilecek yer butonları GridView
                top: 250,
                bottom: 0,
                left: 0,
                right: 0,
                child: GridView.count(
                  crossAxisCount: 2, //2li yapmak için
                  padding: EdgeInsets.all(20),
                  mainAxisSpacing: 20, // Dikey boşluklar
                  crossAxisSpacing: 20,
                  children: _buildListTiles(filteredPlaces),
                ),
              )
            ],
          ),
        );
      case 1:
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                reusableTextField(
                  'Yer Adı',
                  Icons.map,
                  false,
                  _textField1Controller,
                ),
                SizedBox(height: 30),
                reusableTextField(
                  'Bulunduğu Şehir',
                  Icons.location_city,
                  true,
                  _textField2Controller,
                ),
                SizedBox(height: 30),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Kategori',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white, // Border rengini beyaz yapar
                      ),
                    ),
                  ),
                  value: _selectedCity,
                  onChanged: (value) {
                    setState(() {
                      _selectedCity = value;
                    });
                  },
                  dropdownColor: Color(
                      0xFF2b2831), // Açılır penceredeki arka plan rengini siyah yapar
                  items: _cities.map((city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(
                        city,
                        style: TextStyle(
                            color: Colors.white), // Metin rengini beyaz yapar
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Fotoğraf ekleme işlemleri burada gerçekleştirilecek
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFBF244d),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    'Fotoğraf Ekle',
                    style: TextStyle(
                      color: Colors.white, // Metin rengini beyaz yapar
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

      case 2:
        return SafeArea(
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Center(
                      child: Image.asset(
                          "assets/images/Frame 7004.png"))), //headerImage
              Positioned(
                  top: 155,
                  left: 134,
                  child: Image.asset("assets/images/xxx.png")),
              Positioned(
                  top: 285,
                  left: 88,
                  bottom: 15,
                  child: Column(
                    //setting buttonu nereye gelecek
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 150.0),
                        child: Text(
                          _userEmail ?? "",
                          style:
                              TextStyle(color: Color(0xACFFFFFF), fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Yardım mı lazım?",
                                style: TextStyle(color: Colors.white54),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text("İletişime Geç",
                                    style: TextStyle(color: Colors.white)),
                              )
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Çıkış"),
                                        content: Text(
                                            "Çıkış yapmak istiyor musunuz?"),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SignInScreen()));
                                              },
                                              child: Text(
                                                "Çıkış",
                                                style: TextStyle(
                                                    color: Color(0xFFBF244d)),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("İptal",
                                                  style: TextStyle(
                                                      color:
                                                          Color(0xFFBF244d)))),
                                        ],
                                      );
                                    });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(
                                    0xFFBF244d), // Buton rengini turuncu yapar
                              ),
                              child: Text(
                                "Çıkış Yap",
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      )
                    ],
                  )),
              Positioned(
                top: 0,
                left: 10,
                bottom: 630,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      color: Color(0xFFFFFFFF),
                    )),
              )
            ],
          ),
        ); // Profile ekranı
      default:
        return Center(child: Text("Hata")); // Index boş olursa
    }
  }

  List<Widget> _buildListTiles(List<Place> places) {
    return places
        .map((place) => GestureDetector(
      onTap: () {
        // Yer detayına gitme işlemi (isteğe bağlı)
        switch (place.name){
          case "Yerebatan S.":
            Navigator.push(context, MaterialPageRoute(builder: (context) => YerebatanSarnici()));
            break;
          case "Göbeklitepe" :
            Navigator.push(context, MaterialPageRoute(builder: (context) => Gobeklitepe()));
            break;
          case "Galata Kulesi" :
            Navigator.push(context, MaterialPageRoute(builder: (context) => GalataKulesi()));
            break;
          case "Kız Kulesi" :
            Navigator.push(context, MaterialPageRoute(builder: (context) => KizKulesi()));
            break;
          case "Ayasofya" :
            Navigator.push(context, MaterialPageRoute(builder: (context) => Ayasofya()));
            break;
          case "Balıklı Göl" :
            Navigator.push(context, MaterialPageRoute(builder: (context) => BalikliGol()));
            break;
          case "Meryem A.E" :
            Navigator.push(context, MaterialPageRoute(builder: (context) => MeryemAnaEvi()));
            break;
          case "Aspendos T." :
            Navigator.push(context, MaterialPageRoute(builder: (context) => AspendonTiyatrosu()));
            break;
        }

      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xFF2b2831),
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Column(
            children: [
              Image.asset(place.image, fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(place.name, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    ))
        .toList();
  }
}
