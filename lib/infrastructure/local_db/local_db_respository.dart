import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tyba_todo/domain/core/entities/task.dart';
import 'package:tyba_todo/domain/local_db/i_local_db_repository.dart';

class LocalDbRepository extends ILocalDbRepository {
  //o banco de dados declarado como late sera inicializado na primeira leitura
  late Database db;

  @override
  Future<void> init() async {
    db = await _getDatabase();
  }

  Future<Database> _getDatabase() async {
    // Recupera pasta da aplicacao
    final databasesPath = await getDatabasesPath();
    return db = await openDatabase(
      join(databasesPath, 'tasks.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, name TEXT, description TEXT)');
      },
      version: 1,
    );
  }

  // recuperar todas as notas
  @override
  Future<List<Task>> getAll() async {
    final result = await db.rawQuery('SELECT * FROM tasks ORDER BY id');
    return result.map(Task.fromJson).toList();
  }

  //criar nova nota
  @override
  Future<Task> save(Task task) async {
    final id = await db.rawInsert(
      'INSERT INTO tasks (name, description) VALUES (?,?)',
      [task.name, task.description],
    );

    return task.copyWith(id: id);
  }

  //atualizar nota
   @override
  Future<Task> update(Task task) async {
    final id = await db.rawUpdate(
      'UPDATE tasks SET name = ?, description = ? WHERE id = ?',
      [
        task.name,
        task.description,
        task.id,
      ],
    );

    return task.copyWith(id: id);
  }

  //excluir nota
  @override
  Future<int> delete(int taskId) async {
    final id = await db.rawDelete('DELETE FROM tasks WHERE id = ?', [taskId]);

    return id;
  }

  //fechar conexao com o banco de dados, funcao nao usada nesse app
  Future<void> close() async {
    await db.close();
  }
}
