#include "include/mecab_for_flutter/mecab_for_flutter_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "mecab_for_flutter_plugin.h"

void MecabForFlutterPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  mecab_for_flutter::MecabForFlutterPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
