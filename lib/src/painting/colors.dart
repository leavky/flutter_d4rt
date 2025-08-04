import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';

/// Returns the BridgedClass for the Flutter Colors class.
BridgedClass getColorsBridgingDefinition() {
  return BridgedClass(
    nativeType: Colors,
    name: 'Colors',
    constructors: {},
    staticGetters: {
      // Couleurs de base
      'transparent': (visitor) => Colors.transparent,
      'black': (visitor) => Colors.black,
      'black12': (visitor) => Colors.black12,
      'black26': (visitor) => Colors.black26,
      'black38': (visitor) => Colors.black38,
      'black45': (visitor) => Colors.black45,
      'black54': (visitor) => Colors.black54,
      'black87': (visitor) => Colors.black87,
      'white': (visitor) => Colors.white,
      'white10': (visitor) => Colors.white10,
      'white12': (visitor) => Colors.white12,
      'white24': (visitor) => Colors.white24,
      'white30': (visitor) => Colors.white30,
      'white38': (visitor) => Colors.white38,
      'white54': (visitor) => Colors.white54,
      'white60': (visitor) => Colors.white60,
      'white70': (visitor) => Colors.white70,

      // Couleurs Material principales
      'red': (visitor) => Colors.red,
      'pink': (visitor) => Colors.pink,
      'purple': (visitor) => Colors.purple,
      'deepPurple': (visitor) => Colors.deepPurple,
      'indigo': (visitor) => Colors.indigo,
      'blue': (visitor) => Colors.blue,
      'lightBlue': (visitor) => Colors.lightBlue,
      'cyan': (visitor) => Colors.cyan,
      'teal': (visitor) => Colors.teal,
      'green': (visitor) => Colors.green,
      'lightGreen': (visitor) => Colors.lightGreen,
      'lime': (visitor) => Colors.lime,
      'yellow': (visitor) => Colors.yellow,
      'amber': (visitor) => Colors.amber,
      'orange': (visitor) => Colors.orange,
      'deepOrange': (visitor) => Colors.deepOrange,
      'brown': (visitor) => Colors.brown,
      'grey': (visitor) => Colors.grey,
      'blueGrey': (visitor) => Colors.blueGrey,

      // Couleurs d'accent
      'redAccent': (visitor) => Colors.redAccent,
      'pinkAccent': (visitor) => Colors.pinkAccent,
      'purpleAccent': (visitor) => Colors.purpleAccent,
      'deepPurpleAccent': (visitor) => Colors.deepPurpleAccent,
      'indigoAccent': (visitor) => Colors.indigoAccent,
      'blueAccent': (visitor) => Colors.blueAccent,
      'lightBlueAccent': (visitor) => Colors.lightBlueAccent,
      'cyanAccent': (visitor) => Colors.cyanAccent,
      'tealAccent': (visitor) => Colors.tealAccent,
      'greenAccent': (visitor) => Colors.greenAccent,
      'lightGreenAccent': (visitor) => Colors.lightGreenAccent,
      'limeAccent': (visitor) => Colors.limeAccent,
      'yellowAccent': (visitor) => Colors.yellowAccent,
      'amberAccent': (visitor) => Colors.amberAccent,
      'orangeAccent': (visitor) => Colors.orangeAccent,
      'deepOrangeAccent': (visitor) => Colors.deepOrangeAccent,
    },
  );
}
