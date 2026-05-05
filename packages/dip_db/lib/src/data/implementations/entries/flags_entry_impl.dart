import 'dart:typed_data';

import 'package:equatable/equatable.dart';

import '../../interfaces/entries/entries.dart';

base class FlagsEntryImpl extends Equatable implements FlagsEntry {
  @override
  final bool isCompressed;
  @override
  final bool isEncrypted;
  @override
  final bool isWAL;
  @override
  final bool isVersioned;
  @override
  final bool isEndianness;

  @override
  FlagsEntry get value => FlagsEntryImpl(
        isCompressed: isCompressed,
        isEncrypted: isEncrypted,
        isWAL: isWAL,
        isVersioned: isVersioned,
        isEndianness: isEndianness,
      );

  @override
  int get byteLength => 8;

  FlagsEntryImpl(
      {required this.isCompressed,
      required this.isEncrypted,
      required this.isWAL,
      required this.isVersioned,
      required this.isEndianness});

  @override
  FlagsEntry deserialize(Uint8List bytes) {
    if (bytes.length != byteLength) {
      throw ArgumentError('Invalid byte length');
    }
    return FlagsEntryImpl(
      isCompressed: bytes[1] == 1,
      isEncrypted: bytes[2] == 1,
      isWAL: bytes[3] == 1,
      isVersioned: bytes[5] == 1,
      isEndianness: bytes[6] == 1,
    );
  }

  @override
  Uint8List serialize() => Uint8List.fromList([
        0,
        isCompressed ? 1 : 0,
        isEncrypted ? 1 : 0,
        isWAL ? 1 : 0,
        0,
        isVersioned ? 1 : 0,
        isEndianness ? 1 : 0,
        0,
      ]);

  @override
  List<Object?> get props => [
        isCompressed,
        isEncrypted,
        isWAL,
        isVersioned,
        isEndianness,
      ];
}
