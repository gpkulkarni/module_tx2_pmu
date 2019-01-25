VERSION=
obj-m +=  thunderx2_pmu${VERSION}.o
DIR=$(PWD)

all:
	make -C /lib/modules/$(shell uname -r)/build/ M=$(DIR) modules
clean:
	make -C /lib/modules/$(shell uname -r)/build/ M=$(DIR) clean
