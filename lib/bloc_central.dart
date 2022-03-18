import 'package:test_app_miaguila/bloc_navigator.dart';

import 'src/entities/entity_injector.dart';

class BlocCentral extends Injector {
  BlocCentral() {
    
  }
  
  dispose() {
    blocNavigator.dispose();
  }
}

final blocCentral = BlocCentral();
