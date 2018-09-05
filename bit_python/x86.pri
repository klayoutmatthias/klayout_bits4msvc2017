
PYTHONINCLUDE = $$BITS_PATH/python/include
debug {
  PYTHONLIBFILE = $$BITS_PATH/python/libraries/python36_d.lib
  PYTHON = $$BITS_PATH/python/bin/python36_d.exe
  PYTHONEXTSUFFIX = _d.pyd
} else {
  PYTHONLIBFILE = $$BITS_PATH/python/libraries/python36.lib
  PYTHON = $$BITS_PATH/python/bin/python36.exe
  PYTHONEXTSUFFIX = .pyd
}
