import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

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

Widget buildText(BuildContext context,{required Color color, required String title, required double font}) {
  return Text(title, style: Theme.of(context).textTheme.titleMedium!.copyWith(
    color: color,
    fontSize: font,
  ),
  );
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final Color bodyColor = Theme.of(context).colorScheme.onBackground;
    final Color appBarColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: buildText( context, color: appBarColor, title: 'Toast Demo', font: 25),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
                onTap: (){
                  showToast('This is normal toast with animation',
                    context: context,
                    animation: StyledToastAnimation.scale,
                    reverseAnimation: StyledToastAnimation.fade,
                    position: StyledToastPosition.center,
                    animDuration: Duration(seconds: 1),
                    duration: Duration(seconds: 4),
                    curve: Curves.elasticOut,
                    reverseCurve: Curves.linear,
                  );
                },
                leading: buildText(context,color: bodyColor, title: 'Red Center Short Toast', font: 20),
            ),
            ListTile(
              onTap: (){
                showToast('This is normal toast with animation',
                  context: context,
                  animation: StyledToastAnimation.slideFromLeftFade,
                  reverseAnimation: StyledToastAnimation.fade,
                  position: const StyledToastPosition(
                      align: Alignment.bottomCenter,
                      offset: 30
                  ),
                  animDuration: const Duration(seconds: 1),
                  duration: const Duration(seconds: 4),
                  curve: Curves.easeInOutCubic,
                  reverseCurve: Curves.linear,
                  backgroundColor: Colors.green
                );
              },
              leading: buildText(context,color: bodyColor, title: 'Green Buttom Short Toast', font: 20),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
