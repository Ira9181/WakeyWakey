import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/alarm/data/datasources/alarm_local_datasource.dart';
import '../../features/alarm/data/models/alarm_model.dart';
import '../../features/alarm/data/repositories/alarm_repository_impl.dart';
import '../../features/alarm/domain/repositories/alarm_repository.dart';
import '../../features/alarm/domain/usecases/create_alarm.dart';
import '../../features/alarm/domain/usecases/delete_alarm.dart';
import '../../features/alarm/domain/usecases/get_alarms.dart';
import '../../features/alarm/domain/usecases/update_alarm.dart';
import '../../features/alarm/presentation/bloc/alarm_bloc.dart';

/// [sl] stands for Service Locator.
/// This is our global registry of all app dependencies.
final sl = GetIt.instance;

/// [init] registers everything in the correct order:
/// 1. External (database, http client)
/// 2. Data sources
/// 3. Repositories
/// 4. Use cases
/// 5. BLoCs
Future<void> init() async {
  // ─── External ──────────────────────────────────────────────────

  // Open the Isar database with all collection schemas.
  // [registerLazySingleton] means: create this only when first requested.
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [AlarmModelSchema],  // We will add more schemas as we build features
    directory: dir.path,
  );
  sl.registerLazySingleton<Isar>(() => isar);

  // ─── Data Sources ──────────────────────────────────────────────

  // AlarmLocalDatasource talks directly to the Isar database.
  sl.registerLazySingleton<AlarmLocalDatasource>(
    () => AlarmLocalDatasourceImpl(isar: sl()),
  );

  // ─── Repositories ──────────────────────────────────────────────

  // AlarmRepository is the abstract contract.
  // AlarmRepositoryImpl is the actual implementation.
  // The BLoC only knows about the abstract — this allows swapping
  // implementations (e.g., remote API) without changing the BLoC.
  sl.registerLazySingleton<AlarmRepository>(
    () => AlarmRepositoryImpl(localDatasource: sl()),
  );

  // ─── Use Cases ─────────────────────────────────────────────────

  // Each use case represents ONE action your app can perform.
  sl.registerLazySingleton(() => GetAlarms(sl()));
  sl.registerLazySingleton(() => CreateAlarm(sl()));
  sl.registerLazySingleton(() => UpdateAlarm(sl()));
  sl.registerLazySingleton(() => DeleteAlarm(sl()));

  // ─── BLoCs ─────────────────────────────────────────────────────

  // [registerFactory] means: create a NEW instance every time.
  // BLoCs should be factories, not singletons, because they hold state.
  sl.registerFactory(
    () => AlarmBloc(
      getAlarms: sl(),
      createAlarm: sl(),
      updateAlarm: sl(),
      deleteAlarm: sl(),
    ),
  );
}