import 'package:flutter/material.dart';
import 'package:pearpin/data/theme_provider.dart';
import 'package:pearpin/pages/home_page.dart';
import 'package:pearpin/service/startup_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StartupService.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ],
    child: const PearPin(),
  ));
}

class PearPin extends StatelessWidget {
  const PearPin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<ThemeProvider>().theme,
      home: HomePage(),
    );
  }
}
