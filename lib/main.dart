import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:personal_expense/db/database.dart';
import 'package:personal_expense/services/theme_handler/theme_handler_service.dart';
import 'package:personal_expense/state_management/theme_handler/theme_handler_bloc.dart';
import 'package:personal_expense/utils/config/app_theme.dart';
import 'package:personal_expense/utils/config/bloc_observer.dart';
import 'package:personal_expense/utils/constant/assets_path.dart';
import 'package:personal_expense/utils/constant/constant_value.dart';
import 'package:personal_expense/models/app_theme/app_theme_enum.dart';
import 'package:personal_expense/utils/router_generator/router_generator.dart';
import 'package:personal_expense/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Database.initHive();

  ///Zoned Errors
  //ignore: deprecated_member_use
  BlocOverrides.runZoned(
        () async {
      await EasyLocalization.ensureInitialized();
      runZonedGuarded(
        /// Lock device orientation to portrait & Default StatusBar Colors
            () {
          SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
              statusBarColor: ColourPalette.primary));
          runApp(EasyLocalization(
              supportedLocales: const [Locale('en-US'), Locale('id')],
              fallbackLocale: const Locale('id'),
              useOnlyLangCode: true,
              path: AssetsPath.pathTranslations,
              child: const MyAppMobile()));
        },
            (error, stackTrace) async {
          ///TODO Handle Error Purpose Outside of Zoned
        },
      );
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyAppMobile extends StatelessWidget {
  const MyAppMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ThemeHandlerService(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ThemeHandlerBloc(
                  themeHandlerService: context.read<ThemeHandlerService>())
                ..add(LoadSwitchThemeEvent())),
        ],
        child: BlocBuilder<ThemeHandlerBloc, ThemeHandlerState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: ConstantValue.titleApps.tr(),
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              locale: context.locale,
              theme: state.appTheme == AppThemeEnum.light
                  ? AppThemes.appThemeData[AppThemeEnum.light]
                  : AppThemes.appThemeData[AppThemeEnum.dark],
              onGenerateRoute: RouterGenerator.onGenerateRoute,
            );
          },
        ),
      ),
    );
  }
}
