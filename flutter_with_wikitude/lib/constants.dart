import 'package:augmented_reality_plugin_wikitude/startupConfiguration.dart';
import 'package:flutter_with_wikitude/models/procedure.dart';
import 'package:flutter_with_wikitude/models/procedure_step.dart';
import 'package:flutter_with_wikitude/models/sample.dart';

ProcedureStep procedureStep1 = ProcedureStep(
  stepName: "Step 1",
  stepDescription: "This is the first step",
);
ProcedureStep procedureStep2 = ProcedureStep(
  stepName: "Step 2",
  stepDescription: "This is the second step",
);
ProcedureStep procedureStep3 = ProcedureStep(
  stepName: "Step 3",
  stepDescription: "This is the third step",
);

Procedure kAddWiperFluid = Procedure(
    procedureName: "Adding Wiper Fluid Procedure",
    steps: [procedureStep1, procedureStep2, procedureStep3]);

Sample kMainSample = Sample(
  name: "Animated 3D Augmentations",
  path: "06_ObjectTracking_3_Animated3dAugmentations/index.html",
  requiredFeatures: ["object_tracking"],
  requiredExtensions: [],
  startupConfiguration: StartupConfiguration(
      cameraPosition: CameraPosition.BACK,
      cameraResolution: CameraResolution.AUTO),
  procedure: kAddWiperFluid,
);
