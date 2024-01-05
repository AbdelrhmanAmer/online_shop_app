import 'package:flutter/material.dart';
import 'package:flutter_ui/one_ui_nested_scroll_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _contacts = [0, 1, 2, 3, 4 , 5, 6, 7, 8, 9, 10, 11, 12];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OneUiNestedScrollView(
        // expandedHeight: 400,
        // toolbarHeight: 200,
        expandedWidget: const Text(
          'Contacts',
          style: TextStyle(fontSize: 30),
        ),
        collapsedWidget: const Text(
          'Contacts',
          style: TextStyle(fontSize: 20),
        ),
        leadingIcon: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.menu),
        ),
        boxDecoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton( onPressed: () {}, icon: const Icon(Icons.add)),
        ],
        sliverBackgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
        sliverList: SliverList(
          delegate: SliverChildBuilderDelegate(
              childCount: _contacts.length,
                  (context, index){
                return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                    onTap: (){},
                    title: Text('Contact ${_contacts[index]}'),
                    textColor: Theme.of(context).colorScheme.secondaryContainer,
                  );
              }),
        ),
      ),
    );
  }
}