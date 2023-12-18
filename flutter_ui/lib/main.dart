import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final Color bodyColor = Theme.of(context).colorScheme.onBackground;
    final Color appBarColor = Theme.of(context).colorScheme.primary;
    var i = 0;
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: [
            // App bar
            SliverAppBar(
              stretch: true,
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: 200,
              shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60)
                )
              ),
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'Flutter Map',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                background: Image.network(
                  'https://img.freepik.com/free-photo/sea-texture-background_181624-26872.jpg?w=740&t=st=1702911034~exp=1702911634~hmac=83e6d229ca78d7089a2f1237941b08700e3b2431972046d9dbd879fce3068175',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index){
                        return ListTile(
                          onTap: (){},
                          title: Text('item ${i++}'),
                        );
                    }
                ),
            ),
          ],
        ),
      ),
    );
  }
}
