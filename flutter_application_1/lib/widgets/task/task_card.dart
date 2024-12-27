/*import 'package:flutter/material.dart';
import '../../models/task.dart';
import '../../config/theme.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: AppTheme.surfaceColor,
      child: ListTile(
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (value) {
            // TODO: Implement task completion
          },
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          '${task.dateTime.hour}:${task.dateTime.minute.toString().padLeft(2, '0')}',
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: _getCategoryColor(task.category),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(_getCategoryName(task.category)),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(task.priority.toString()),
            ),
          ],
        ),
      ),
    );
  }

  Color _getCategoryColor(TaskCategory category) {
    switch (category) {
      case TaskCategory.grocery:
        return Colors.green;
      case TaskCategory.work:
        return Colors.orange;
      case TaskCategory.sport:
        return Colors.blue;
      case TaskCategory.design:
        return Colors.purple;
      case TaskCategory.university:
        return AppTheme.primaryColor;
      case TaskCategory.social:
        return Colors.pink;
      case TaskCategory.music:
        return Colors.red;
      case TaskCategory.health:
        return Colors.teal;
      case TaskCategory.movie:
        return Colors.indigo;
      case TaskCategory.home:
        return Colors.brown;
      case TaskCategory.personal:
        return Colors.grey.shade300;
      case TaskCategory.shopping:
        return Colors.lightGreen;
      case TaskCategory.other:
        return Colors.grey;
      default:
        return Colors.grey; // Default color for any new categories that might be added
    }
  }

  String _getCategoryName(TaskCategory category) {
    return category.toString().split('.').last.split('_').map(
      (word) => word[0].toUpperCase() + word.substring(1).toLowerCase()
    ).join(' ');
  }
}

// Extension to improve category handling
extension TaskCategoryExtension on TaskCategory {
  Color get color {
    switch (this) {
      case TaskCategory.grocery:
        return Colors.green;
      case TaskCategory.work:
        return Colors.orange;
      case TaskCategory.sport:
        return Colors.blue;
      case TaskCategory.design:
        return Colors.purple;
      case TaskCategory.university:
        return AppTheme.primaryColor;
      case TaskCategory.social:
        return Colors.pink;
      case TaskCategory.music:
        return Colors.red;
      case TaskCategory.health:
        return Colors.teal;
      case TaskCategory.movie:
        return Colors.indigo;
      case TaskCategory.home:
        return Colors.brown;
      case TaskCategory.personal:
        return Colors.grey.shade300;
      case TaskCategory.shopping:
        return Colors.lightGreen;
      case TaskCategory.other:
        return Colors.grey;
    }
  }

  String get displayName => toString().split('.').last.split('_').map(
    (word) => word[0].toUpperCase() + word.substring(1).toLowerCase()
  ).join(' ');
  
  IconData get icon {
    switch (this) {
      case TaskCategory.grocery:
        return Icons.shopping_cart;
      case TaskCategory.work:
        return Icons.work;
      case TaskCategory.sport:
        return Icons.sports;
      case TaskCategory.design:
        return Icons.design_services;
      case TaskCategory.university:
        return Icons.school;
      case TaskCategory.social:
        return Icons.people;
      case TaskCategory.music:
        return Icons.music_note;
      case TaskCategory.health:
        return Icons.health_and_safety;
      case TaskCategory.movie:
        return Icons.movie;
      case TaskCategory.home:
        return Icons.home;
      case TaskCategory.personal:
        return Icons.person;
      case TaskCategory.shopping:
        return Icons.shopping_bag;
      case TaskCategory.other:
        return Icons.more_horiz;
    }
  }
}*/
// File: lib/widgets/task/task_card.dart
/*
import 'package:flutter/material.dart';
import '../../models/task.dart';
import '../../config/theme.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final Function(TaskStatus) onStatusChanged;
  final VoidCallback onDelete;

  const TaskCard({
    super.key,
    required this.task,
    required this.onStatusChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.id ?? ''),
      background: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        child: const Icon(Icons.check_circle, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          onDelete();
        } else {
          onStatusChanged(TaskStatus.COMPLETED);
        }
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: InkWell(
          onTap: _showStatusDialog(context),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _buildStatusIcon(),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        task.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          decoration: task.status == TaskStatus.COMPLETED
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                    ),
                    _buildPopupMenu(context),
                  ],
                ),
                if (task.description.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    task.description,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildCategoryChip(),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _formatTime(task.dateTime),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const Spacer(),
                    _buildPriorityChip(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusIcon() {
    Color color;
    IconData icon;
    switch (task.status) {
      case TaskStatus.TODO:
        color = Colors.grey;
        icon = Icons.radio_button_unchecked;
        break;
      case TaskStatus.IN_PROGRESS:
        color = Colors.blue;
        icon = Icons.pending;
        break;
      case TaskStatus.COMPLETED:
        color = Colors.green;
        icon = Icons.check_circle;
        break;
    }

    return Icon(icon, color: color);
  }

  Widget _buildPopupMenu(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      onSelected: (value) {
        switch (value) {
          case 'todo':
            onStatusChanged(TaskStatus.TODO);
            break;
          case 'in_progress':
            onStatusChanged(TaskStatus.IN_PROGRESS);
            break;
          case 'completed':
            onStatusChanged(TaskStatus.COMPLETED);
            break;
          case 'delete':
            _showDeleteDialog(context);
            break;
        }
      },
      itemBuilder: (context) => [
        _buildPopupItem('todo', Icons.radio_button_unchecked, 'Mark as Todo'),
        _buildPopupItem('in_progress', Icons.pending, 'Mark as In Progress'),
        _buildPopupItem('completed', Icons.check_circle, 'Mark as Completed'),
        const PopupMenuDivider(),
        _buildPopupItem('delete', Icons.delete, 'Delete', color: Colors.red),
      ],
    );
  }

  PopupMenuItem<String> _buildPopupItem(
    String value,
    IconData icon,
    String text, {
    Color? color,
  }) {
    return PopupMenuItem<String>(
      value: value,
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: _getCategoryColor().withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getCategoryIcon(),
            size: 12,
            color: _getCategoryColor(),
          ),
          const SizedBox(width: 4),
          Text(
            _getCategoryName(),
            style: TextStyle(
              fontSize: 12,
              color: _getCategoryColor(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriorityChip() {
    final color = _getPriorityColor();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.flag,
            size: 12,
            color: color,
          ),
          const SizedBox(width: 4),
          Text(
            _getPriorityText(),
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Task'),
        content: const Text('Are you sure you want to delete this task?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onDelete();
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showStatusDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Change Status'),
        children: [
          _buildStatusOption(
            context,
            TaskStatus.TODO,
            Icons.radio_button_unchecked,
            'Todo',
          ),
          _buildStatusOption(
            context,
            TaskStatus.IN_PROGRESS,
            Icons.pending,
            'In Progress',
          ),
          _buildStatusOption(
            context,
            TaskStatus.COMPLETED,
            Icons.check_circle,
            'Completed',
          ),
        ],
      ),
    );
  }

  Widget _buildStatusOption(
    BuildContext context,
    TaskStatus status,
    IconData icon,
    String label,
  ) {
    final isSelected = task.status == status;
    return SimpleDialogOption(
      onPressed: () {
        Navigator.pop(context);
        onStatusChanged(status);
      },
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? AppTheme.primaryColor : Colors.grey,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppTheme.primaryColor : null,
              fontWeight: isSelected ? FontWeight.bold : null,
            ),
          ),
        ],
      ),
    );
  }

  Color _getCategoryColor() {
    switch (task.category) {
      case TaskCategory.work:
        return Colors.blue;
      case TaskCategory.personal:
        return Colors.purple;
      case TaskCategory.shopping:
        return Colors.green;
      case TaskCategory.health:
        return Colors.red;
      case TaskCategory.home:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  IconData _getCategoryIcon() {
    switch (task.category) {
      case TaskCategory.work:
        return Icons.work;
      case TaskCategory.personal:
        return Icons.person;
      case TaskCategory.shopping:
        return Icons.shopping_cart;
      case TaskCategory.health:
        return Icons.favorite;
      case TaskCategory.home:
        return Icons.home;
      default:
        return Icons.category;
    }
  }

  String _getCategoryName() {
    return task.category.toString().split('.').last.split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }

  Color _getPriorityColor() {
    switch (task.priority) {
      case TaskPriority.HIGH:
        return Colors.red;
      case TaskPriority.MEDIUM:
        return Colors.orange;
      case TaskPriority.LOW:
        return Colors.green;
    }
  }

  String _getPriorityText() {
    switch (task.priority) {
      case TaskPriority.HIGH:
        return 'High';
      case TaskPriority.MEDIUM:
        return 'Medium';
      case TaskPriority.LOW:
        return 'Low';
    }
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}*/
// File: lib/widgets/task/task_card.dart
import 'package:flutter/material.dart';
import '../../models/task.dart';
import '../../config/theme.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final Function(TaskStatus) onStatusChanged;
  final VoidCallback onDelete;

  const TaskCard({
    super.key,
    required this.task,
    required this.onStatusChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.id ?? ''),
      background: Container(
        color: Colors.green.withOpacity(0.8),
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(Icons.check, color: Colors.white),
          ),
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red.withOpacity(0.8),
        child: const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          onStatusChanged(TaskStatus.COMPLETED);
        } else {
          onDelete();
        }
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: InkWell(
          onTap: () => _showTaskActions(context),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _StatusIcon(
                      status: task.status,
                      onTap: () => _showStatusPicker(context),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              decoration: task.status == TaskStatus.COMPLETED
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          if (task.description.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(
                              task.description,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                                decoration: task.status == TaskStatus.COMPLETED
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ],
                      ),
                    ),
                    _PriorityIndicator(priority: task.priority),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _CategoryChip(category: task.category),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _formatDateTime(task.dateTime),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showTaskActions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit'),
            onTap: () {
              Navigator.pop(context);
              // TODO: Implement edit functionality
            },
          ),
          ListTile(
            leading: const Icon(Icons.update),
            title: const Text('Change Status'),
            onTap: () {
              Navigator.pop(context);
              _showStatusPicker(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete, color: Colors.red),
            title: const Text('Delete', style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pop(context);
              _showDeleteConfirmation(context);
            },
          ),
        ],
      ),
    );
  }

  void _showStatusPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Status'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: TaskStatus.values.map((status) {
            return ListTile(
              leading: Icon(_getStatusIcon(status)),
              title: Text(_getStatusName(status)),
              selected: task.status == status,
              onTap: () {
                Navigator.pop(context);
                onStatusChanged(status);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Task'),
        content: const Text('Are you sure you want to delete this task?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onDelete();
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  IconData _getStatusIcon(TaskStatus status) {
    switch (status) {
      case TaskStatus.TODO:
        return Icons.radio_button_unchecked;
      case TaskStatus.IN_PROGRESS:
        return Icons.watch_later;
      case TaskStatus.COMPLETED:
        return Icons.check_circle;
    }
  }

  String _getStatusName(TaskStatus status) {
    switch (status) {
      case TaskStatus.TODO:
        return 'To Do';
      case TaskStatus.IN_PROGRESS:
        return 'In Progress';
      case TaskStatus.COMPLETED:
        return 'Completed';
    }
  }

  String _formatDateTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

class _StatusIcon extends StatelessWidget {
  final TaskStatus status;
  final VoidCallback onTap;

  const _StatusIcon({
    required this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(4),
        child: Icon(
          _getStatusIcon(),
          color: _getStatusColor(),
          size: 24,
        ),
      ),
    );
  }

  IconData _getStatusIcon() {
    switch (status) {
      case TaskStatus.TODO:
        return Icons.radio_button_unchecked;
      case TaskStatus.IN_PROGRESS:
        return Icons.watch_later;
      case TaskStatus.COMPLETED:
        return Icons.check_circle;
    }
  }

  Color _getStatusColor() {
    switch (status) {
      case TaskStatus.TODO:
        return Colors.grey;
      case TaskStatus.IN_PROGRESS:
        return Colors.blue;
      case TaskStatus.COMPLETED:
        return Colors.green;
    }
  }
}

class _CategoryChip extends StatelessWidget {
  final TaskCategory category;

  const _CategoryChip({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: _getCategoryColor().withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        _getCategoryName(),
        style: TextStyle(
          fontSize: 12,
          color: _getCategoryColor(),
        ),
      ),
    );
  }

  Color _getCategoryColor() {
    switch (category) {
      case TaskCategory.work:
        return Colors.blue;
      case TaskCategory.personal:
        return Colors.purple;
      case TaskCategory.shopping:
        return Colors.green;
      case TaskCategory.health:
        return Colors.red;
      case TaskCategory.home:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  String _getCategoryName() {
    return category.toString().split('.').last;
  }
}

class _PriorityIndicator extends StatelessWidget {
  final TaskPriority priority;

  const _PriorityIndicator({required this.priority});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: _getPriorityColor().withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _getPriorityColor()),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.flag,
            size: 12,
            color: _getPriorityColor(),
          ),
          const SizedBox(width: 4),
          Text(
            _getPriorityText(),
            style: TextStyle(
              fontSize: 12,
              color: _getPriorityColor(),
            ),
          ),
        ],
      ),
    );
  }

  Color _getPriorityColor() {
    switch (priority) {
      case TaskPriority.HIGH:
        return Colors.red;
      case TaskPriority.MEDIUM:
        return Colors.orange;
      case TaskPriority.LOW:
        return Colors.green;
    }
  }

  String _getPriorityText() {
    switch (priority) {
      case TaskPriority.HIGH:
        return 'High';
      case TaskPriority.MEDIUM:
        return 'Medium';
      case TaskPriority.LOW:
        return 'Low';
    }
  }
}