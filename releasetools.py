import common
import edify_generator
import os

def ModifyBegin(edify):
  edify.script[0] = \
  '''ifelse(is_mounted("/system"), unmount("/system"));
ifelse(is_mounted("/data"), unmount("/data"));
ui_print("===============================================");
ui_print("      MIUI 8 Global for Moto X (Ghost)         ");
ui_print("===============================================");
ui_print("              By luisbocanegra                 ");
ui_print("===============================================");\n''' + edify.script[0]

def FullOTA_InstallEnd(info):
    edify = info.script
    ModifyBegin(edify)
