import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_navigator_app/pages/basic-nav.dart';
import 'package:flutter_navigator_app/pages/navigation_result.dart';
import 'package:flutter_navigator_app/pages/veri_aktarimi.dart';
import 'package:flutter_navigator_app/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.home, //bunlar kullanılırsa home kullanılmaz
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        debugPrint("didpop:$didPop result:$result");
        if (didPop) {
          return;
        }
        var cikilsinmi = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("çıkış"),
              content: Text("çıkmak istediğinize emin misiniz"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text("evet"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text("hayır"),
                ),
              ],
            );
          },
        );
        if (cikilsinmi ?? true) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text("navigator eğitimi"), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            //birden fazla eleman varsa ve taşmasından korkuyorsam scroll özelliği olan listview kullanılabilir.
            children: [
              buildnavigationbutton(
                "temel navigasyon",
                "push ve pop işlemleri",
                () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.basic,
                    arguments: {"id": 5, "isim": "damla", "şehir": "kayseri"},
                  ); //bu kullanılırsa push kullanılmaz material kullanılmaz
                },
              ),

              buildnavigationbutton(
                "veri aktarımı",
                "sayfalar arası veri gönderme",
                () {
                  Navigator.pushNamed(context, AppRoutes.veriaktarim);
                },
              ),
              buildnavigationbutton(
                "geri dönüş değeri",
                "sayfadan veri alma",
                () {
                  Navigator.pushNamed(context, AppRoutes.result);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildnavigationbutton(
    String mytitle,
    String mysubtitle,
    VoidCallback onpressed,
  ) {
    return Card(
      child: ListTile(
        title: Text(mytitle),
        subtitle: Text(mysubtitle),
        trailing: CircleAvatar(
          backgroundColor: Colors.grey.shade50,
          child: Icon(Icons.arrow_forward_ios_rounded),
        ),
        onTap: onpressed,
      ),
    );
  }
}
