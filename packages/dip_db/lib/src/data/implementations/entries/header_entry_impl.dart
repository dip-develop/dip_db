import 'dart:typed_data';

import 'package:dip_db/src/data/implementations/entries/flags_entry_impl.dart';
import 'package:equatable/equatable.dart';

import '../../interfaces/entries/entries.dart' show HeaderEntry;
import 'entries.dart';

base class HeaderEntryImpl extends Equatable
    implements HeaderEntry<KeyEntryImpl, VersionEntryImpl, FlagsEntryImpl> {
  @override
  final KeyEntryImpl key;

  @override
  final VersionEntryImpl version;

  @override
  final FlagsEntryImpl flags;

  @override
  final int indexOffset;

  @override
  int get reserved => 1;

  @override
  int get byteLength =>
      key.byteLength + version.byteLength + flags.byteLength + 1 + reserved;

  HeaderEntryImpl(this.key, this.version, this.flags, this.indexOffset) {
    if (key.byteLength <= 0) {
      throw ArgumentError('Key byte length must be greater than zero');
    }
    if (version.byteLength <= 0) {
      throw ArgumentError('Version byte length must be greater than zero');
    }
    if (flags.byteLength <= 0) {
      throw ArgumentError('Flags byte length must be greater than zero');
    }
  }

  @override
  HeaderEntry<KeyEntryImpl, VersionEntryImpl, FlagsEntryImpl> get value =>
      HeaderEntryImpl(key, version, flags, indexOffset);

  @override
  HeaderEntryImpl deserialize(Uint8List bytes) {
    if (bytes.length < byteLength) {
      throw ArgumentError('Byte length is less than expected');
    }
    final keyBytes = bytes.sublist(0, key.byteLength);
    final versionBytes =
        bytes.sublist(key.byteLength, key.byteLength + version.byteLength);
    final flagsBytes = bytes.sublist(key.byteLength + version.byteLength,
        key.byteLength + version.byteLength + flags.byteLength);
    final flagsData = flags.deserialize(flagsBytes);
    return HeaderEntryImpl(
      KeyEntryImpl(key.deserialize(keyBytes)),
      VersionEntryImpl(version.deserialize(versionBytes)),
      FlagsEntryImpl(
        isCompressed: flagsData.isCompressed,
        isEncrypted: flagsData.isEncrypted,
        isWAL: flagsData.isWAL,
        isVersioned: flagsData.isVersioned,
        isEndianness: flagsData.isEndianness,
      ),
      indexOffset,
    );
  }

  @override
  Uint8List serialize() {
    return Uint8List.fromList(
      key.serialize() +
          version.serialize() +
          flags.serialize() +
          Uint8List.fromList([indexOffset]) +
          Uint8List(reserved),
    );
  }

  @override
  List<Object?> get props => [
        key,
        version,
        flags,
        indexOffset,
      ];
}
