part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnDetailPage)
            ? DetailPage(pageState.plant)
            : (pageState is OnMainPage)
                ? MainPage()
                : SplashPage());
  }
}
