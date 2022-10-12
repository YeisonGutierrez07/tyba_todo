import 'package:tyba_todo/domain/core/entities/task.dart';

abstract class ILocalDbRepository {
  Future<void> init();
  Future<List<Task>> getAll();
  Future<Task> save(Task task);
  Future<Task> update(Task task);
  Future<int> delete(int taskId);
}
