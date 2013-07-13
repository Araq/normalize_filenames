import nake, os

const
  exe_name = "normalize_filenames"

task "local_install", "Copies " & exe_name & " to your ~/bin directory":
  if shell("nimrod c", exe_name):
    let dest = getHomeDir() / "bin" / exe_name
    copyFile(exe_name, dest)
    dest.setFilePermissions(exe_name.getFilePermissions)

task "test", "Performs a few renaming tests":
  if shell("nimrod c", exe_name):
    shell("./" & exe_name & " \"[CAM] 130708 _uc368_ub2c8_ud790 Goodbye To Romance - KBS _ub77c_ub514_uc624 __uc774_ubb34_uc1a1, _uc784_uc218_ubbfc_uc758 _ud76c_ub9dd_uac00_uc694_ _uacf5_uac1c_ubc29_uc1a1_hd.mp4\"")
