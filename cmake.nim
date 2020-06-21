import os, osproc, strutils

import nimterop/build

const
  version = "3.17.3"
  url = "https://github.com/Kitware/CMake/releases/download/v$1/cmake-$1-win64-x64.zip" % version

static:
  url.downloadUrl(currentSourcePath.parentDir()/"cmake")

when isMainModule:
  var
    cmd = getAppDir()/"cmake"/"cmake-$1-win64-x64/bin/cmake" % version
  for i in commandLineParams():
    cmd &= " " & i.quoteShell

  discard execCmd(cmd)