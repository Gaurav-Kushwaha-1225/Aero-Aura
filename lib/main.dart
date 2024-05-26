import 'package:aeroaura/screens/settings_page/provider/theme_provider.dart';
import 'package:aeroaura/utils/routes.dart';
import 'package:aeroaura/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AeroAura());
}

class AeroAura extends StatelessWidget {
  const AeroAura({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp
      ]);
    return ChangeNotifierProvider(
      create: (BuildContext context) => ThemeProvider()..init(),
      child: Consumer<ThemeProvider>(
        builder: (context, ThemeProvider notifier, child) {
          return MaterialApp.router(
            themeMode: notifier.isDark? ThemeMode.dark : ThemeMode.light,
            theme: AeroTheme.lightTheme,
            darkTheme: AeroTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            routerConfig: AeroAuraRouter().router,
          );
        }
      ),
    );
  }
}
