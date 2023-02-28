import 'package:flutter/material.dart';
import '../../../utill/dimensions.dart';

class CustomDropdown extends StatefulWidget {
  final bool border;
  late final String hintText;
  final Function(String text) onChanged;
  late List<String> items;

  CustomDropdown({this.hintText="", this.border = true, required this.onChanged,required this.items});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {

  // the selected value
  String? _selectedItem;



  @override
  Widget build(context) {
    //print(widget.items);
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
        value: _selectedItem,
        onChanged:  (value) {
          widget.onChanged(value!);
          setState(() {
            _selectedItem = value;
          });
        },
        hint: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 8.0, right: 0),
            child:  Text(
              widget.hintText,
              style: TextStyle(color: Theme.of(context).primaryColor),
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
        items: widget.items
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
        selectedItemBuilder: (BuildContext context) => widget.items
            .map((e) => Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 8.0),
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
