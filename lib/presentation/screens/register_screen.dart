import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formulario_flutter/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:formulario_flutter/presentation/widgets/inputs/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo usuario"),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                FlutterLogo(size: 100),

                _RegisterForm(),

                SizedBox(height: 20,)
              ],
            ),
          ),
        )
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {

    final registerCubit =  context.watch<RegisterCubit>();
    final usernameInput = registerCubit.state.username;
    final passwordInput = registerCubit.state.password;
    final emailInput = registerCubit.state.email;

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged: registerCubit.usernameChanged,
            errorMessage: usernameInput.messageError,
          ),

          const SizedBox(height: 10),

          CustomTextFormField(
            label: 'Correo electrónico',
            onChanged: registerCubit.emailChanged,
            errorMessage: emailInput.messageError,
          ),

          const SizedBox(height: 10),

          CustomTextFormField(
            label: "Contraseña",
            onChanged: registerCubit.passwordChanged,
            obscureText: true,
            errorMessage: passwordInput.messageError,
          ),

          const SizedBox(height: 20),

          FilledButton.tonalIcon(
              onPressed: (){

                registerCubit.onSubmit();

              },
              icon: const Icon(Icons.save),
              label: const Text("Crear usuario")
          )
        ],
      ),
    );
  }
}


