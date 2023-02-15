// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'dart:ui' as ui;

import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.setTitle('Ledger');
    await windowManager.setTitleBarStyle(TitleBarStyle.normal);
    await windowManager.setBackgroundColor(Colors.transparent);
    await windowManager.setSize(const Size(755, 545));
    await windowManager.setMinimumSize(const Size(755, 545));
    await windowManager.center();
    await windowManager.show();
    await windowManager.setSkipTaskbar(false);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //root widget
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: "Ledger",
      theme: FluentThemeData(
          brightness: Brightness.light, accentColor: Colors.orange),
      darkTheme: FluentThemeData(
          brightness: Brightness.dark, accentColor: Colors.orange),
      home: const HomePage(title: "Ledger"),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required String title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WindowListener {
  final viewkey = GlobalKey();

  @override
  void initState(){
    windowManager.addListener(this);
    super.initState();
  }
  
  @override
  void dispose(){
    windowManager.removeListener(this);
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Text('');
  }

  @override
  void onWindowClose() async {
    bool _isPreventClose = await windowManager.isPreventClose();
    if (_isPreventClose){
      showDialog(context: context, builder: (_) {
        return ContentDialog(
          title: const Text('Confirm close'),
          content: const Text('Are you sure you want to close the app?'),
          actions: [
            FilledButton(child: const Text('Yes'), onPressed: () {
              Navigator.pop(context);
              windowManager.destroy();
            },
            ),
            FilledButton(child: const Text('No'), onPressed: () {
              Navigator.pop(context);
            })
          ],
        );
      });
    }
  }
}
