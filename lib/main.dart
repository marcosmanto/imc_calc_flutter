import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(primary: Colors.green, secondary: Colors.purple[400]),
    ),
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('IMC Calculator'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: Icon(
                Icons.person_outline,
                size: 75,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Peso (Kg)',
                labelStyle: TextStyle(color: primaryColor),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                    width: 3,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 6,
                  ),
                ),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Altura (cm)',
                labelStyle: TextStyle(color: primaryColor),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                    width: 3,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 6,
                  ),
                ),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(top: 60, bottom: 15),
              child: ElevatedButton(
                  /*style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),*/
                  onPressed: () {},
                  child: Text(
                    'Calcular',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
            ),
            Container(
              constraints: BoxConstraints(minHeight: 100),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Row(
                children: [
                  Icon(Icons.info_outline_rounded,
                      color: Colors.white, size: 32),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Info',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
