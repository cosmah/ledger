import 'package:fluent_ui/fluent_ui.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

    //root widget
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'LEDGER',
      theme: FluentThemeData(

        accentColor: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const NavigationView(
      content: Center(
        child: Icon(
            FluentIcons.f12_dev_tools,
            size: 40,
        ),

      ),
    );
  }
}
