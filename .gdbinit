set disassembly-flavor intel
set print asm-demangle on

python                                                                                                                                                                                                                                                 1 import sys
sys.path.insert(0, '/usr/share/gcc/python/')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers(None)
end