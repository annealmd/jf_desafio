import 'package:flutter/material.dart';

import '../../../domain/domain.dart';

class CityDropdown extends StatelessWidget {
  final List<CityEntity> cityEntityList;
  final void Function(String?)? onChanged;

  CityDropdown({
    super.key,
    required this.cityEntityList,
    this.onChanged,
  });

  late final cityList = <String>[
    ...(cityEntityList.map((e) => e.name).toList())
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      //focusNode: doseFocusNode,
      decoration: InputDecoration(
        labelText: 'Escolha a Cidade:',
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        hintText: 'Selecione',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      icon: Icon(Icons.arrow_drop_down, color: Colors.green[700], size: 40),
      onChanged: onChanged,

      items: cityList.map<DropdownMenuItem<String>>((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e),
        );
      }).toList(),
    );
  }
}
