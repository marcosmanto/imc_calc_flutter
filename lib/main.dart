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
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  final ScrollController _controller = ScrollController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = 'Informe seus dados acima';

  void _scrollDown() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: const Duration(milliseconds: 1350),
      curve: Curves.easeOutExpo,
    );
  }

  void _resetFields() {
    weightController.clear();
    heightController.clear();
    setState(() => _infoText = '');
  }

  void _calculate() {
    double weight = double.tryParse(weightController.text) ?? 0;
    double height = double.tryParse(heightController.text) ?? 0;
    height = height / 100; // height in meters not cm
    double imc = weight / (height * height);
    if (imc < 18.60) {
      _infoText = 'Abaixo do peso (${imc.toStringAsPrecision(4)})';
    } else if (imc >= 18.6 && imc < 24.9) {
      _infoText = 'Peso ideal (${imc.toStringAsPrecision(4)})';
    } else if (imc >= 24.9 && imc < 29.9) {
      _infoText = 'Levemente acima do peso (${imc.toStringAsPrecision(4)})';
    } else if (imc >= 29.9 && imc < 34.9) {
      _infoText = 'Obesidade Grau I (${imc.toStringAsPrecision(4)})';
    } else if (imc >= 34.9 && imc < 40) {
      _infoText = 'Obesidade Grau II (${imc.toStringAsPrecision(4)})';
    } else if (imc >= 40) {
      _infoText = 'Obesidade Grau III (${imc.toStringAsPrecision(4)})';
    }
    setState(() {});
    Future(_scrollDown);
  }

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
              child: IconButton(
                  onPressed: _resetFields, icon: Icon(Icons.refresh)),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: _controller,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 22),
        child: Form(
          key: _formKey,
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
              TextFormField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorStyle: TextStyle(fontSize: 22),
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
                validator: (value) {
                  if (value!.isEmpty) return 'Insira seu peso.';
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorStyle: TextStyle(fontSize: 22),
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
                validator: (value) {
                  if (value!.isEmpty) return 'Insira sua altura.';
                },
              ),
              Container(
                height: 50,
                margin: EdgeInsets.only(top: 30, bottom: 45),
                child: ElevatedButton(
                    /*style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),*/
                    onPressed: () {
                      setState(() => _infoText = '');
                      if (_formKey.currentState!.validate()) {
                        _calculate();
                      }
                    },
                    child: Text(
                      'Calcular',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
              ),
              if (_infoText.isNotEmpty)
                Container(
                  constraints: BoxConstraints(minHeight: 80),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _infoText == 'Informe seus dados acima'
                            ? Icons.arrow_circle_up_outlined
                            : Icons.info_outline_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _infoText,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
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
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
