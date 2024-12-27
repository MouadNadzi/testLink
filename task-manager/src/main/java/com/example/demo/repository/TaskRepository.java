package com.example.demo.repository;

import com.example.demo.entity.Task;
import com.example.demo.enums.TaskPriority;
import com.example.demo.enums.TaskStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TaskRepository extends JpaRepository<Task, Long> {

    List<Task> findByStatus(TaskStatus status);

    List<Task> findByPriority(TaskPriority priority);
}
