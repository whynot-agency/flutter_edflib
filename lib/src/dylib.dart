import 'dart:ffi';
import 'dart:io';

import 'bindings.dart';

EdfLib? _dylib;
EdfLib get dylib {
  const String libName = 'flutter_edflib';

  final DynamicLibrary lib = () {
    if (Platform.isMacOS || Platform.isIOS) {
      return DynamicLibrary.open('$libName.framework/$libName');
    }
    if (Platform.isAndroid || Platform.isLinux) {
      return DynamicLibrary.open('lib$libName.so');
    }
    if (Platform.isWindows) {
      return DynamicLibrary.open('$libName.dll');
    }
    throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
  }();

  return _dylib ??= EdfLib(lib);
}
