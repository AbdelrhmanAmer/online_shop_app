// Component: Abstract base class for both leaf and composite elements
import 'dart:developer';

import 'package:flutter/material.dart';

abstract class DocumentElement{
  Widget render();
}
// leaf: Represents a simple element, like a text element
class TextElement extends DocumentElement{
  String text;

  TextElement(this.text);

  @override
  Widget render(){
    return SelectableText(
        text,
      showCursor: true,
      cursorWidth: 5,
      contextMenuBuilder: (BuildContext context, EditableTextState editableTextState){
          return AdaptiveTextSelectionToolbar.buttonItems(
              buttonItems: <ContextMenuButtonItem>[
                ...editableTextState.contextMenuButtonItems,
                ContextMenuButtonItem(
                    onPressed: (){
                      ContextMenuController.removeAny();
                      log("you have printed this value");
                    },
                  label: "print"
                )
              ],
              anchors: editableTextState.contextMenuAnchors
          );
      },
    );
  }
}
// Composite: Represents a composite element, a paragraph containing multiple text
class Paragraph extends DocumentElement{
  final List<DocumentElement> _elements = [];

  void addElement(DocumentElement element){
    _elements.add(element);
  }

  @override
  Widget render(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _elements.map((element)=>element.render()).toList(),
    );
  }
}

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    // creating leaf elements
    var text1 = TextElement("this is a simple text element.");
    var text2 = TextElement("Another text element.");

    // creating a composite element (paragraph) and adding leaf elements to it.
    var paragraph = Paragraph();
    paragraph.addElement(text1);
    paragraph.addElement(text2);

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('Composite Pattern'),
            leading: const Icon(Icons.home),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.primaryContainer,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                paragraph.render(),
                text1.render(),
              ],
            ),
          )
      ),
    );
  }
}