// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:universal_ffi/ffi_helper.dart';
import 'package:universal_io/io.dart';
import 'package:path/path.dart' as p;



Future<FfiHelper> loadMecabDartLib () async {

  FfiHelper ffiHelper;

  if (kIsWeb) {
    ffiHelper = (await FfiHelper.load("assets/blobs/libmecab.js"));
  }
  else if(Platform.isAndroid){
    // 'lib' is automatically added to the library name
    ffiHelper = (await FfiHelper.load("mecab_dart.so", options: {LoadOption.isFfiPlugin}));
  }
  else if(Platform.isWindows) {
    ffiHelper = (await FfiHelper.load(
      p.joinAll([
        Directory(Platform.resolvedExecutable).parent.path, "blobs", "libmecab.dll"
      ]),
    ));
  }
  else {
    ffiHelper = (await FfiHelper.load("",
      options: {LoadOption.isStaticallyLinked, LoadOption.isFfiPlugin}));
  }

  return ffiHelper;

}

