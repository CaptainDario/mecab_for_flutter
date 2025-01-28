import 'package:mecab_for_flutter/mecab_flutter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:io';



void main() {
  
  test('test mecab for dart', () async {
    print(Directory.current);
    final tagger = Mecab();
    await tagger.init("mecab.dylib", "ipadic", true);

    final surfaces = tagger.parse("林檎を食べる").map((e) => e.surface,).toList();
    expect(surfaces, ["林檎", "を", "食べる", "EOS"]);
  });

}