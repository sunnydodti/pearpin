import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pearpin/data/theme_provider.dart';
import 'package:pearpin/service/password_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _generatePassword();
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _buildAppBar(),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: Container(
          padding: EdgeInsets.all(24),
          color: Theme.of(context).colorScheme.background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPasswordBox(),
              SizedBox(
                height: 20,
              ),
              _buildRefreshButton(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    Icon icon = Theme.of(context).brightness == Brightness.light
        ? Icon(Icons.light_mode_outlined)
        : Icon(Icons.dark_mode_outlined);
    return AppBar(
      title: Text("PearPin"),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () => context.read<ThemeProvider>().toggleTheme(),
            icon: icon),
      ],
    );
  }

  Widget _buildPasswordBox() {
    return Row(
      children: [
        Expanded(
            child: TextField(
          controller: _passwordController,
          readOnly: true,
        )),
        IconButton(
          icon: Icon(Icons.copy_outlined),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: _passwordController.text));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Copied to clipboard"),
            ));
          },
        )
      ],
    );
  }

  _generatePassword() {
    String password = PasswordService.generatePassword();
    setState(() => _passwordController.text = password);
  }

  Widget _buildRefreshButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: _generatePassword, child: Icon(Icons.refresh_outlined)),
    );
  }
}
