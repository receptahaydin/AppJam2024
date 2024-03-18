import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YerebatanSarnici extends StatefulWidget {
  const YerebatanSarnici({Key? key}) : super(key: key);

  @override
  State<YerebatanSarnici> createState() => _YerebatanSarniciState();
}

class _YerebatanSarniciState extends State<YerebatanSarnici> {
  int _selectedIndex = 0; // Track the selected index of segmented button

  @override
  Widget build(BuildContext context) {
    String historyDescription = "Yerebatan Sarnıcı, İstanbul'un gizemli ve büyüleyici yapılarından biridir. Bu antik su deposu, binlerce yıl boyunca birçok efsaneye ve hikayeye ev sahipliği yapmıştır. Sarnıcın koridorlarının sonunda bulunan ve 'gözyaşı sütunu' olarak da bilinen sütun, ziyaretçilere mistik bir atmosfer sunar. Sürekli su damlacıkları sızdırarak adeta ağlıyormuş gibi bir görünüm veren bu sütun, etkileyici kabartmalar ve oymalarla süslenmiştir. Efsanelere göre, sarnıcın inşaatında çalışan yüzlerce kölenin anısına yapılan bu sütun, üzerindeki şekillerin gözyaşlarına benzemesiyle ve sürekli sular sızdırmasıyla bilinir. Sarnıcın zorlu inşaatı sırasında yaşamını yitiren kölelerin acısı, bu sütunun sürekli ağlamasına sebep olmuş olabilir.";
    String legendsDescription = "Yerebatan Sarnıcı'nın gizemli atmosferi, birçok efsaneye ve hikayeye ilham kaynağı olmuştur. Sarnıcın inşaatı sırasında yaşanan dramatik olaylar ve sütunun mistik görünümü, halk arasında çeşitli efsanelere yol açmıştır. Bu efsanelerden biri, sarnıcın inşaatında çalışan kölelerin akıbetiyle ilgilidir. Bazı hikayelere göre, sarnıcın yapımı tamamlandıktan sonra köleler öldürülmüş ve sarnıcın sırlarını ifşa etmemeleri için gömülmüşlerdir. Diğer efsaneler ise sarnıcın altında gizli hazineler olduğunu iddia eder. Yerebatan Sarnıcı'nın efsanelerle dolu atmosferi, ziyaretçilere unutulmaz bir deneyim sunar ve İstanbul'un derin tarihine bir pencere açar.";

    return Scaffold(
      body: Stack(
        children: [
          // Image container
          Positioned.fill(
            child: Image.asset(
              'assets/images/sarnic.jpg',
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
                  "Yerebatan Sarnıcı",
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
