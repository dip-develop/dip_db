import 'dart:typed_data';

abstract class StorageProvider {
  Future<void> write(
      {required String filePath, required int offset, required Uint8List data});

  Future<Uint8List> read(
      {required String filePath, required int offset, required int length});
}
