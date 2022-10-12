import 'package:get/get.dart';
import 'package:tyba_todo/domain/local_db/i_local_db_repository.dart';
import 'package:tyba_todo/infrastructure/local_db/local_db_respository.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILocalDbRepository>(
      LocalDbRepository.new,
      fenix: true,
    );
  }
}
