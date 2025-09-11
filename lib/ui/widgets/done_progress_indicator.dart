import 'package:flutter/material.dart';
import 'package:kanban/providers/kanban_provider.dart';
import 'package:provider/provider.dart';

class DoneProgressIndicator extends StatelessWidget {
  const DoneProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<KanbanProvider>(
      builder: (_, provider, child) {
        final doneCount = 0;
        final todoCount = 3 ;
        return Row(
          mainAxisSize: .min,
          spacing: 6,
          children: [
            SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                value: (doneCount / todoCount),
                backgroundColor: Colors.grey,
                color: Colors.blue,
                strokeWidth: 7,
              ),
            ),
            Text('$doneCount/$todoCount 완료', style: TextStyle(fontSize: 15)),
          ],
        );
      },
    );
  }
}
