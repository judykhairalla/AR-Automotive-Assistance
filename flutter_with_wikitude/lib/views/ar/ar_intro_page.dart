import 'package:flutter/material.dart';

import 'package:augmented_reality_plugin_wikitude/wikitude_plugin.dart';
import 'package:augmented_reality_plugin_wikitude/wikitude_response.dart';
import 'package:flutter_with_wikitude/constants.dart';
import 'package:flutter_with_wikitude/models/sample.dart';

import 'package:go_router/go_router.dart';

class ARIntroPage extends StatefulWidget {
  const ARIntroPage({super.key});

  @override
  State<ARIntroPage> createState() => _ARIntroPageState();
}

class _ARIntroPageState extends State<ARIntroPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text("ARabeitak", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              !_isLoading
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        await _pushArView(sample: kMainSample);
                        setState(() {
                          _isLoading = false;
                        });
                      },
                      child: const Text("Scan"))
                  : const CircularProgressIndicator(
                      color: Colors.white,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future<WikitudeResponse> _requestARPermissions(List<String> features) async {
    return await WikitudePlugin.requestARPermissions(features);
  }

  void _showPermissionError(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Permissions required"),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Open settings'),
                onPressed: () {
                  Navigator.of(context).pop();
                  WikitudePlugin.openAppSettings();
                },
              )
            ],
          );
        });
  }

  Future<void> _pushArView({required Sample sample}) async {
    WikitudeResponse permissionsResponse =
        await _requestARPermissions(sample.requiredFeatures);
    if (permissionsResponse.success) {
      GoRouter.of(context).push('/ar/arview', extra: sample);
    } else {
      _showPermissionError(permissionsResponse.message);
    }
  }
}
