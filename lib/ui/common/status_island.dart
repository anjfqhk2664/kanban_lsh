import 'package:flutter/material.dart';
import 'package:kanban/enums/kanban_status.dart';
import 'package:kanban/themes/app_size.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class StatusIsland extends StatelessWidget {
  final KanbanStatus status;

  const StatusIsland({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.statusIslandHeight,
      child: Row(
        spacing: 7,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: status.bubbleColor,
                borderRadius: BorderRadius.circular(
                  AppSize.statusIslandHeight + 10,
                ),
              ),
              child: Row(
                spacing: 10,
                children: [
                  Icon(status.icon, size: 24),
                  Expanded(
                    child: Text(
                      status.label,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        height: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          buildCircleBubble(
            child: Text(
              '2',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),

          // 추가하기
          buildCircleBubble(
            onTap: () {
              debugPrint('$status 추가하기');
            },
            visible: status != KanbanStatus.done,
            child: Icon(LucideIcons.plus, size: 24),
          ),
        ],
      ),
    );
  }

  Widget buildCircleBubble({
    bool visible = true,
    required Widget child,
    VoidCallback? onTap,
  }) {
    if (!visible) {
      return SizedBox.fromSize(
        size: Size.fromWidth(AppSize.statusIslandHeight),
      );
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        width: AppSize.statusIslandHeight,
        height: AppSize.statusIslandHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: status.bubbleColor,
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}
