import 'package:flutter/material.dart';
import 'package:flutter_with_wikitude/models/procedure_step.dart';

class Procedure {
  String procedureName;
  List<ProcedureStep> steps;

  Procedure({required this.procedureName, required this.steps});
}
