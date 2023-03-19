import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';
import '../../../infra/infra.dart';
import '../../presenter.dart';

class CityDropdown extends StatelessWidget {
  final List<CityEntity> cityEntityList;
  final void Function(String?)? onChanged;

  const CityDropdown({
    super.key,
    required this.cityEntityList,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    var cityList = <String>[...(cityEntityList.map((e) => e.name).toList())];

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
