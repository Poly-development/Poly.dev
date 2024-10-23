part of 'register_page_bloc.dart';

abstract class RegisterPageEvent {}

class TryRegisterUserEvent extends RegisterPageEvent {
  TryRegisterUserEvent(
    String firstName,
    String lastName,
    String middleName,
    String institute,
    String direction,
    String course,
    String email,
    String password,
    String? vk,
    String? tg,
  ) : request = SignUpRequest(
          firstName,
          lastName,
          middleName,
          institute,
          direction,
          course,
          email,
          password,
          vk,
          tg,
        );

  final SignUpRequest request;
}
