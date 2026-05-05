import 'package:equatable/equatable.dart';

class DatabasePreferencies extends Equatable {
  final bool isCompressed;
  final bool isEncrypted;
  final bool isWAL;
  final bool isVersioned;
  final bool isEndianness;

  const DatabasePreferencies({
    this.isCompressed = true,
    this.isEncrypted = true,
    this.isWAL = true,
    this.isVersioned = true,
    this.isEndianness = true,
  });

  @override
  List<Object?> get props => [
        isCompressed,
        isEncrypted,
        isWAL,
        isVersioned,
        isEndianness,
      ];
}
