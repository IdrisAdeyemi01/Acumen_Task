class API {
  static const String scheme = 'https';
  static const host = 'user-authh.herokuapp.com';

  //Authentication
  Uri get signup => Uri(scheme: scheme, host: host, path: 'api/v1/user/signup');

  Uri get signin =>
      Uri(scheme: scheme, host: host, path: 'api/v1/user/auth/signin');
}
