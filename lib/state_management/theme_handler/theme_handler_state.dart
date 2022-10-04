part of 'theme_handler_bloc.dart';

class ThemeHandlerState extends Equatable {
  final AppThemeEnum appTheme;

  const ThemeHandlerState({required this.appTheme});

  @override
  List<Object> get props => [appTheme];
}

class ThemeHandlerInitial extends ThemeHandlerState {
  const ThemeHandlerInitial({required AppThemeEnum appTheme})
      : super(appTheme: appTheme);
}
