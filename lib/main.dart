import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "GridView",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> listPemeran = List();

  var pemain = [
    {"nama": "Bu Tejo", "gambar": "butejo2.png"},
    {"nama": "Dian", "gambar": "dian1.png"},
    {"nama": "Fikri", "gambar": "fikri1.png"},
    {"nama": "Gotrek", "gambar": "gotrek1.jpg"},
    {"nama": "Pak Polisi", "gambar": "polisi.png"},
    {"nama": "Yu Tri", "gambar": "ytri1.jpg"},
    {"nama": "Yu Nah", "gambar": "yunah2.png"},
    {"nama": "Yu Ning", "gambar": "yuning.jpg"},
    {"nama": "Yu Sam", "gambar": "yusam1.jpg"},
    {"nama": "Ayah Fikri", "gambar": "minto2.png"},
  ];

  _buatlist() async {
    for (var i = 0; i < pemain.length; i++) {
      final paraPemain = pemain[i];
      final String gambar = paraPemain['gambar'];

      listPemeran.add(Container(
        padding: EdgeInsets.all(15),
        child: Card(
          elevation: 35,
          color: Colors.blue[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Hero(
                  tag: paraPemain['nama'],
                  child: Material(
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) => DetailPage(
                                  nama: paraPemain['nama'],
                                  gambar: paraPemain['gambar'],
                                )),
                      ),
                      child: Image.asset(
                        "images/$gambar",
                        fit: BoxFit.contain,
                      ),
                    ),
                  )),
              Text(
                paraPemain['nama'],
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Center(child: Text("Galery Pemeran Film Tilik")),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: listPemeran,
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  DetailPage({this.nama, this.gambar, this.namaAsli});
  final String nama;
  final String namaAsli;

  final String gambar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ListView(
        children: [
          Container(
            height: 240.0,
            child: Hero(
              tag: nama,
              child: Material(
                child: InkWell(
                  child: Image.asset("images/$gambar", fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          DetailNama(
            nama: nama,
          ),
        ],
      ),
    );
  }
}

class DetailNama extends StatelessWidget {
  DetailNama({this.nama});
  final String nama;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(
          nama,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Image.asset("images/til.jpg", fit: BoxFit.cover),
        SizedBox(height: 10),
        Text('Tahun Pembuatan : 2019',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Penghargaan: Piala Maya 2018',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Kategori : Film Cerita Pendek Terpilih',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ]),
    );
  }
}
