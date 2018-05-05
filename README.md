List System Base (lsb)

This is a shell script that mimics the operation of the Linux command 'lsb_release'
so that it returns useful equivalent information on MacOS and OpenWRT NIX variants

The Makefile places the script under /usr/local/bin

On MacOS 2 symlinks are created:
    - /usr/local/bin/lsb_release
    - /usr/local/bin/msb_release

On OpenWRT 1 symlink is created:
    - /usr/local/bin/lsb_release
