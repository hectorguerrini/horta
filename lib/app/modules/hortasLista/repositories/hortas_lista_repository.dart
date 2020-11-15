import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/modules/endereco/model/endereco_model.dart';
import 'package:horta/app/modules/perfil/models/horta_model.dart';
import 'package:horta/app/shared/auth/auth_controller.dart';

//part 'hortas_lista_repository.g.dart';

@Injectable()
class HortasListaRepository extends Disposable {
  final CollectionReference _hortaCollection =
      FirebaseFirestore.instance.collection('hortas');
  final AuthController _authController = Modular.get();

  @override
  void dispose() {}
  Future updateEnderecoHorta(EnderecoModel enderecoModel) async {
    return await _hortaCollection
        .doc(_authController.user.uid)
        .set(enderecoModel.toJson(), SetOptions(merge: true));
  }

  Stream<List<HortaModel>> getHortas() {
    return _hortaCollection.snapshots().map((event) => event.docs
        .map((e) => HortaModel.fromJson(e.data())..reference = e.reference)
        .toList());
  }

  getEnderecoHorta() async {
    _hortaCollection
        .doc(_authController.user.uid)
        .get()
        .then((value) => print(EnderecoModel.fromJson(value.data())));
  }
}
