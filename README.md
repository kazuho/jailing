jailing
=======

Jailing is a minimalistic chroot jail builder/runner script.

When invoked, it automatically setups the chroot envoriment by doing the following, and then executes the given command within the environment.
- remount system directories as read-only under the chroot directory tree
- copy setting files (/etc/passwd, /etc/resolv.conf, etc.)

The tool by default does not expose the directories that likely contain user-data (e.g. /usr/local, /home, /root, /var).
Such directories should be exported explicitely to the jail by using the `--bind` option.

For example, if you have Apache HTTP server installed under `/usr/local/apache`, and want to run it under a jailed environment, simply run:

```
% sudo jailing --root=/var/httpd-jail --bind /usr/local/apache \
    -- \
    /usr/local/apache/bin/httpd -c /usr/local/apache/conf/httpd.conf
```

INSTALLATION
------------

Fetch the latest release tarball from http://search.cpan.org/dist/App-jailing/, and run:
```
% perl Makefile.PL
% make
% sudo make install
```

LICENSE
-------

MIT

