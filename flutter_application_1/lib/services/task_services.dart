/*import '../models/task.dart';
import 'mock_data_service.dart';

class TaskService {
  final MockDataService _mockService = MockDataService();
  // When you're ready to implement real API, you'll add:
  // final ApiService _apiService = ApiService();

  Future<List<Task>> getTasks() async {
    try {
      // When implementing real API, you'll switch this line:
      // return await _apiService.getTasks();
      return await _mockService.getTasks();
    } catch (e) {
      throw Exception('Failed to load tasks: $e');
    }
  }

  Future<Task> createTask(Task task) async {
    try {
      return await _mockService.createTask(task);
    } catch (e) {
      throw Exception('Failed to create task: $e');
    }
  }

  Future<Task> updateTask(Task task) async {
    try {
      return await _mockService.updateTask(task);
    } catch (e) {
      throw Exception('Failed to update task: $e');
    }
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await _mockService.deleteTask(taskId);
    } catch (e) {
      throw Exception('Failed to delete task: $e');
    }
  }
}*/
// File: lib/services/task_service.dart
import '../models/task.dart';

class TaskService {
  // Mock data store
  final List<Task> _tasks = [];

  // Get all tasks
  Future<List<Task>> getTasks() async {
    await Future.delayed(const Duration(milliseconds: 800)); // Simulate network delay
    return _tasks;
  }

  // Create a task
  Future<Task> createTask(Task task) async {
    await Future.delayed(const Duration(milliseconds: 800));
    final newTask = task.copyWith(
      id: (_tasks.length + 1).toString(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    _tasks.add(newTask);
    return newTask;
  }

  // Update a task
  Future<Task> updateTask(Task task) async {
    await Future.delayed(const Duration(milliseconds: 800));
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task.copyWith(updatedAt: DateTime.now());
      return _tasks[index];
    }
    throw Exception('Task not found');
  }

  // Delete a task
  Future<void> deleteTask(String taskId) async {
    await Future.delayed(const Duration(milliseconds: 800));
    _tasks.removeWhere((task) => task.id == taskId);
  }
}