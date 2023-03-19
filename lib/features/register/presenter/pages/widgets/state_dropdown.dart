import 'package:flutter/material.dart';
import '../../../domain/domain.dart';

class StateDropdown extends StatelessWidget {
  final List<StateEntity> stateEntityList;
  final void Function(String?)? onChanged;
  const StateDropdown({
    super.key,
    required this.stateEntityList,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    var stateList = <String>[...(stateEntityList.map((e) => e.name).toList())];

    return DropdownButtonFormField(
      //focusNode: doseFocusNode,
      decoration: InputDecoration(
        labelText: 'Escolha o Estado:',
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

      items: stateList.map<DropdownMenuItem<String>>((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e),
        );
      }).toList(),
    );
  }
}
