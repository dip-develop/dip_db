import 'dart:typed_data';

import 'package:equatable/equatable.dart';

import '../../interfaces/entries/entries.dart';

base class VersionEntryImpl extends Equatable implements Entry<int> {
  @override
  final int value;

  VersionEntryImpl(this.value);

  @override
  int get byteLength => 4;

  @override
  int deserialize(Uint8List bytes) {
    if (bytes.length != byteLength) {
      throw ArgumentError('Invalid byte length');
    }
    return ByteData.sublistView(bytes).getInt32(0);
  }

  @override
  Uint8List serialize() {
    final bytes = ByteData(byteLength);
    bytes.setInt32(0, value);
    return bytes.buffer.asUint8List();
  }

  @override
  List<Object?> get props => [value];
}
