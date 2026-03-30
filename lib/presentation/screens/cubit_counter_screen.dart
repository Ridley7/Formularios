import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formulario_flutter/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
        child: CounterCubitView()
    );
  }
}

class CounterCubitView extends StatelessWidget {
  const CounterCubitView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final counterState = context.watch<CounterCubit>().state;

    void increase(int value){
      context.read<CounterCubit>().increasedBy(value);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit Counter: ${counterState.transactionCount}"),
        actions: [
          IconButton(
              onPressed: () {
                context.read<CounterCubit>().reset();
              },
              icon: const Icon(Icons.refresh_outlined)
          )
        ],
      ),

      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state){
            print("Repintando");
            return Text("Counter value: ${state.counter}");
          },
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
              onPressed: () => increase(3),
            child: Text("+3"),
          ),

          const SizedBox(
            height: 15,
          ),

          FloatingActionButton(
            heroTag: '2',
            onPressed: () => increase(2),
            child: Text("+2"),
          ),

          const SizedBox(
            height: 15,
          ),

          FloatingActionButton(
            heroTag: '3',
            onPressed: () => increase(1),
            child: Text("+1"),
          ),

        ],
      ),

    );
  }
}
