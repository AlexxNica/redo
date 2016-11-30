% redo-ifcreate(1) Redo %VERSION%
% Avery Pennarun <apenwarr@gmail.com>
% %DATE%

# NAME

redo-ifcreate - rebuild the current target if source files are created

# SYNOPSIS

redo-ifcreate [sources...]


# DESCRIPTION

Normally redo-ifcreate is run from a .do file that has been
executed by `redo`(1).  See `redo`(1) for more details.

redo-ifcreate takes a list of nonexistent files (*sources*)
and adds them as dependencies to the current target (the
one calling redo-ifcreate).  If any of those files are
created in the future, the target will be marked as needing
to be rebuilt.

If one of the given files exists at the time redo-ifcreate
is called, it will return a nonzero exit code.

If you want to declare dependencies on files that already
exist, use `redo-ifchange`(1) instead.


# REDO

Part of the `redo`(1) suite.


.CREDITS


# SEE ALSO

`redo`(1), `redo-ifchange`(1), `redo-always`(1), `redo-stamp`(1)
