
PYTHONINCLUDE = $$BITS_PATH/python/include
CONFIG(debug, debug|release) {
  PYTHONLIBFILE = $$BITS_PATH/python/libs/python39_d.lib
  PYTHON = $$shell_path($$BITS_PATH/python/bin/python_d.exe)
  PYTHONEXTSUFFIX = _d.cp39-win_amd64.pyd
} else {
  PYTHONLIBFILE = $$BITS_PATH/python/libs/python39.lib
  PYTHON = $$shell_path($$BITS_PATH/python/bin/python.exe)
  PYTHONEXTSUFFIX = .cp39-win_amd64.pyd
}
