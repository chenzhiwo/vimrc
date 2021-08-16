# vimrc
vimrc，可自动安装vundle插件管理器。

# 简介
vimrc是vim的主配置文件，另外还有两个文件vimrc.vundle和vimrc.plugin。
vimrc.vundle是vundle插件管理器的配置文件，在里面可以配置你自己所需要的插件。
vimrc.plugin是vim的插件的配置文件，如键映射还有一些参数设置。
当然，如果不喜欢或者完全不需要插件，那么可以把``~/.vimrc.plugin``和``~/.vimrc.vundle``删除。单独一个vimrc也可以正常工作。
我加入了vimrc更新功能，每次执行``:VundleInstall``后，如果vimrc有新版本，那么可以执行``:Updatevimrc``来安装最新的vimrc文件。

# 安装
```
$ git clone git@github.com:chenzhiwo/vimrc.git
$ cd vimrc
$ make install
```

vim启动时候就会下载安装最新的插件。

# 使用
安装完成以后，就可以使用vundle来控制插件了。
`:PluginInstall(VundleInstall)`命令会检查github上的插件是否有新版本，有则下载下来。
具体的使用可以查看vim帮助文档
```
:help :Bundle
```
