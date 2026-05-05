import 'package:dip_db/src/domain/models/models.dart';

import '../domain/interfaces/serializable.dart';

abstract interface class Database<T extends Serializable> {
  // Opens the database.
  Future<void> open({
    DatabasePreferencies preferencies = const DatabasePreferencies(),
    PerformanceType performanceType = PerformanceType.optimized,
  });
  // Delete unsaved changes.
  Future<void> flush();
  // Closes the database connection.
  Future<void> close();
  // Deletes the database file.
  Future<void> delete();
}
