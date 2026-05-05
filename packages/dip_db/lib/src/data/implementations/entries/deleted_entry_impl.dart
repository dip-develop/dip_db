import 'dart:typed_data';

import 'package:equatable/equatable.dart';

import '../../interfaces/entries/entries.dart';

base class DeletedEntryImpl extends Equatable  implements Entry<bool> {
  @override
  final bool value;

  DeletedEntryImpl(this.value);

  @override
  int get byteLength => 1;

  @override
  bool deserialize(Uint8List bytes) {
    if (bytes.length != byteLength) {
      throw ArgumentError('Invalid byte length');
    }
    return bytes.first == 1;
  }

  @override
  Uint8List serialize() => Uint8List.fromList([value ? 1 : 0]);
  
  @override
  List<Object?> get props => [value];
}
