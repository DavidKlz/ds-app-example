import 'package:flutter/material.dart';

import '../../logic/data/formular_dto.dart';
import '../../view/screens/dyn_mask/dyn_mask_screen.dart';
import '../../view/screens/form_builder/form_builder_screen.dart';
import '../../view/screens/formular/formular_screen.dart';
import '../../view/screens/home/home_screen.dart';
import 'ds_next_routes.dart';

class DsNextRouter {
  DsNextRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case DsNextRoutes.dynMask:
        return _createFadeAnimationRoute(DynMaskScreen(form: settings.arguments as FormularDto));
      case DsNextRoutes.form:
        return _createFadeAnimationRoute(FormularScreen(form: settings.arguments as FormularDto,));
      case DsNextRoutes.formBuilder:
        return _createFadeAnimationRoute(FormBuilderScreen(form: settings.arguments as FormularDto));
      case DsNextRoutes.newForm:
        return _createFadeAnimationRoute(const FormularScreen());
      case DsNextRoutes.home:
      default:
        return _createRoute(const HomeScreen());
    }
  }

  static MaterialPageRoute _createRoute(Widget screen) {
    return MaterialPageRoute(
      builder: (context) => screen,
    );
  }

  static PageRouteBuilder _createFadeAnimationRoute(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (c, a, a2) => screen,
      transitionsBuilder: (context, anim, anim2, child) => FadeTransition(
        opacity: anim,
        child: child,
      ),
      transitionDuration: const Duration(milliseconds: 100),
    );
  }

  static PageRouteBuilder _createSlideAnimationRoute(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (c, a, a2) => screen,
      transitionsBuilder: (c, anim, anim2, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: anim.drive(tween),
          child: child,
        );
      },
    );
  }
}
