import 'dart:typed_data';

import 'package:dip_db/dip_db.dart';
import 'package:dip_db/src/data/implementations/entries/flags_entry_impl.dart';

void main() {
  final headerEntry = HeaderEntryImpl(
    KeyEntryImpl('HeadeyImpl'),
    VersionEntryImpl(100),
    FlagsEntryImpl(
      isCompressed: true,
      isEncrypted: false,
      isWAL: true,
      isVersioned: false,
      isEndianness: true,
    ),
    12476956,
  );

  final dataEntry = DataEntryImpl(
    key: KeyEntryImpl('DataEntryImpl'),
    version: VersionEntryImpl(1),
    isDeleted: DeletedEntryImpl(false),
    data: Uint8List.fromList(
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4, 5, 6, 7, 8, 9]),
  );

  print('Serialized Header Data: ${headerEntry.serialize().toString()}, '
      'Byte Length: ${headerEntry.byteLength}');
  print('Serialized Data: ${dataEntry.serialize().toString()}, '
      'Byte Length: ${dataEntry.byteLength}');

  final headerEntryDeserialized =
      headerEntry.deserialize(headerEntry.serialize());
  final dataEntryDeserialized = dataEntry.deserialize(dataEntry.serialize());

  print('Deserialized Header Data: ${headerEntryDeserialized.toString()}, '
      'Byte Length: ${headerEntryDeserialized.byteLength}');
  print('Deserialized Data: ${dataEntryDeserialized.toString()}, '
      'Byte Length: ${dataEntryDeserialized.byteLength}');

  print('Is header equal: ${headerEntry == headerEntryDeserialized}');
  print('Is data equal: ${dataEntry == dataEntryDeserialized}');
}
