import 'package:flutter/material.dart';

class veriaktarimidemo extends StatelessWidget {
  List<ogrenci> ogrenciler = List.generate(
    50,
    (index) =>
        ogrenci(isim: "isim:$index", sehir: "şehir:$index", yas: index * 2),
  );
  veriaktarimidemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("veri aktarımı")),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ogrencidetay(ogr: ogrenciler[index]),
                ),
              );
            },
            child: Card(
              child: ListTile(
                title: Text(ogrenciler[index].isim),
                subtitle: Text(ogrenciler[index].sehir),
                leading: CircleAvatar(
                  child: Text(ogrenciler[index].yas.toString()),
                ),
                trailing: Icon(Icons.arrow_right),
              ),
            ),
          );
        },
      ),
    );
  }

  Center tekdetayogrenci(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              final ogrdamla = ogrenci(
                isim: "damla",
                sehir: "kayseri",
                yas: 20,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ogrencidetay(ogr: ogrdamla),
                ),
              );
            },
            child: Text("detay sayfasına git"),
          ),
        ],
      ),
    );
  }
}

class ogrenci {
  final String isim;
  final String sehir;
  final int yas;

  ogrenci({required this.isim, required this.sehir, required this.yas});
}

class ogrencidetay extends StatelessWidget {
  final ogrenci ogr;
  const ogrencidetay({super.key, required this.ogr});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("öğrenci detay")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(ogr.isim), Text(ogr.sehir), Text(ogr.yas.toString())],
        ),
      ),
    );
  }
}
