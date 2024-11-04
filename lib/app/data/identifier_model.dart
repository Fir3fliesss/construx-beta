// import 'package:construx/models/model.dart';
import 'package:construx_beta/app/data/model.dart';



abstract class IdentifierModel<T> extends Model {
  final int id;

  IdentifierModel(this.id);
}
