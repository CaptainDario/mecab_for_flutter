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

## Usage

The basic usage is super simple and nearly the same as the dart packge.
The only difference is that this package ships pre-compiled binaries for mecab.
Therefore, it is no neccessary to pass the path to the mecab binary.

```dart
var tagger = await Mecab.create("<DICT_MECAB_PATH>", "<YOUR_MECAB_OPTIONS>");
tagger.parse('にわにわにわにわとりがいる。')
// ... do somthing with the result
```

For more details see [the dart package's documentation](https://github.com/CaptainDario/mecab_for_dart) and for a more detailed example see [the ./example/](./example).
