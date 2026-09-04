jailing
=======

Jailing is a minimalistic, super-easy chroot jail builder/runner script.

It is by no means a container service, or tries to be.
It is a helper tool for running a program under a restricted environment, preventing it from making changes to other parts of the host even if gets cracked.

__When invoked, it automatically setups the chroot environment by doing the following, and then executes the given command within the environment.__
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

Servers that do not drop privileges themselves, as well as interactive shells,
can be run as a named user using `--user`.  The user's identity environment is
initialized and the command starts in their home directory.  `--create-home`
additionally creates that directory inside the jail:

```
% sudo jailing --root=/var/playground --user=alice --create-home -- /bin/sh
```

When `--user` is specified, jailing initializes the user's groups and changes
to the user's UID and primary GID before executing the command.  It sets
`HOME`, `USER`, `LOGNAME`, and `SHELL` from the password database.  If the home
cannot be entered, the command starts in `/` with a warning.  Without `--user`,
the command starts as root and can perform its own privilege drop.  A missing
passwd or primary-group entry for the selected user is added to the jail from
the host database.
`--create-home` runs `mkhomedir_helper` inside the chroot, using `/etc/skel` to
initialize a missing home.  An existing home directory, including one provided
using `--bind`, is never changed.  Home creation also runs when no command is
given.

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
