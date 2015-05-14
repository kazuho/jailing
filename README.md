jailing
=======

Jailing is a minimalistic chroot jail builder/runner script.

When invoked, it automatically setups the chroot environment by doing the following, and then executes the given command within the environment.
- remount system directories as read-only under the chroot directory tree
- copy setting files (/etc/passwd, /etc/resolv.conf, etc.)

The tool by default does not expose the directories that likely contain user-data (e.g. /usr/local, /home, /root, /var).
Such directories should be exported explicitly to the jail by using the `--bind` option.

For example, if you have Apache HTTP server installed under `/usr/local/apache`, and want to run it under a jailed environment, simply run:

```
% sudo jailing --root=/var/httpd-jail --bind /usr/local/apache \
    -- \
    /usr/local/apache/bin/httpd -c /usr/local/apache/conf/httpd.conf
```

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

