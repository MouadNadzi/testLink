/*import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  // Handle profile tap
                },
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for your tasks...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                FilterChip(
                  label: const Text('Today'),
                  selected: true,
                  onSelected: (bool value) {},
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Completed'),
                  selected: false,
                  onSelected: (bool value) {},
                ),
              ],
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('No tasks yet'),
            ),
          ),
        ],
      ),
    );
  }
}
*/
// File: lib/screens/home/home_screen.dart
// File: lib/screens/home/home_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/task_controller.dart';
import '../../widgets/task/task_card.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../models/task.dart';
import '../../config/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _showCompleted = false;
  bool _isSearching = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskController>(
      builder: (context, taskController, _) {
        final filteredTasks = _filterTasks(taskController.tasks);

        return Scaffold(
          appBar: _isSearching
              ? AppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      setState(() {
                        _isSearching = false;
                        _searchQuery = '';
                        _searchController.clear();
                      });
                    },
                  ),
                  title: TextField(
                    controller: _searchController,
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'Search tasks...',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          _searchController.clear();
                          _searchQuery = '';
                        });
                      },
                    ),
                  ],
                )
              : CustomAppBar(
                  title: 'My Tasks',
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        setState(() {
                          _isSearching = true;
                        });
                      },
                    ),
                  ],
                ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    FilterChip(
                      label: const Text('All Tasks'),
                      selected: !_showCompleted,
                      onSelected: (selected) {
                        setState(() {
                          _showCompleted = !selected;
                        });
                      },
                      selectedColor: AppTheme.primaryColor.withOpacity(0.2),
                    ),
                    const SizedBox(width: 8),
                    FilterChip(
                      label: const Text('Completed'),
                      selected: _showCompleted,
                      onSelected: (selected) {
                        setState(() {
                          _showCompleted = selected;
                        });
                      },
                      selectedColor: AppTheme.primaryColor.withOpacity(0.2),
                    ),
                  ],
                ),
              ),
              if (taskController.error != null)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    taskController.error!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              Expanded(
                child: filteredTasks.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: filteredTasks.length,
                        itemBuilder: (context, index) {
                          return TaskCard(
                            task: filteredTasks[index],
                            onStatusChanged: (newStatus) {
                              taskController.updateTask(
                                filteredTasks[index].copyWith(
                                  status: newStatus,
                                  updatedAt: DateTime.now(),
                                ),
                              );
                            },
                            onDelete: () {
                              taskController.deleteTask(filteredTasks[index].id!);
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, '/add-task'),
            backgroundColor: AppTheme.primaryColor,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  List<Task> _filterTasks(List<Task> tasks) {
    return tasks.where((task) {
      // Filter by completion status
      if (_showCompleted != (task.status == TaskStatus.COMPLETED)) {
        return false;
      }

      // Filter by search query
      if (_searchQuery.isNotEmpty) {
        final query = _searchQuery.toLowerCase();
        return task.title.toLowerCase().contains(query) ||
            task.description.toLowerCase().contains(query);
      }

      return true;
    }).toList();
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _showCompleted ? Icons.task_alt : Icons.assignment_outlined,
            size: 64,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            _showCompleted ? 'No completed tasks yet' : 'No tasks yet',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _showCompleted
                ? 'Complete some tasks to see them here'
                : 'Add some tasks to get started',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}