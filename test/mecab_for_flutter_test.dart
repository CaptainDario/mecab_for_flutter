import 'package:flutter_test/flutter_test.dart';
import 'dart:io';

import 'package:mecab_for_flutter/mecab_for_flutter.dart';



void main() {
  
  test('test mecab for dart', () async {
    print(Directory.current);
    final tagger = await Mecab.create("mecab.dylib", "ipadic", "-Owakati");

    final surfaces = tagger.parse("林檎を食べる").map((e) => e.surface,).toList();
    expect(surfaces, ["林檎", "を", "食べる", "EOS"]);
  });

}