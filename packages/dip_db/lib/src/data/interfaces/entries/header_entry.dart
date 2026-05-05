import 'entries.dart';

abstract interface class HeaderEntry<K extends Entry, V extends Entry,
    F extends FlagsEntry> implements Entry<HeaderEntry<K, V, F>> {
  final K key;
  final V version;
  final F flags;
  final int indexOffset;
  final int reserved;

  HeaderEntry(
      this.key, this.version, this.flags, this.indexOffset, this.reserved);
}
