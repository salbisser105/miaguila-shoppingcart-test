import 'package:test_app_miaguila/bloc_navigator.dart';

import 'src/entities/entity_injector.dart';

class BlocCentral extends Injector {
  BlocCentral() {
    init();
  }
  init() async {
    /// Add all future required function to initializate befor the user can
    }
  
  dispose() {
    blocNavigator.dispose();
  }
}

final blocCentral = BlocCentral();
