# mecab_for_flutter

MeCab(Japanese Morphological Analyzer) bindings for flutter on all platforms.
[Try it out in the browser!](https://captaindario.github.io/mecab_for_flutter/).

| Android | iOS | Windows | MacOS | Linux | Web | Web --wasm |
|:-------:|:---:|:-------:|:-----:|:-----:|:---:|:----------:|
|    ✅    |  ✅  |    ✅    |   ✅   |   ✅   |  ✅  |      [❌](https://github.com/CaptainDario/mecab_for_dart/issues/5)     |

## Installation

1. Add this plug_in as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

```yaml
dependencies:   
   mecab_for_flutter: <your_version> 
```

## Libraries

### Native platforms

On `dart:io` platforms this plugin ships with the necessary mecab binaries.

### Web

On web this package expects that the libraries are in `assets/blobs/`.
Alternatively, the `init` constructor can be used with a custom path.
You can get a precompiled version [here](https://github.com/CaptainDario/mecab_for_dart/releases/tag/data).

For more details about the binaries see

* [Getting the binaries](https://pub.dev/packages/mecab_for_dart#getting-the-binaries)
* [Building the binaries](https://pub.dev/packages/mecab_for_dart#building-the-binaries)

## Example

Init Mecab:

```dart
var tagger = new Mecab();
await tagger.initFlutter("path/to/your/dictionary/", true);
```

Set the boolean option in `init` function to `true` if you want to get the tokens including features,
set it to `false` if you only want the token surfaces.

Use the tagger to parse text:

```dart
var tokens = tagger.parse('にわにわにわにわとりがいる。');
var text = '';

for(var token in tokens) {
  text += token.surface + "\t";
  for(var i = 0; i < token.features.length; i++) {
    text += token.features[i];
    if(i + 1 < token.features.length) {
       text += ",";
    }
  }
  text += "\n";
}
```

For a more detailed example see [the ./example/](./example).
