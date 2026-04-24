part of "register_cubit.dart";

enum FormStatus { valid, invalid, posting, validating }

class RegisterState extends Equatable {

  final FormStatus formStatus;
  final UsernameInput username;
  final EmailInput email;
  final PasswordInput password;
  //No se usa en este ejemplo pero es una manera de indicar si el formulario
  //es valido.
  final bool isValid;

  const RegisterState({
    this.formStatus = FormStatus.invalid,
    this.username = const UsernameInput.pure(),
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.isValid = false
  });

  RegisterState copyWith({
    FormStatus? formStatus,
    UsernameInput? username,
    EmailInput? email,
    PasswordInput? password,
    bool? isValid
  }) => RegisterState(
      formStatus: formStatus ?? this.formStatus,
    username: username ?? this.username,
    email: email ?? this.email,
    password: password ?? this.password,
    isValid: isValid ?? this.isValid
      );

  @override
  // TODO: implement props
  List<Object?> get props => [formStatus, username, email, password, isValid];

}
