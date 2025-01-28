// Package imports:
import 'package:universal_ffi/ffi_utils.dart' as ffi;
import 'package:mecab_for_dart/mecab_dart.dart' as mecab_dart;
import 'package:mecab_for_dart/mecab_ffi.dart';
import 'package:mecab_for_flutter/lib_mecab.dart';

/// Class that represents a Mecab instance
class Mecab extends mecab_dart.Mecab{


  /// Pointer to the Mecab instance on the C side
  late final MecabDartFfi mecabDartFfi;


  /// Initializes this mecab instance,
  /// `dictDir` should be a directory that contains a Mecab dictionary
  /// (ex. IpaDic) 
  /// If `includeFeatures` is set, the output of mecab includes the
  /// token-features.
  /// Optional:
  ///   `libmecabPath` path to a mecab dynamic library
  /// 
  /// Warning: This method needs to be called before any other method
  Future<void> initFlutter(String dictDir, bool includeFeatures, {String? libmecabPath}) async {
  
    var options = includeFeatures ? "" : "-Owakati";
    mecabDartFfi = MecabDartFfi();
    if(libmecabPath != null){
      await mecabDartFfi.init(libmecabPath: libmecabPath);
    }
    else{
      await mecabDartFfi.init(mecabFfiHelper: await loadMecabDartLib());
    }

    mecabDartFfi.mecabDartFfiHelper.safeUsing((ffi.Arena arena) {
      mecabDartFfi.mecabPtr = mecabDartFfi.initMecabFfi(
        options.toNativeUtf8(), dictDir.toNativeUtf8());
    });
    
  }

}
