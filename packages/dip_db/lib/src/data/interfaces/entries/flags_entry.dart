import 'entries.dart';

abstract interface class FlagsEntry implements Entry<FlagsEntry> {
  final bool isCompressed;
  final bool isEncrypted;
  final bool isWAL;
  final bool isVersioned;
  final bool isEndianness;

  FlagsEntry(this.isCompressed, this.isEncrypted, this.isWAL, this.isVersioned,
      this.isEndianness);
}
