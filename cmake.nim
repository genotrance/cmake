import os, osproc, strutils

import nimterop/git

const
  baseDir = currentSourcePath.parentDir()/"cmake"
  version = "3.15.2"

static:
  downloadUrl("https://github.com/Kitware/CMake/releases/download/v$1/cmake-$1-win64-x64.zip" % version, baseDir)

when isMainModule:
  var
    cmd = baseDir/"cmake-$1-win64-x64/bin/cmake" % version
  for i in commandLineParams():
    cmd &= " " & i.quoteShell

  discard execCmd(cmd)