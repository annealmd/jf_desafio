import 'package:flutter/material.dart';
import 'package:jf_desafio/features/register/presenter/pages/widgets/city_form.dart';

import '../../register/presenter/pages/widgets/register_form.dart';

class AppRouter {
  static const String home = '/';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const RegisterForm(),
          // return MaterialPageRoute(
          //   builder: (_) => const HomePage(),
        );
      // case RegisterForm.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => const RegisterForm(),
      //   );
      case CityForm.routeName:
        //final id = int.parse(settings.arguments.toString());
        final id = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => CityForm(id: id),
        );

      // case MedicineEditPage.routeName:
      //   final EditArguments editArguments = settings.arguments as EditArguments;
      //   return MaterialPageRoute(
      //     builder: (_) => MedicineEditPage(
      //         medicine: editArguments.medicine, index: editArguments.index),
      //   );

      default:
        throw Exception('Route not found!');
      // could be an error page as well
    }
  }
}
