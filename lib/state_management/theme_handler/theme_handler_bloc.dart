import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:personal_expense/models/app_theme/app_theme_enum.dart';
import 'package:personal_expense/services/theme_handler/theme_handler_service.dart';
import 'package:equatable/equatable.dart';

part 'theme_handler_event.dart';

part 'theme_handler_state.dart';

class ThemeHandlerBloc extends Bloc<ThemeHandlerEvent, ThemeHandlerState> {
  ThemeHandlerBloc({required ThemeHandlerService themeHandlerService})
      : _themeHandlerService = themeHandlerService,
        super(const ThemeHandlerInitial(appTheme: AppThemeEnum.light)) {
    on<LoadSwitchThemeEvent>(_onLoadSwitchThemeEvent);
    on<SwitchThemeEvent>(_onSwitchEvent);
  }

  final ThemeHandlerService _themeHandlerService;

  FutureOr<void> _onLoadSwitchThemeEvent(
      LoadSwitchThemeEvent event, Emitter<ThemeHandlerState> emit) async {
    try {
      final AppThemeEnum valueAppTheme =
          await _themeHandlerService.getAppTheme();
      emit(ThemeHandlerState(appTheme: valueAppTheme));
    } catch (_) {
      emit(const ThemeHandlerState(appTheme: AppThemeEnum.light));
    }
  }

  FutureOr<void> _onSwitchEvent(
      SwitchThemeEvent event, Emitter<ThemeHandlerState> emit) async {
    try {
      final AppThemeEnum valueAppTheme =
          await _themeHandlerService.changeAppTheme(event.theme);
      emit(ThemeHandlerState(appTheme: valueAppTheme));
    } catch (_) {
      emit(const ThemeHandlerState(appTheme: AppThemeEnum.light));
    }
  }
}
