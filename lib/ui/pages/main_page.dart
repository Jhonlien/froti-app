part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int? bottomNavBarIndex;
  PageController? pageController;

  @override
  void initState() {
    super.initState();
    bottomNavBarIndex = 0;
    pageController = PageController(initialPage: bottomNavBarIndex!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              bottomNavBarIndex = index;
            });
          },
          children: <Widget>[IndexPage(), SuggestionPage()],
        ),
        bottomNav(),
      ],
    ));
  }

  Widget bottomNav() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            unselectedLabelStyle: TextStyle(fontSize: 12),
            selectedLabelStyle:
                TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            selectedItemColor: mainColor,
            unselectedItemColor: Color(0xFFE5E5E5),
            currentIndex: bottomNavBarIndex!,
            onTap: (index) {
              setState(() {
                bottomNavBarIndex = index;
                pageController?.jumpToPage(bottomNavBarIndex!);
              });
            },
            items: [
              BottomNavigationBarItem(
                  label: "Artikel",
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 16),
                    height: 20,
                    child: Icon((bottomNavBarIndex == 0)
                        ? Icons.home
                        : Icons.home_filled),
                  )),
              BottomNavigationBarItem(
                  label: "Kritik & Saran",
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 16),
                    height: 20,
                    child: Icon((bottomNavBarIndex == 1)
                        ? Icons.question_answer_outlined
                        : Icons.question_answer),
                  ))
            ],
          ),
        ),
      );
}
