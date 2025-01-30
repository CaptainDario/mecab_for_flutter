// Dart imports:
import 'dart:async';
import 'dart:ffi';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:universal_ffi/ffi_helper.dart';
import 'package:universal_io/io.dart';



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
    String architecture = () {
      if(Abi.current() == Abi.windowsArm64){
        return "arm64";
      }
      else if(Abi.current() == Abi.windowsX64){
        return "x86";
      }
      else{
        throw PlatformException(code: "This platform is not supported by mecab_for_flutter!");
      }
    } ();
    ffiHelper = (await FfiHelper.load(
      "libmecab_${architecture}.dll"
    ));
  }
  else {
    ffiHelper = (await FfiHelper.load("",
      options: {LoadOption.isStaticallyLinked, LoadOption.isFfiPlugin}));
  }

  return ffiHelper;

}

