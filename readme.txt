All CGxx.smg files are squashfs files, which can be modified freely, except CG35, which is the binary Kernel image.

Note: CG36 is the Root partition file and requires the offset "04" at position 0x01CFB7FC, so that the bootloader recognizes the signature as valid.
