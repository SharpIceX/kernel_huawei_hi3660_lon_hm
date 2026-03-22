适配设备：Huawei Mate 9 Pro(LON-AL00)
适配大包版本：LON-LGRP1-CHN 102.0.0.262
内核上游日期：2021-11-17

! 记得拉取所有子模块：“git submodule update --init --recursive”
! 安装前格式化“userdata”并手动刷入“hw_init”数据

## 内核

make kernel
make pack_kernel

最终文件：“./out/kernel.img”

## vbmeta

文件：“./project/block/vbmeta.img”

## 内核特性

- 移除遥测相关代码
- 关闭 AVB 校验
- SELinux 宽容
- ReSukiSU 支持
