import 'dart:convert';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';

import '../../interfaces/entries/entries.dart';

base class KeyEntryImpl extends Equatable implements Entry<String> {
  @override
  final String value;

  KeyEntryImpl(this.value);

  @override
  int get byteLength => 16;

  @override
  Uint8List serialize() {
    assert(value.isNotEmpty, 'Key cannot be empty');
/*     assert(value.length == byteLength,
        'Key length must be exactly $byteLength bytes'); */
    final encoded = utf8.encode(value);
    final padded = encoded.length >= byteLength
        ? encoded.sublist(0, byteLength)
        : [...encoded, ...List.filled(byteLength - encoded.length, 0)];
    return Uint8List.fromList(padded);
  }

  @override
  String deserialize(Uint8List bytes) {
    final trimmed = bytes.where((b) => b != 0).toList();
    return utf8.decode(trimmed);
  }

  @override
  List<Object?> get props => [value];
}
