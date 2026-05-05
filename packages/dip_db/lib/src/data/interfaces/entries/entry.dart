import 'dart:typed_data';

typedef EntryFactory<T> = Entry<T> Function(Uint8List bytes);

abstract class Entry<T> {
  T get value;

  int get byteLength;

  const Entry();

  static Entry<T> fromBytes<T>(Uint8List bytes, EntryFactory<T> factory) {
    return factory(bytes);
  }

  Uint8List serialize();
  T deserialize(Uint8List bytes);
}
