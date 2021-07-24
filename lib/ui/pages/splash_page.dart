part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: mainColor,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Image.asset(
                  "assets/vegan.png",
                  height: 100,
                )),
                Center(
                  child: Text(
                    "FROTI",
                    style: whiteTextFont.copyWith(
                        fontSize: 34,
                        letterSpacing: 3.5,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(child: SpinKitFadingFour(color: Colors.white)),
              ],
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "FROTI adalah Aplikasi Pengetahuan\nTumbuhan Sebagai Obat-obatan yang berfungsi\nsebagai pengetahuan terhadap masyarakat\nterkait dengan tumbuhan sebagai bahan\nobat-obatan tradisional",
                  textAlign: TextAlign.center,
                  style: whiteTextFont.copyWith(
                    fontSize: 16,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
