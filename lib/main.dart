import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project33/src/app_localizations.dart';
import 'package:project33/src/bloc/internet_bloc.dart';
import 'package:project33/src/cubit/locale_cubit.dart';
import 'package:project33/src/ui/home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleCubit()..getSavedLanguage(),
        ),
        BlocProvider(
          create: (context) => InternetBloc(),
        ),
      ],
      child: BlocBuilder<InternetBloc, InternetState>(
        builder: (context, state) {
          if (state is ConnectedState) {
            return BlocBuilder<LocaleCubit, LocaleState>(
              builder: (context, state) {
                if (state is ChangeLocalState) {
                  return MaterialApp(
                    supportedLocales: const [
                      Locale('en', 'US'),
                      Locale('ar', '')
                    ],
                    locale: state.locale,
                    localizationsDelegates: [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    localeResolutionCallback: (locale, supportedLocales) {
                      if (locale == null) {
                        return supportedLocales.first;
                      }
                      for (var localeDevice in supportedLocales) {
                        if (localeDevice.languageCode == locale.languageCode) {
                          return localeDevice;
                        }
                      }
                      return null;
                    },
                    home: const HomePage(),
                  );
                } else {
                  return const SizedBox();
                }
              },
            );
          } else {
            return const MaterialApp(
              home: Scaffold(
body: Center(
  child:Text("not connected")
),
              ),
            );
          }
        },
      ),
    );
  }
}
