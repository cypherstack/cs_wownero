#ifndef FLUTTER_PLUGIN_cs_wownero_FLUTTER_LIBS_LINUX_PLUGIN_H_
#define FLUTTER_PLUGIN_cs_wownero_FLUTTER_LIBS_LINUX_PLUGIN_H_

#include <flutter_linux/flutter_linux.h>

G_BEGIN_DECLS

#ifdef FLUTTER_PLUGIN_IMPL
#define FLUTTER_PLUGIN_EXPORT __attribute__((visibility("default")))
#else
#define FLUTTER_PLUGIN_EXPORT
#endif

typedef struct _CsWowneroFlutterLibsLinuxPlugin CsWowneroFlutterLibsLinuxPlugin;
typedef struct {
  GObjectClass parent_class;
} CsWowneroFlutterLibsLinuxPluginClass;

FLUTTER_PLUGIN_EXPORT GType cs_wownero_flutter_libs_linux_plugin_get_type();

FLUTTER_PLUGIN_EXPORT void cs_wownero_flutter_libs_linux_plugin_register_with_registrar(
    FlPluginRegistrar* registrar);

G_END_DECLS

#endif  // FLUTTER_PLUGIN_cs_wownero_FLUTTER_LIBS_LINUX_PLUGIN_H_
