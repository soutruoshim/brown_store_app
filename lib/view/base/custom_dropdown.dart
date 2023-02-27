import 'package:flutter/material.dart';
import '../../../utill/dimensions.dart';

class CustomDropdown extends StatefulWidget {
  final bool border;
  late final String hintText;
  CustomDropdown({this.hintText="", this.border = true});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final List<String> _animals = ["Cashier AM 3", "Cashier AM 4", "Cashier AM 5", "Cashier AM 6"];
  // the selected value
  String? _selectedAnimal;



  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      width: double.infinity,
      height: 43,
      decoration: BoxDecoration(
        border: widget.border
            ? Border.all(
                width: 1, color: Theme.of(context).hintColor.withOpacity(.35))
            : null,
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
      ),
      child: DropdownButton<String>(
        value: _selectedAnimal,
        onChanged: (value) {
          setState(() {
            _selectedAnimal = value;
          });
        },
        hint: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 8.0, right: 0),
            child: Text(
              'Select Account',
              style: TextStyle(color: Color(0xffcc9900)),
            )),
        // Hide the default underline
        underline: Container(margin: EdgeInsets.zero,),
        // set the color of the dropdown menu
        dropdownColor: Colors.white,
        icon: const Icon(
          Icons.arrow_drop_down_circle_outlined,
          color: Color(0xffcc9900),
        ),
        isExpanded: true,

        // The list of options
        items: _animals
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      e,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ))
            .toList(),

        // Customize the selected item
        selectedItemBuilder: (BuildContext context) => _animals
            .map((e) => Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 8.0),
                  child: Text(
                    e,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xffcc9900),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
