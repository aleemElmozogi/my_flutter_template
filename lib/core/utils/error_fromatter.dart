extension ErrorMapFormatter on Map<String, List<String>> {
  String get formatErrors {
    StringBuffer messageBuffer = StringBuffer();
    bool firstError = true;

    forEach((field, errorList) {
      for (var error in errorList) {
        if (error.isNotEmpty) {
          if (!firstError) {
            messageBuffer
                .write(', '); // Add a newline before appending a new error
          }
          messageBuffer.write(error);
          firstError = false;
        }
      }
    });

    return messageBuffer.toString();
  }
}
