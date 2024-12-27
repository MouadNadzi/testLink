// File: lib/models/task.dart
import 'package:flutter/material.dart';

enum TaskCategory {
  grocery,
  work,
  sport,
  design,
  university,
  social,
  music,
  health,
  movie,
  home,
  personal, other, shopping
}

enum TaskPriority { HIGH, MEDIUM, LOW }
enum TaskStatus { TODO, IN_PROGRESS, COMPLETED }

class Task {
  final String? id;
  final String title;
  final String description;
  final TaskCategory category;
  final TaskPriority priority;
  final TaskStatus status;
  final DateTime dateTime;
  final DateTime dueDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String userId;
  final String? categoryId;
  
  bool get isCompleted => status == TaskStatus.COMPLETED;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.priority,
    this.status = TaskStatus.TODO,
    required this.dateTime,
    required this.dueDate,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    this.categoryId,
  });

  Task copyWith({
    String? id,
    String? title,
    String? description,
    TaskCategory? category,
    TaskPriority? priority,
    TaskStatus? status,
    DateTime? dateTime,
    DateTime? dueDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    String? categoryId,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      dateTime: dateTime ?? this.dateTime,
      dueDate: dueDate ?? this.dueDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userId: userId ?? this.userId,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id']?.toString(),
      title: json['title'] as String,
      description: json['description'] as String,
      category: TaskCategory.values.firstWhere(
        (e) => e.toString() == 'TaskCategory.${json['category']}',
        orElse: () => TaskCategory.personal,
      ),
      priority: TaskPriority.values.firstWhere(
        (e) => e.toString() == 'TaskPriority.${json['priority']}',
        orElse: () => TaskPriority.MEDIUM,
      ),
      status: TaskStatus.values.firstWhere(
        (e) => e.toString() == 'TaskStatus.${json['status']}',
        orElse: () => TaskStatus.TODO,
      ),
      dateTime: DateTime.parse(json['dateTime']),
      dueDate: DateTime.parse(json['dueDate']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      userId: json['userId'].toString(),
      categoryId: json['categoryId']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category.toString().split('.').last,
      'priority': priority.toString().split('.').last,
      'status': status.toString().split('.').last,
      'dateTime': dateTime.toIso8601String(),
      'dueDate': dueDate.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'userId': userId,
      'categoryId': categoryId,
    };
  }
}