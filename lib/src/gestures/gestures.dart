import 'package:d4rt/d4rt.dart';

// Import all gesture modules
import 'package:flutter_d4rt/src/gestures/arena.dart';
import 'package:flutter_d4rt/src/gestures/binding.dart';
import 'package:flutter_d4rt/src/gestures/constants.dart';
import 'package:flutter_d4rt/src/gestures/converter.dart';
import 'package:flutter_d4rt/src/gestures/drag.dart';
import 'package:flutter_d4rt/src/gestures/drag_details.dart';
import 'package:flutter_d4rt/src/gestures/eager.dart';
import 'package:flutter_d4rt/src/gestures/events.dart';
import 'package:flutter_d4rt/src/gestures/force_press.dart';
import 'package:flutter_d4rt/src/gestures/gesture_settings.dart';
import 'package:flutter_d4rt/src/gestures/hit_test.dart';
import 'package:flutter_d4rt/src/gestures/long_press.dart';
import 'package:flutter_d4rt/src/gestures/lsq_solver.dart';
import 'package:flutter_d4rt/src/gestures/multidrag.dart';
import 'package:flutter_d4rt/src/gestures/multitap.dart';
import 'package:flutter_d4rt/src/gestures/pointer_router.dart';
import 'package:flutter_d4rt/src/gestures/pointer_signal_resolver.dart';
import 'package:flutter_d4rt/src/gestures/recognizer.dart';
import 'package:flutter_d4rt/src/gestures/scale.dart';
import 'package:flutter_d4rt/src/gestures/tap.dart';
import 'package:flutter_d4rt/src/gestures/tap_and_pan.dart';
import 'package:flutter_d4rt/src/gestures/team.dart';
import 'package:flutter_d4rt/src/gestures/velocity_tracker.dart';

/// Registers all gesture bridges and enums with the D4rt interpreter
void registerGesturesBridges(D4rt interpreter) {
  // Register arena bridges
  interpreter.registerBridgedClass(
    getGestureArenaManagerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getGestureArenaEntryBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedEnum(
    getGestureDispositionBridgingDefinition(),
    'package:flutter/gestures.dart',
  );

  // Register binding bridges
  interpreter.registerBridgedClass(
    getGestureBindingBridgingDefinition(),
    'package:flutter/gestures.dart',
  );

  // Register constants enums
  interpreter.registerBridgedEnum(
    getDragStartBehaviorBridgingDefinition(),
    'package:flutter/gestures.dart',
  );

  // Register converter bridges
  interpreter.registerBridgedClass(
    getPointerEventConverterBridgingDefinition(),
    'package:flutter/gestures.dart',
  );

  // Register event bridges
  interpreter.registerBridgedClass(
    getPointerEventBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getPointerAddedEventBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getPointerRemovedEventBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getPointerHoverEventBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getPointerEnterEventBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getPointerExitEventBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getPointerDownEventBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getPointerMoveEventBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getPointerUpEventBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getPointerSignalEventBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getPointerScrollEventBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getPointerPanZoomStartEventBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getPointerPanZoomUpdateEventBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getPointerPanZoomEndEventBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getPointerCancelEventBridgingDefinition(),
    'package:flutter/gestures.dart',
  );

  // Register drag bridges
  interpreter.registerBridgedClass(
    getDragGestureRecognizerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getVerticalDragGestureRecognizerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getHorizontalDragGestureRecognizerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getPanGestureRecognizerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );

  // Register drag details bridges
  interpreter.registerBridgedClass(
    getDragStartDetailsBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getDragUpdateDetailsBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getDragEndDetailsBridgingDefinition(),
    'package:flutter/gestures.dart',
  );

  // Register eager bridges
  interpreter.registerBridgedClass(
    getEagerGestureRecognizerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );

  // Register force press bridges
  interpreter.registerBridgedClass(
    getForcePressGestureRecognizerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getForcePressDetailsBridgingDefinition(),
    'package:flutter/gestures.dart',
  );

  // Register gesture settings bridges
  interpreter.registerBridgedClass(
    getDeviceGestureSettingsBridgingDefinition(),
    'package:flutter/gestures.dart',
  );

  // Register hit test bridges
  interpreter.registerBridgedClass(
    getHitTestResultBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getHitTestEntryBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getHitTestTargetBridgingDefinition(),
    'package:flutter/gestures.dart',
  );

  // Register long press bridges
  interpreter.registerBridgedClass(
    getLongPressGestureRecognizerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getLongPressStartDetailsBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getLongPressMoveUpdateDetailsBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getLongPressEndDetailsBridgingDefinition(),
    'package:flutter/gestures.dart',
  );

  // Register lsq solver bridges
  interpreter.registerBridgedClass(
    getLeastSquaresSolverBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getPolynomialFitBridgingDefinition(),
    'package:flutter/gestures.dart',
  );

  // Register multidrag bridges
  interpreter.registerBridgedClass(
    getMultiDragGestureRecognizerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getImmediateMultiDragGestureRecognizerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getHorizontalMultiDragGestureRecognizerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getVerticalMultiDragGestureRecognizerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getDelayedMultiDragGestureRecognizerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );

  // Register multitap bridges
  interpreter.registerBridgedClass(
    getMultiTapGestureRecognizerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getSerialTapGestureRecognizerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );

  // Register pointer router bridges
  interpreter.registerBridgedClass(
    getPointerRouterBridgingDefinition(),
    'package:flutter/gestures.dart',
  );

  // Register pointer signal resolver bridges
  interpreter.registerBridgedClass(
    getPointerSignalResolverBridgingDefinition(),
    'package:flutter/gestures.dart',
  );

  // Register recognizer bridges
  interpreter.registerBridgedClass(
    getGestureRecognizerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getOneSequenceGestureRecognizerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getPrimaryPointerGestureRecognizerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedEnum(
    getGestureRecognizerStateBridgingDefinition(),
    'package:flutter/gestures.dart',
  );

  // Note: GestureResampler is not available in current Flutter version

  // Register scale bridges
  interpreter.registerBridgedClass(
    getScaleGestureRecognizerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getScaleStartDetailsBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getScaleUpdateDetailsBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getScaleEndDetailsBridgingDefinition(),
    'package:flutter/gestures.dart',
  );

  // Register tap bridges
  interpreter.registerBridgedClass(
    getTapGestureRecognizerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getBaseTapGestureRecognizerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getTapDownDetailsBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getTapUpDetailsBridgingDefinition(),
    'package:flutter/gestures.dart',
  );

  // Register tap and drag bridges
  interpreter.registerBridgedClass(
    getTapAndPanGestureRecognizerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );

  // Register team bridges
  interpreter.registerBridgedClass(
    getGestureArenaTeamBridgingDefinition(),
    'package:flutter/gestures.dart',
  );

  // Register velocity tracker bridges
  interpreter.registerBridgedClass(
    getVelocityTrackerBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getVelocityBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
  interpreter.registerBridgedClass(
    getVelocityEstimateBridgingDefinition(),
    'package:flutter/gestures.dart',
  );
}
