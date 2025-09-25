// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:kanban/enums/kanban_status.dart';

class KanbanItem extends StatelessWidget {
  final KanbanStatus status;
  final String title;
  final VoidCallback onCheckbox;
  final VoidCallback onDelete;
  final VoidCallback? onStatus;


  const KanbanItem({
    Key? key,
    required this.status,
    required this.title,
    required this.onCheckbox,
    required this.onDelete,
    this.onStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      title: Row(
        children: [
          // 체크박스
          Checkbox(
            visualDensity: VisualDensity.compact,
            activeColor: Colors.green,
            onChanged: (_) => onCheckbox(),
            value: status == KanbanStatus.done,
          ),

          // 타이틀
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // X 버튼
          IconButton(
            onPressed: onDelete,
            padding: EdgeInsets.zero,
            icon: Icon(LucideIcons.x),
            iconSize: 24,
          ),
        ],
      ),
      footer: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Container(
            padding: .symmetric(vertical: 8, horizontal: 18),
            decoration: BoxDecoration(
              color: Color(0xFFE1FBD6),
              borderRadius: .circular(4),
            ),
            child: Text('Low', style: TextStyle(fontSize: 18)),
          ),
          
          if(status != KanbanStatus.done)
          IconButton(
            onPressed: onStatus,
            visualDensity: VisualDensity.compact,
            iconSize: 30, 
            icon: Icon(status.nextIcon)
          ),
        ],
      ),
    );
  }
}
