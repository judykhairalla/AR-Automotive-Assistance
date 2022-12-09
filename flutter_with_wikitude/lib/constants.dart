import 'package:augmented_reality_plugin_wikitude/startupConfiguration.dart';
import 'package:flutter_with_wikitude/models/sample.dart';

Sample kMainSample = Sample(
  name: "Animated 3D Augmentations",
  path: "06_ObjectTracking_3_Animated3dAugmentations/index.html",
  requiredFeatures: ["object_tracking"],
  requiredExtensions: [],
  startupConfiguration: StartupConfiguration(
      cameraPosition: CameraPosition.BACK,
      cameraResolution: CameraResolution.AUTO),
);
