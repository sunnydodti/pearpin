import 'package:flutter/material.dart';
import 'package:pearpin/data/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [Text("gbfn")],
      ),
    );
  }

  AppBar _buildAppBar() {
    Icon icon = Theme.of(context).brightness == Brightness.light
        ? Icon(Icons.light_mode_outlined)
        : Icon(Icons.dark_mode_outlined);
    return AppBar(
      title: Text("Currency Exchange"),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
            icon: icon),
      ],
    );
  }
}
