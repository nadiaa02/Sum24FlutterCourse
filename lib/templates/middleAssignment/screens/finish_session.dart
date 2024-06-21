import 'package:education/templates/middleAssignment/models/provider/provider.dart';
import 'package:education/templates/middleAssignment/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FinishSession extends ConsumerStatefulWidget {
  const FinishSession({super.key});

  @override
  ConsumerState<FinishSession> createState() => _FinishSessionState();
}

class _FinishSessionState extends ConsumerState<FinishSession> {
  final controllerNumber = TextEditingController();
  @override
  void initState() {
    super.initState();
    ref.read(valueProvider.notifier);
  }
  @override
  Widget build(BuildContext context) {
    final value = ref.watch(valueProvider);
    return  Scaffold(
      body: Center(child: Column(
        children: [
          Text('Finish Session'),
          Text('Time in cycle: ${value.timeInCycle}'),
          Text('Cycles: ${value.cycles}'),
          
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Rate your session',
              ),
              controller: controllerNumber,
              onChanged: (text) => {
              },
            ),

            ElevatedButton(
              onPressed: () {
                if (controllerNumber.text.isNotEmpty) {
value.editSession(value.sessions.last, controllerNumber.text);     
            Navigator.of(context).pushNamed('/')  ;    
           }
              },
              child: const Text('Rate session'),
            ),

        ],
      )),
    );
  }
}