# mecab_for_flutter

MeCab(Japanese Morphological Analyzer) bindings for flutter on all platforms.
[Try it out in the browser!](https://captaindario.github.io/mecab_for_flutter/).

| Android | iOS | Windows | MacOS | Linux | Web | Web --wasm |
|:-------:|:---:|:-------:|:-----:|:-----:|:---:|:----------:|
|    ✅    |  ✅  |    🚧    |   ✅   |   ✅   |  ✅  |      [❌](https://github.com/CaptainDario/mecab_for_dart/issues/5)     |

## Installation

1. Add this plug_in as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).
```yaml
dependencies:   
   mecab_for_flutter: <your_version> 
```

## Libraries

### Native platforms

On `dart:io` platforms this plugin ships with the mecab binaries.

### Web

On web this package expects that the libraries are in `assets/blobs/`.
Alternatively, the base `init` constructor can be used with a custom path.

This library tries to load the mecab dictionary from the WASM filesystem.
The easiest way to get the dictionary in it, is by bundling it when compiling mecab to wasm.
However, it may be desirable to swap dictionaries. To do this, you need to load the dictionary into libmecab's wasm memory.

[See the dart package](https://github.com/CaptainDario/mecab_for_dart?tab=readme-ov-file#building-the-binaries) for more details about the mecab libraries.

## Example

Init Mecab:

```dart
var tagger = new Mecab();
await tagger.initFlutter("path/to/your/dictionary/", true);
```

Set the boolean option in `init` function to true if you want to get the tokens including features,
set it to false if you only want the token surfaces.

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

For a more detailed example see [the ./example/](./example)