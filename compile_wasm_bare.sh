SOURCE_PATH="macos/Classes"


emcc -std=c++11 -Wno-register -O3 \
    -s EXPORTED_FUNCTIONS="['_malloc', '_free', '_destroyMecab']" \
    -s EXPORTED_RUNTIME_METHODS="['wasmExports']" \
    -s MODULARIZE=1 \
    -s ALLOW_MEMORY_GROWTH \
    -s EXPORT_NAME="libmecab" \
    -s FORCE_FILESYSTEM \
    -s ASSERTIONS \
    $SOURCE_PATH/param.cpp $SOURCE_PATH/string_buffer.cpp \
    $SOURCE_PATH/char_property.cpp $SOURCE_PATH/tagger.cpp \
    $SOURCE_PATH/connector.cpp $SOURCE_PATH/tokenizer.cpp \
    $SOURCE_PATH/context_id.cpp $SOURCE_PATH/dictionary.cpp $SOURCE_PATH/utils.cpp \
    $SOURCE_PATH/viterbi.cpp $SOURCE_PATH/writer.cpp $SOURCE_PATH/iconv_utils.cpp \
    $SOURCE_PATH/eval.cpp $SOURCE_PATH/nbest_generator.cpp \
    $SOURCE_PATH/dart_ffi.cpp $SOURCE_PATH/libmecab.cpp \
    -o emcc_out/libmecab.js
    