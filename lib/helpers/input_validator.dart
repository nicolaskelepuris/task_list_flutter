import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class InputValidator {
  static String _nullErrorMessage = 'Campo nao pode ser vazio';
  static String _intConversionErrorMessage =
      'Campo deve conter um numero inteiro maior que 0';
  static String _doubleConversionErrorMessage =
      'Campo deve conter um numero, em caso de decimal usar "." para separar';

  static void validateString({
    @required String input,
    @required RxString error,
  }) {
    if (isNullOrEmpty(input)) {
      error.value = _nullErrorMessage;
    } else {
      error.nil();
    }
  }

  static void validateInt({@required String input, @required RxString error}) {
    if (isNullOrEmpty(input)) {
      error.value = _nullErrorMessage;
    } else {
      if (!canConvertToInt(input)) {
        error.value = _intConversionErrorMessage;
      } else {
        error.nil();
      }
    }
  }

  static void validateDouble(
      {@required String input, @required RxString error}) {
    if (isNullOrEmpty(input)) {
      error.value = _nullErrorMessage;
    } else {
      if (!canConvertToDouble(input)) {
        error.value = _doubleConversionErrorMessage;
      } else {
        error.nil();
      }
    }
  }

  static bool anyInputHasError({@required List<RxString> errorMessages}) {
    for (var item in errorMessages) {
      if (item.value != null) {
        return true;
      }
    }
    return false;
  }

  static bool isNullOrEmpty(String str) {
    return str == null || str.isEmpty;
  }

  static bool canConvertToInt(String str) {
    return !(int.tryParse(str) == null);
  }

  static bool canConvertToDouble(String str) {
    return !(double.tryParse(str) == null);
  }
}
