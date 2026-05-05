import 'dart:typed_data';

abstract interface class Serializable {
  Uint8List toBytes();
  Serializable fromBytes(Uint8List bytes);
}