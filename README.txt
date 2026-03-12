适配设备：Huawei Mate 9 Pro(LON-AL00)
适配大包版本：LON-LGRP1-CHN 102.0.0.262
内核上游日期：2021-11-17

## 构建和打包

make kernel
make pack_kernel

## 特性

- 移除遥测相关代码
- 关闭 AVB 校验
- SELinux 宽容
- ReSukiSU 支持
