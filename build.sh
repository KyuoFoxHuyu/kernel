#rm -rf out
export PATH=/root/clang/bin:${PATH}
make O=out ARCH=arm64 CC=/root/clang/bin/clang CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE_ARM32=arm-linux-gnueabi- kyuo_lmi_defconfig
make -j$(nproc --all) O=out \ARCH=arm64 \CC=/root/clang/bin/clang \
	CROSS_COMPILE=aarch64-linux-gnu- \
	CROSS_COMPILE_ARM32=arm-linux-gnueabi- \
#	LD=/root/clang/bin/ld.lld \
	OBJCOPY=/root/clang/bin/llvm-objcopy \
	OBJDUMP=/root/clang/bin/llvm-objdump \
	STRIP=/root/clang/bin/llvm-strip \
	NM=/root/clang/bin/llvm-nm \
	AR=/root/clang/bin/llvm-ar | tee kernel.log