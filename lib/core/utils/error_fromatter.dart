extension ErrorMapFormatter on Map<String, List<String>> {
  String get formatErrors {
    StringBuffer messageBuffer = StringBuffer();
    if (isNotEmpty) {
      messageBuffer.writeln('\n');
    }
    forEach((field, errorList) {
      for (var error in errorList) {
        if(error.isNotEmpty) {
          messageBuffer.writeln(error);
        }
      }
    });

    return messageBuffer.toString();
  }
}
