import 'package:intl/intl.dart';
import 'package:my_flutter_template/generated/l10n.dart';

extension StringExtension on String {
  String get formatAmount {
    NumberFormat formatter = NumberFormat.currency(
      locale: Intl.getCurrentLocale(),
      symbol: S.current.currencySymbol,
    );
    return formatter.format(double.tryParse(this) ?? 0);
  }

  String get monthName {
    final int monthNumber = int.tryParse(this) ?? 0;
    List<String> monthNames = [
      '',
      S.current.january,
      S.current.february,
      S.current.march,
      S.current.april,
      S.current.may,
      S.current.june,
      S.current.july,
      S.current.august,
      S.current.september,
      S.current.october,
      S.current.november,
      S.current.december,
    ];

    if (monthNumber < 1 || monthNumber > 12) {
      return '';
    }

    return monthNames[monthNumber];
  }

  String get formatMoney {
    final int number = int.tryParse(trim()) ?? 0;

    if (number >= 1000000) {
      int floored = (number * 10) ~/ 1000000;
      return S.current.millionAmount('${floored ~/ 10}.${floored % 10}');
    } else if (number >= 1000) {
      int floored = (number * 10) ~/ 1000;
      return S.current.thousandAmount('${floored ~/ 10}.${floored % 10}');
    }

    return number.toString();
  }

  String get reverseName {
    List<String> words = split(' ');

    // Reverse the list of words
    List<String> reversedWords = words.reversed.toList();

    // Join the reversed list of words into a single string
    String reversedString = reversedWords.join(' ');
    return reversedString;
  }
}
