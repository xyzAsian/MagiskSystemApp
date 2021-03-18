# Magisk System app
基于 Magisk 内置 APP 为系统应用

## 使用方法
step 1
将要内置的 apk 放在 module/apps/system/app/ 下面，类似 demo

step 2
然后执行 zipMagiskMoudle gradle task，会在 out 目录下生成 Magisk Module

step 3
按照普通安装 Magisk Modeule 方式安装生成的 Module，重启手机即可