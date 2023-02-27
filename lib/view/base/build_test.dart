import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Kindacode.com',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // define a list of options for the dropdown
  final List<String> _animals = ["Dog", "Cat", "Crocodile", "Dragon"];

  // the selected value
  String? _selectedAnimal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          width: 300,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30)),
          child: DropdownButton<String>(
            value: _selectedAnimal,
            onChanged: (value) {
              setState(() {
                _selectedAnimal = value;
              });
            },
            hint: const Center(
                child: Text(
              'Select the aniaml you love',
              style: TextStyle(color: Colors.white),
            )),
            // Hide the default underline
            underline: Container(),
            // set the color of the dropdown menu
            dropdownColor: Colors.amber,
            icon: const Icon(
              Icons.arrow_downward,
              color: Colors.yellow,
            ),
            isExpanded: true,

            // The list of options
            items: _animals
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          e,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ))
                .toList(),

            // Customize the selected item
            selectedItemBuilder: (BuildContext context) => _animals
                .map((e) => Center(
                      child: Text(
                        e,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.amber,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
