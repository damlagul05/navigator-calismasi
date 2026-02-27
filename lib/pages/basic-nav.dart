import 'package:flutter/material.dart';

class basicnavigation extends StatelessWidget {
  const basicnavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(title: Text("basic navigation")),
      body: Center(
        child: Column(
          children: [
            Text(args["id"].toString()),
            Text(args["isim"].toString()),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  //ayarlara gider gidince bu sayfa ayarlar ile yer değiştirir geri dönüş yapılırsa maine gider direkt
                  context,
                  MaterialPageRoute(builder: (context) => ayarlar()),
                );
              },
              child: Text("ayarlar sayfasına git"),
            ),
            ElevatedButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  //eğer geri dönülecek sayfa varsa dönüş yapar
                  Navigator.pop(context);
                }
              },
              child: Text("geri dön"),
            ),
          ],
        ),
      ),
    );
  }
}

class ayarlar extends StatelessWidget {
  const ayarlar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ayarlar sayfası"),
        automaticallyImplyLeading: false, //appbardaki geri dön tuşunu kaldırır
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("geri dön"),
            ),
          ],
        ),
      ),
    );
  }
}
