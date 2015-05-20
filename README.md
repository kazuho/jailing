jailing
=======

Jailing is a minimalistic, super-easy chroot jail builder/runner script.

It is by no means a container service, or tries to be.
It is a helper tool for running a program under a restricted environment, preventing it from making changes to other parts of the host even if gets cracked.

When invoked, it automatically setups the chroot environment by doing the following, and then executes the given command within the environment.
- __remount system directories as read-only__ under the chroot directory tree
- copy setting files (/etc/passwd, /etc/resolv.conf, etc.)
- drop all capabilities (see [man 7 capabilities](http://man7.org/linux/man-pages/man7/capabilities.7.html))

The tool by default __does NOT expose directories that likely contain user-data__ (e.g. `/usr/local`, `/home`, `/var`).
Such directories should be exported explicitly to the jail by using the `--bind` option.

For example, if you have Apache HTTP server installed under `/usr/local/apache`, and want to run it under a jailed environment, simply run:

```
% sudo jailing --root=/var/httpd-jail --bind /usr/local/apache \
    -- \
    /usr/local/apache/bin/httpd -c /usr/local/apache/conf/httpd.conf
```

For more information, consult `man jailing`.

INSTALLATION
------------

```
% perl Makefile.PL
% make
% sudo make install
```

LICENSE
-------

MIT

