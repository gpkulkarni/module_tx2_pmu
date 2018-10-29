VERSION=
obj-m +=  thunderx2_pmu${VERSION}.o
DIR=$(PWD)

SYM_ADDR=$(shell cat /proc/kallsyms | grep -w perf_event_update_userpage | cut -d ' ' -f 1)
SYM_GLBL=$(shell cat /proc/kallsyms | grep perf_event_update_userpage | grep -q ksymtab && echo "1" || echo "0x$(SYM_ADDR)")
ccflags-y := -DEXPORT_HACK="$(SYM_GLBL)" -Wno-int-conversion

all:
	make -C /lib/modules/$(shell uname -r)/build/ M=$(DIR) modules
clean:
	make -C /lib/modules/$(shell uname -r)/build/ M=$(DIR) clean
