KERNELRELEASE ?= $(shell uname -r)
KERNEL_DIR  ?= /lib/modules/$(KERNELRELEASE)/build
PWD := $(shell pwd)

obj-m := v4l2loopback-dc.o

all:
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD) modules

install:
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD) modules_install

test:
	gcc test.c -o test

clean:
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD) clean

insmod:
	sudo insmod cxadc.ko

rmmod:
	sudo rmmod cxadc.ko
