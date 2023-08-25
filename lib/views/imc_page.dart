import 'package:flutter/material.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC'),
        backgroundColor: Colors.amber,
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(8),
                      icon: Icon(Icons.accessibility_new_outlined),
                      label: Text('Altura'),
                      suffix: Text('Altura'),
                      suffixIcon: Icon(Icons.add_a_photo),
                      prefix: Text('Flutter - '),
                      hintText: 'Informe sua altura',
                      hintStyle:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                    ),
                  ),
                ),
              ], //children
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
          ], //children
        ),
      ),
    );
  } //widget build
} //class _ImcPageState
