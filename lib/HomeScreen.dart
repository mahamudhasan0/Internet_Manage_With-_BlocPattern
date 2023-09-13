import 'package:blocpractice/blocks/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocks/internet_bloc/internet_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc, InternetState>(
            listener: (context, state) {
              if (state is InternetOnState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Internet Connected"),
                  backgroundColor: Colors.green,
                ));
              } else if (state is InternetOffState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Internet not Connected"),
                  backgroundColor: Colors.red,
                ));
              }
            },
            builder: (context, state) {
              if (state is InternetOnState) {
                return const Text("Internet Connected");
              } else if (state is InternetOffState) {
                return const Text("Internet Not Connected");
              } else {
                return const Text("Loading...");
              }
            },
          ),
        ),
      ),
    );
  }
}
