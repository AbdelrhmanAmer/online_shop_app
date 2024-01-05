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

                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red,
                    ),
                  ),
                  confirmDismiss: (direction)async{
                    return await confirmAlert(
                        'Delete Contact', 'Are you sure that you want to delete this contact?',
                        _contacts[index]
                    );
                  },
                  
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                    title: Text('Contact ${_contacts[index]}'),
                    textColor: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                );
              }),
        ),
      ),
    );
  }
  confirmAlert(alertTitle, alertContent, int value)async{
    return showDialog(
        context: context,
        builder: (ctx){
          return AlertDialog(
            title: Text(alertTitle),
            content: SizedBox(
              height: 150,
              child: Column(
                children: [
                  const Divider(color: Colors.black,),
                  Text(alertContent),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pop(true);
                    _contacts.remove(value);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                        SnackBar(
                          content: Text("Contact $value deleted"),
                          duration: const Duration(seconds: 3),
                          action: SnackBarAction(
                            onPressed: (){
                              setState(() {
                                _contacts.add(value);
                              });
                              // Navigator.of(context).pop(false);
                            },
                            label: "Undo",
                          ),
                        )
                    );
                    // _contacts.removeAt(value);
                  },
                  child: const Text("YES")),
              ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pop(false);
                  },
                  child: const Text("NO")),
            ],
          );
        });
  }
}