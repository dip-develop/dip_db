import 'dart:typed_data';

import 'package:equatable/equatable.dart';

import '../../interfaces/entries/entries.dart' show DataEntry;
import 'entries.dart';

base class DataEntryImpl extends Equatable
    implements DataEntry<KeyEntryImpl, VersionEntryImpl, DeletedEntryImpl> {
  @override
  final KeyEntryImpl key;

  @override
  final VersionEntryImpl version;

  @override
  final DeletedEntryImpl isDeleted;

  @override
  final Uint8List data;

  @override
  int get byteLength =>
      key.byteLength +
      version.byteLength +
      isDeleted.byteLength +
      data.lengthInBytes;

  DataEntryImpl(
      {required this.key,
      required this.version,
      required this.isDeleted,
      required this.data}) {
    if (data.isEmpty) {
      throw ArgumentError('Data cannot be empty');
    }
    if (key.byteLength <= 0) {
      throw ArgumentError('Key byte length must be greater than zero');
    }
    if (version.byteLength <= 0) {
      throw ArgumentError('Version byte length must be greater than zero');
    }
  }

  @override
  DataEntry<KeyEntryImpl, VersionEntryImpl, DeletedEntryImpl> get value =>
      DataEntryImpl(
          key: key, version: version, isDeleted: isDeleted, data: data);

  @override
  DataEntryImpl deserialize(Uint8List bytes) {
    if (bytes.length < byteLength) {
      throw ArgumentError('Byte length is less than expected');
    }

    final keyBytes = bytes.sublist(0, key.byteLength);
    final versionBytes =
        bytes.sublist(key.byteLength, key.byteLength + version.byteLength);
    final isDeletedBytes = bytes.sublist(key.byteLength + version.byteLength,
        key.byteLength + version.byteLength + isDeleted.byteLength);
    final dataBytes = bytes
        .sublist(key.byteLength + version.byteLength + isDeleted.byteLength);

    return DataEntryImpl(
      key: KeyEntryImpl(key.deserialize(keyBytes)),
      version: VersionEntryImpl(version.deserialize(versionBytes)),
      isDeleted: DeletedEntryImpl(isDeleted.deserialize(isDeletedBytes)),
      data: dataBytes,
    );
  }

  @override
  Uint8List serialize() {
    return Uint8List.fromList(
      key.serialize() +
          version.serialize() +
          isDeleted.serialize() +
          value.data,
    );
  }

  @override
  List<Object?> get props => [key, version, isDeleted, data];
}
