import 'package:flutter/cupertino.dart';
import 'package:personal_ai/models/models_model.dart';

class ModelsProvider with ChangeNotifier{


  String currentModel = "model1";
  String get getCurrentModel{
    return currentModel;
  }
  void setCurrentModel (String newModel){
    currentModel = newModel;
    notifyListeners();
  }
  List<ModelsModel> modelsList = [];
  List<ModelsModel> get getModelsList{
    return modelsList;
  }

  Future<List<ModelsModel>> getAllModels ()async{
  //  modelsList = await ApiServices.getModels();
    return modelsList;
  }

}
