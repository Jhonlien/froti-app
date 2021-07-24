part of 'pages.dart';

class DetailPage extends StatefulWidget {
  final Plant plant;
  DetailPage(this.plant);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    PlantDetail detail;
    String content = "";
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
          onWillPop: () {
            Navigator.pop(context);
            return Future<bool>.value(false);
          },
          child: FutureBuilder(
              future: PlantServices.getPlantDataDetail(widget.plant),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  detail = snapshot.data as PlantDetail;
                  content = detail.content as String;
                }
                return ListView(children: [
                  Stack(children: <Widget>[
                    Container(
                      height: 270,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  NetworkImage(imageUrl + widget.plant.gambar!),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      height: 271,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment(0, 1),
                              end: Alignment(0, 0.06),
                              colors: [
                            Colors.white,
                            Colors.white.withOpacity(0)
                          ])),
                    ),
                    Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.only(top: 20, left: 20),
                        child: FloatingActionButton(
                            elevation: 2,
                            child: Icon(Icons.arrow_back_ios_new_rounded,
                                color: mainColor),
                            backgroundColor: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            })),
                  ]),
                  SizedBox(height: 10),
                  Center(
                    child: Text(widget.plant.judul!,
                        textAlign: TextAlign.center,
                        style: blackTextFont.copyWith(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: HtmlWidget(
                      content,
                      textStyle: blackTextFont.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ]);
              })),
    );
  }
}
