import 'package:flutter/material.dart';
import '../../../infra/infra.dart';
import '../../presenter.dart';
import 'state_dropdown.dart';

import 'city_dropdown.dart';

class RegisterForm extends StatefulWidget {
   RegisterForm({
    super.key,
  });  


  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  var registerBloc = DependencyInjector().get<RegisterBloc>();
  @override
  void initState() {
    registerBloc.add(GetStateEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          StateDropdown(),
          SizedBox(
            height: 10,
          ),
          CityDropdown(),
        ]);
  }
}