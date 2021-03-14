class AuthService {
  bool _authenticated = false;

  bool get authenticated => _authenticated;

  Future<void> login() async {
    _authenticated = true;
  }

  Future<void> logout() async {
    _authenticated = false;
  }
}
