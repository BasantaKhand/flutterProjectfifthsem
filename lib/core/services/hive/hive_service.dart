import 'package:dinesmart_app/core/constants/hive_box_constants.dart';
import 'package:dinesmart_app/features/auth/data/models/auth_hive_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

//provider
final hiveServiceProvider = Provider<HiveService>((ref) {
  return HiveService();
});

class HiveService {
    // hive initialization
  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/${HiveBoxConstants.dbName}';
    Hive.init(path);

    // register adapter
    _registerAdapter();
    await _openBoxes();
  }

  void _registerAdapter() {
    // Register Hive adapters here in future
    if(!Hive.isAdapterRegistered(HiveBoxConstants.authTypeId)){
      Hive.registerAdapter(AuthHiveModelAdapter());
    }
  } 

  Future<void> _openBoxes() async {
    // Open Hive boxes here in future
    await Hive.openBox<AuthHiveModel>(HiveBoxConstants.authBox);
  }

  Future<void> closeHive() async {
    await Hive.close();
  }



  //*********************auth queries***********************/
  Box<AuthHiveModel> get _authBox => Hive.box<AuthHiveModel>(HiveBoxConstants.authBox);


  Future<AuthHiveModel> register(AuthHiveModel model) async {
    await _authBox.put(model.authId, model);
    return model;
  }


  Future<AuthHiveModel?> login(String email, String password) async{
    try {
      return _authBox.values.firstWhere(
        (model) =>model.email ==email && model.password ==password
      );
    }catch(e){
      return null;
    }
  }
  Future<AuthHiveModel?> getUserByEmail(String email) async {
    try {
      return _authBox.values.firstWhere(
        (model) =>model.email ==email
      );
    }catch(e){
      return null;
    }
  }

}