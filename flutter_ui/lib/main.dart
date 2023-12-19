import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
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
  _alert(String alertTitle, String alertContent) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
            title: Text(alertTitle),
            content: SizedBox(
              height: 130,
              child: Column(
                children: [
                  const Divider(
                    color: Colors.black,
                  ),
                  Text(alertContent),
                  const SizedBox(
                    height: 7,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.primary),
                        foregroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.secondaryContainer),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: const Text("Close"),
                    ),
                  )
                ],
              ),

            ));
      },
      barrierDismissible: false,
      barrierColor: Theme.of(context).colorScheme.secondaryContainer.withOpacity(.5),
    );

  }

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
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                _alert('Not Implemented.',
                    'This Icon Button has not been implemented yet.');
              },
              icon: const Icon(Icons.add)),
        ],
        sliverBackgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
        sliverList: SliverList(
          delegate: SliverChildBuilderDelegate((context, index){
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              ),
              title: Text('Contact $index'),
              textColor: Theme.of(context).colorScheme.secondaryContainer,
            );
          }),
        ),
      ),
    );
  }
}