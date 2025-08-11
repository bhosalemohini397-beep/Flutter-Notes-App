extension ShortSentenceExtension on String {
  String toShortSentence({int wordLimit = 5}) {
    final trimmed = trim();
    if (trimmed.isEmpty) return '';

    final words = trimmed.split(RegExp(r'\s+'));
    if (words.length <= wordLimit) {
      return trimmed;
    }

    return '${words.take(wordLimit).join(' ')}...';
  }
}

extension DateFormatExtension on DateTime {
  String toDdMmYyyy() {
    final day = this.day.toString().padLeft(2, '0');
    final month = this.month.toString().padLeft(2, '0');
    final year = this.year.toString();
    return "$day-$month-$year";
  }
}