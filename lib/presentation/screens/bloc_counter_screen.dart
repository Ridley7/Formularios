import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formulario_flutter/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: BlocCounterView(),
    );
  }
}



class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void increasedCounterBy(BuildContext context, [ int value = 1 ]){
    //context.read<CounterBloc>().add(CounterIncreased(value));
    context.read<CounterBloc>().increasedBy(value);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc bloc) => Text('Bloc counter: ${bloc.state.transactionCount}')),
        actions: [
          IconButton(
              //onPressed: () => context.read<CounterBloc>().add(CounterReset()),
            onPressed: () => context.read<CounterBloc>().resetCounter(),
              icon: const Icon(Icons.refresh_outlined)
          )
        ],
      ),

      body: Center(
        child: context.select((CounterBloc bloc) => Text("Counter value: ${bloc.state.counter}"))
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              increasedCounterBy(context, 3);
            },
            child: Text("+3"),
          ),

          const SizedBox(
            height: 15,
          ),

          FloatingActionButton(
            heroTag: '2',
            onPressed: () {
              increasedCounterBy(context, 2);
            },
            child: Text("+2"),
          ),

          const SizedBox(
            height: 15,
          ),

          FloatingActionButton(
            heroTag: '3',
            onPressed: () {
              increasedCounterBy(context);
            },
            child: Text("+1"),
          ),

        ],
      ),

    );
  }
}
