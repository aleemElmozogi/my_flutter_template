import 'package:intl/intl.dart';

extension StringExtension on String {
  String get formatAmount {
    // Create a NumberFormat object with the desired pattern
    NumberFormat formatter = NumberFormat.currency(
        locale: 'ar', symbol: 'د.ل'); // Adjust locale and symbol as needed
    return formatter.format(double.tryParse(this) ?? 0);
  }

  String get monthName {
    final int monthNumber = int.tryParse(this) ?? 0;
    // List<String> monthNames = [
    //   '', // leave an empty string for index 0
    //   'January',
    //   'February',
    //   'March',
    //   'April',
    //   'May',
    //   'June',
    //   'July',
    //   'August',
    //   'September',
    //   'October',
    //   'November',
    //   'December'
    // ];
    List<String> monthNames = [
      '', // leave an empty string for index 0
      'يناير', // January
      'فبراير', // February
      'مارس', // March
      'أبريل', // April
      'مايو', // May
      'يونيو', // June
      'يوليو', // July
      'أغسطس', // August
      'سبتمبر', // September
      'أكتوبر', // October
      'نوفمبر', // November
      'ديسمبر' // December
    ];

    // Check if the month number is valid
    if (monthNumber < 1 || monthNumber > 12) {
      return '';
    }

    return monthNames[monthNumber];
  }
  String get formatMoney {
    final int number = int.tryParse(trim()) ?? 0;

    if (number >= 1000000) {
      int floored = (number * 10) ~/ 1000000;
      return '${floored ~/ 10}.${floored % 10} مليون';
    } else if (number >= 1000) {
      int floored = (number * 10) ~/ 1000;
      return '${floored ~/ 10}.${floored % 10} ألف';
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
