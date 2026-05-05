import 'dart:typed_data';

import 'entries.dart';

abstract interface class DataEntry<K extends Entry, V extends Entry,
    I extends Entry> implements Entry<DataEntry<K, V, I>> {
  final K key;
  final V version;
  final I isDeleted;
  final Uint8List data;

  DataEntry(this.key, this.version, this.isDeleted, this.data);
}
