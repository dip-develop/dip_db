library;

import 'package:dip_db/src/domain/models/database_preferencies.dart';

import 'package:dip_db/src/domain/models/performance_type.dart';

import 'src/presentation/database.dart' as dip_db;

export 'src/data/implementations/entries/entries.dart';
export 'src/data/interfaces/entries/entries.dart';

final class DipDb implements dip_db.Database {
  final String _dbName;

  DipDb(this._dbName);

  @override
  Future<void> close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  Future<void> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> flush() {
    // TODO: implement flush
    throw UnimplementedError();
  }

  @override
  Future<void> open(
      {DatabasePreferencies preferencies = const DatabasePreferencies(),
      PerformanceType performanceType = PerformanceType.optimized}) {
    // TODO: implement open
    throw UnimplementedError();
  }
}
