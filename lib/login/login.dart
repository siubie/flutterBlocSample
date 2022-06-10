import 'package:demo/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Login"),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginInitial) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Login Initial"),
                ElevatedButton(
                  onPressed: () => BlocProvider.of<LoginBloc>(context).add(
                    AuthenticateEvent(),
                  ),
                  child: const Text("Login"),
                ),
              ],
            );
          }

          if (state is LoginAuthenticated) {
            return Text(state.email);
          }

          if (state is LoginFailed) {
            return const Text("Login Failed");
          }

          if (state is LoginInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container();
        },
      ),
    );
  }
}
