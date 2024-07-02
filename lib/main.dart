import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('hi')],
      path: 'assets/translation',
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      startLocale: const Locale('hi'),
      useFallbackTranslations: true,
      saveLocale: true,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Localization'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  changeLanguage(lang) {
    setState(() {
      context.setLocale(Locale(lang));
      print(lang);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Hello'.tr(),style: const TextStyle(fontSize: 24),),
            Text('This is an example of multi language support in Flutter'.tr(), style: const TextStyle(fontSize: 18), textAlign: TextAlign.center),
            Column(
              children: [
                Text('You have pushed the button this many times:'.tr(), style: const TextStyle(fontSize: 16)),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 100,)
              ],
            ),
           
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: FloatingActionButton(
              onPressed: () => changeLanguage('en'),
              tooltip: 'Increment',
              child: const Text("English"),
            ),
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => changeLanguage('hi'),
            tooltip: 'Increment',
            child: const Text("Hindi"),
          ),
        ],
      ),
    );
  }
}
