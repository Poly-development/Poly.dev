part of 'auth_page_bloc.dart';

abstract class AuthPageEvent {}

class TryAuthUserEvent extends AuthPageEvent {
  TryAuthUserEvent(String email, String password)
      : request = SignInRequest(email, password);

  final SignInRequest request;
}
