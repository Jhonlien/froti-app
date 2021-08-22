part of 'pages.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value:
                SystemUiOverlayStyle.light.copyWith(statusBarColor: mainColor),
            child: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(Duration(seconds: 3));
                BlocProvider.of<PlantBloc>(context).add(FetchPlants());
              },
              child: Container(
                color: Colors.white,
                child: ListView(
                  children: [
                    Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(80),
                                bottomRight: Radius.circular(80))),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 100),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child:
                                  Image.asset("assets/vegan.png", height: 50),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Center(
                              child: Text(
                                "FROTI",
                                style: whiteTextFont.copyWith(
                                    fontSize: 34,
                                    letterSpacing: 3.5,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 70, left: 15, right: 15),
                          child: BlocBuilder<PlantBloc, PlantState>(
                            builder: (_, plantState) {
                              if (plantState is PlantLoaded) {
                                List<Plant> plants = plantState.plants;
                                return GridView.builder(
                                    physics: ScrollPhysics(),
                                    gridDelegate:
                                        new SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1,
                                    ),
                                    shrinkWrap: true,
                                    itemCount: plants.length,
                                    itemBuilder: (_, index) {
                                      return Center(
                                        child: Wrap(
                                            spacing: 24,
                                            runSpacing: 24,
                                            children: [
                                              HomeCard(plants[index],
                                                  onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailPage(plants[
                                                                index])));
                                              }),
                                            ]),
                                      );
                                    });
                              } else {
                                return SpinKitFadingFour(color: Colors.white);
                              }
                            },
                          ))
                    ]),
                  ],
                ),
              ),
            )));
  }
}
