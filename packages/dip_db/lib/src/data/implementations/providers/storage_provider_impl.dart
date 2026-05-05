import 'dart:io';
import 'dart:typed_data';

import '../../interfaces/providers/storage_provider.dart';

base class StorageProviderImpl implements StorageProvider {
  @override
  Future<void> write(
      {required String filePath,
      required int offset,
      required Uint8List data}) async {
    final file = File(filePath);
    final raf = await file.open(mode: FileMode.write);

    await raf.setPosition(offset);
    await raf.writeFrom(data);

    return raf.close();
  }

  @override
  Future<Uint8List> read(
      {required String filePath,
      required int offset,
      required int length}) async {
    final file = File(filePath);
    final raf = await file.open(mode: FileMode.read);

    await raf.setPosition(offset);
    final data = Uint8List(length);
    await raf.readInto(data);
    await raf.close();

    return data;
  }
}
