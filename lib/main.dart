import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  List<String> sorular = [
    "pi sayısının yaklaşıl değeri 3,14 tür",
    "dünya düzdür",
    "dünyanın en büyük takımı fenerbahçedir",
    "dünyanın en uzun binası 818 metredir",
    "dünyanın en yüksek dağının yüksekliği 8848 metredir",
    "balinalar balıktır",
    "yarasalar memeli hayvanlardır",
    " sorularınız bitti"
  ];
  List<Widget> dyler = [];
  int sorututan = 0;
  String dogrucevaplar = "dydydyd";
  int puan = 0;
  String alinancevaplar;
  @override
  void initState() {
    super.initState();
    alinancevaplar = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00B2FF),
      appBar: AppBar(
        title: Text(
          "bilgi yarışması",
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF09A0E0),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              sorular[sorututan],
              style: TextStyle(fontSize: 22.0),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text("verdiginiz cevaplar=$alinancevaplar"),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "puanınız=$puan",
            style: TextStyle(fontSize: 25.0),
          ),
          SizedBox(
            height: 220.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: dyler,
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                  onPressed: () {
                    setState(() {
                      if (sorututan < sorular.length - 1) {
                        // burda -1 demememin sebebi dizilerde 0 dan saymaya başlar ama uzunluğu icindeki eleman sayısı kadar
                        alinancevaplar += "d";
                        sorututan++;
                        print(sorututan);
                        if (alinancevaplar[sorututan - 1] ==
                            dogrucevaplar[sorututan - 1]) {
                          // if in içinde -1 dememin sebebi ilk olarak sorututan artıyor yani sorututan 0 dan 1 oluyor
                          // -1 yazmasaydım sadece 0. elemanı dolu olan diziden 1. elemanı isticektim ve buda bana hata verirdi
                          // -1 yazarak ilk alinancevaplar stringine ekledim sonra 0. elemanını sorguladım
                          puan += 10;
                          dyler.add(dogruyanlisekle("d"));
                        } else {
                          dyler.add(dogruyanlisekle("y"));
                        }
                      }
                    });
                  },
                  color: Color(0xFF3B9C62),
                  child: Text(
                    "doğru",
                  )),
              SizedBox(
                width: 40.0,
              ),
              FlatButton(
                  onPressed: () {
                    setState(() {
                      if (sorututan < sorular.length - 1) {
                        alinancevaplar += "y";
                        sorututan++;
                        print(sorututan);
                        if (alinancevaplar[sorututan - 1] ==
                            dogrucevaplar[sorututan - 1]) {
                          puan += 10;
                          dyler.add(dogruyanlisekle("d"));
                        } else {
                          dyler.add(dogruyanlisekle("y"));
                        }
                      }
                    });
                  },
                  color: Color(0xFFE07F7F),
                  child: Text("yanlış")),
            ],
          )
        ],
      ),
    );
  }

  Widget dogruyanlisekle(String alinanharf) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 5.0),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: alinanharf == "d" ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
