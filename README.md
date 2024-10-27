# flutter_edflib

## Credits

This is basically a fork of [dartedflib](https://github.com/Praxa-Sense/dartedflib), adjusted to use with Flutter.

## Features

A wrapper library around [EDFLib v1.27](https://gitlab.com/Teuniz/EDFlib/-/tree/v1.27) inspired by [pyEDFlib v0.1.28](https://github.com/holgern/pyedflib/tree/v0.1.28) to read/write EDF+ files.
The definition of the EDF/EDF+/BDF/BDF+ format can be found under [edfplus.info](https://edfplus.info).

This package uses [dart:ffi](https://dart.dev/guides/libraries/c-interop) to call libEDF's C APIs, which implies that libEDF must be bundled to or deployed with the host application.

## Installation

Add `flutter_edflib` to `pubspec.yaml`:

```yaml
dependencies:
  flutter_edflib: ^0.1.0
```

## Usage

```dart
import 'package:flutter_edflib/flutter_edflib.dart';

final writer = EdfWriter(fileName: filePath, numberOfChannels: 2);

final channel1headers = {
  'label': 'channel1',
  'sample_frequency': 125,
  'physical_max': 255.0,
  'physical_min': 0.0,
  'digital_max': 255,
  'digital_min': 0,
};
final channel2headers = {
  'label': 'channel2',
  'sample_frequency': 1,
  'physical_max': 255.0,
  'physical_min': 0.0,
  'digital_max': 255,
  'digital_min': 0,
};

writer.setSignalHeader(0, channel1headers);
writer.setSignalHeader(1, channel2headers);

final seconds = 5;
final channel1data = List<double>.filled(channel1headers['sample_frequency'] * seconds, 0.1);
final channel2data = List<double>.filled(channel2headers['sample_frequency'] * seconds, 1.0);

try {
  writer.writeSamples([channel1data, channel2data]);
} finally {
  // don't forget to close it!
  writer.close();
}
```

## Additional information

### Regenerating bindings.dart

Make sure you have installed LLVM as described in [ffigen](https://pub.dev/packages/ffigen).

If you want to upgrade to a later version of EDFLib, replace `src/edflib.h` and `src/edflib.c` with a newer version and run the task.

```sh
dart run ffigen --config ffigen.yaml
```
