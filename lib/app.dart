import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/app_router.dart';
import 'config/injection/injection_container.dart' as di;
import 'theme/app_theme.dart';
import 'features/alarm/presentation/bloc/alarm_bloc.dart';

class AlarmyApp extends StatelessWidget {
  const AlarmyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // MultiBlocProvider makes BLoCs available to the entire app.
      // Any widget below this point can access these BLoCs.
      providers: [
        BlocProvider<AlarmBloc>(
          // sl<AlarmBloc>() gets the AlarmBloc instance from get_it.
          // The 'sl' stands for 'service locator'.
          create: (_) => di.sl<AlarmBloc>()..add(LoadAlarmsEvent()),
        ),
        // We will add more BLoC providers here as we build more features:
        // BlocProvider<MissionBloc>(...),
        // BlocProvider<GamificationBloc>(...),
      ],
      child: MaterialApp.router(
        title: 'Alarmy',
        debugShowCheckedModeBanner: false,

        // Apply our Neumorphism theme
        theme: AppTheme.lightTheme,

        // Use go_router for navigation
        routerConfig: AppRouter.router,
      ),
    );
  }
}
