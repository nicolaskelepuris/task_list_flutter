import 'bindings/domains/auth.domain.binding.dart';

class Routes {
  static Future<String> get initialRoute async {
    try {
      var authDomainService = AuthDomainBinding().domain;
      var authenticated = await authDomainService.isAuthenticated();
      return !authenticated ? LOGIN : HOME;
    } catch (err) {
      return LOGIN;
    }
  }

  static const TASK_REGISTER = '/task-register';

  static const DASHBOARD = '/dashboard';
  static const APPOINTMENTS = '/appointments';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const TASKS = '/tasks';
  static const VESSELS = '/vessels';
}
