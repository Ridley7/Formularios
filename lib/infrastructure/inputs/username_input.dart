import 'package:formz/formz.dart';

// Define input validation errors
enum UsernameError { empty, length }

// Extend FormzInput and provide the input type and error type.
class UsernameInput extends FormzInput<String, UsernameError> {
  // Call super.pure to represent an unmodified form input.
  const UsernameInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const UsernameInput.dirty( String value ) : super.dirty(value);

  String? get messageError{

    if(isValid || isPure) return null;

    if( displayError == UsernameError.length) return ("Minimo 6 carácteres");
    if( displayError == UsernameError.empty) return ("Este campo es requerido");

    return null;

  }

  // Override validator to handle validating a given input value.
  @override
  UsernameError? validator(String value) {



    if( value.isEmpty || value.trim().isEmpty ) return UsernameError.empty;
    if( value.length < 6) return UsernameError.length;

    return null;
  }
}