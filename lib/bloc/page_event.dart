part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToDetailPage extends PageEvent {
  final Plant plant;
  GoToDetailPage(this.plant);
  @override
  List<Object> get props => [plant];
}
