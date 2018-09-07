
PYTHONINCLUDE = $$BITS_PATH/python/include
debug {
  PYTHONLIBFILE = $$BITS_PATH/python/libraries/python36_d.lib
  PYTHON = $$shell_path($$BITS_PATH/python/bin/python_d.exe)
  PYTHONEXTSUFFIX = _d.pyd
} else {
  PYTHONLIBFILE = $$BITS_PATH/python/libraries/python36.lib
  PYTHON = $$shell_path($$BITS_PATH/python/bin/python.exe)
  PYTHONEXTSUFFIX = .pyd
}
