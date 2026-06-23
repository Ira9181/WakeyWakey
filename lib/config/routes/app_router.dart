import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/alarm/presentation/pages/alarm_home_page.dart';
import '../../features/alarm/presentation/pages/add_alarm_page.dart';
import '../../core/constants/route_constants.dart';

class AppRouter {
  /// [router] is the single GoRouter instance used throughout the app.
  static final GoRouter router = GoRouter(
    initialLocation: RouteConstants.home,
    debugLogDiagnostics: true, // Logs navigation events in debug mode
    routes: [
      GoRoute(
        path: RouteConstants.home,
        name: 'home',
        builder: (context, state) => const AlarmHomePage(),
      ),
      GoRoute(
        path: RouteConstants.addAlarm,
        name: 'add-alarm',
        builder: (context, state) => const AddAlarmPage(),
      ),
      GoRoute(
        path: '${RouteConstants.editAlarm}/:id',
        name: 'edit-alarm',
        builder: (context, state) {
          // Extract the alarm ID from the route path
          final alarmId = state.pathParameters['id']!;
          return AddAlarmPage(alarmId: alarmId);
        },
      ),
    ],
    // Error page shown when a route is not found
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.error}'),
      ),
    ),
  );
}