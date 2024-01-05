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
  final _contacts = List<int>.generate(15, (index) => index+1);
  // _snackBar(String message, Function() onUndo){
  //   ScaffoldMessenger.of(context).
  //   showSnackBar(
  //       SnackBar(
  //         content: Text(message),
  //         backgroundColor: Colors.red,
  //         dismissDirection: DismissDirection.startToEnd,
  //         duration: const Duration(seconds: 3),
  //         action: SnackBarAction(
  //           textColor: Colors.black,
  //           onPressed: onUndo,
  //           label: "Undo",
  //         ),
  //       ),
  //   );
  // }

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
                    return await confirmAlert('Delete Contact', 'Are you sure that you want to delete this contact?', index);
                  },
                  

                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                    title: Text('Contact $index'),
                    textColor: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                );
              }),
        ),
      ),
    );
  }
  confirmAlert(alertTitle, alertContent, int index)async{
    return showDialog(
        context: context,
        builder: (ctx){
          return AlertDialog(
            title: Text(alertTitle),
            content: SizedBox(
              height: 150,
              child: Column(
                children: [
                  Divider(color: Colors.black,),
                  Text(alertContent),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pop(true);
                    _contacts.removeAt(index-1);
                    print(_contacts);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                        SnackBar(
                          content: Text("Contact $index deleted"),
                          duration: const Duration(seconds: 3),
                          action: SnackBarAction(
                            onPressed: (){
                              _contacts.insert(index, index);
                              print(_contacts);
                              // Navigator.of(context).pop(false);
                            },
                            label: "Undo",
                          ),
                        )
                    );
                    // _contacts.removeAt(index);
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