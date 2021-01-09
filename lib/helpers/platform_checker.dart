import 'package:universal_io/io.dart';

class PlatformChecker {
  static bool isMobile() {
    return Platform.isAndroid || Platform.isIOS;
  }
}
