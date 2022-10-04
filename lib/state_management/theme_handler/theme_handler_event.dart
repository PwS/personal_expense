part of 'theme_handler_bloc.dart';

abstract class ThemeHandlerEvent extends Equatable {
  const ThemeHandlerEvent();

  @override
  List<Object> get props => [];
}

class LoadSwitchThemeEvent extends ThemeHandlerEvent {}

class SwitchThemeEvent extends ThemeHandlerEvent {
  final AppThemeEnum theme;

  const SwitchThemeEvent(this.theme);

  @override
  List<Object> get props => [theme];
}
