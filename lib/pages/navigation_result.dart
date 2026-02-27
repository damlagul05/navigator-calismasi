import 'package:flutter/material.dart';

class navigationresults extends StatefulWidget {
  const navigationresults({super.key});

  @override
  State<navigationresults> createState() => _navigationresultsState();
}

class _navigationresultsState extends State<navigationresults> {
  String? secilenrenk;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("geri dönüş değeri")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                var renk = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => renksec()),
                );
                if (renk != null) {
                  setState(() {
                    secilenrenk = renk;
                  });
                }
              },
              child: Text("renk seç"),
            ),
            Text(secilenrenk ?? "renk seçilmedi"),
          ],
        ),
      ),
    );
  }
}

class renksec extends StatelessWidget {
  const renksec({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("renk seç ")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildcolorbutton(context, "mavi"),
            buildcolorbutton(context, "yeşil"),
            buildcolorbutton(context, "mor"),
            buildcolorbutton(context, "kırmızı"),
            buildcolorbutton(context, "sarı"),
          ],
        ),
      ),
    );
  }

  Widget buildcolorbutton(BuildContext context, String color) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 8),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context, color);
        },
        child: Text(color),
      ),
    );
  }
}
