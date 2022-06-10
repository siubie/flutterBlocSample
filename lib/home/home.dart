import 'package:demo/home/bloc/home_bloc.dart';
import 'package:demo/login/bloc/login_bloc.dart';
import 'package:demo/login/login.dart';
import 'package:demo/services/authentication_service.dart';
import 'package:demo/services/bored_service.dart';
import 'package:demo/services/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(
            RepositoryProvider.of<BoredService>(context),
            RepositoryProvider.of<ConnectivityService>(context),
          )..add(LoadApiEvent()),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
            RepositoryProvider.of<AuthenticationService>(context),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Activity for bored people"),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeLoadedState) {
              return Column(
                children: [
                  Text(state.activityName),
                  Text(state.activityType),
                  Text(
                    state.participant.toString(),
                  ),
                  ElevatedButton(
                    onPressed: () => BlocProvider.of<HomeBloc>(context).add(
                      LoadApiEvent(),
                    ),
                    child: const Text("Load Next Activity"),
                  ),
                  const SizedBox.square(dimension: 50),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<LoginBloc>(context)
                              ..add(
                                LoginPageLoaded(),
                              ),
                            child: const Login(),
                          ),
                        ),
                      );
                    },
                    child: const Text("Go To Login Page"),
                  ),
                ],
              );
            }
            if (state is HomeNoInternetState) {
              return const Text("No Internet :(");
            }
            return Container();
          },
        ),
      ),
    );
  }
}
