
PYTHONINCLUDE = $$BITS_PATH/python/include
CONFIG(debug, debug|release) {
  PYTHONLIBFILE = $$BITS_PATH/python/libs/python39_d.lib
  PYTHON = $$shell_path($$BITS_PATH/python/bin/python_d.exe)
  PYTHONEXTSUFFIX = _d.pyd
} else {
  PYTHONLIBFILE = $$BITS_PATH/python/libs/python39.lib
  PYTHON = $$shell_path($$BITS_PATH/python/bin/python.exe)
  PYTHONEXTSUFFIX = .pyd
}
