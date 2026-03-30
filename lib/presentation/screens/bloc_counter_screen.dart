import 'package:flutter/material.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Counter"),
        actions: [
          IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.refresh_outlined)
          )
        ],
      ),

      body: const Center(
        child: Text("Counter value:"),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: (){},
            child: Text("+3"),
          ),

          const SizedBox(
            height: 15,
          ),

          FloatingActionButton(
            heroTag: '2',
            onPressed: (){},
            child: Text("+2"),
          ),

          const SizedBox(
            height: 15,
          ),

          FloatingActionButton(
            heroTag: '3',
            onPressed: (){},
            child: Text("+1"),
          ),

        ],
      ),

    );
  }
}
