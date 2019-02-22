# git-alias

_git-alias_ provides the following Git subcommands:

- `git alias` - Define and/or print Git aliases.
- `git unalias` - Remove Git aliases.

**Note:** git-alias heavily depends on Unix-like softwares.
On Windows, you need a compatibility layer of Unix-like,
such as _Cygwin_, _MinGW_, _MSYS2_ (highly recommended),
and _Windows Subsystem for Linux (WSL)_.

## Installation

```
$ git clone https://github.com/khiosorg/git-alias.git && cd git-alias
$ ./install.sh $YOUR_BINARY_DIR
```

You can omit to specify a binary directory.
By default, executables of git-alias are installed  in `/usr/local/bin`.

## Usage

You can use each subcommand in the same way as
each of the Unix-like builtin `alias` and `unalias` commands.
Moreover, you have access to some advanced features.

### git-alias

```
git alias [-p]
git alias [-p] (<name> | <name>=<command>)...
```

`git alias` can define and/or print Git aliases.

Like `<name>=<command>`, when a set of an alias name and its representing command
is taken with their joined by `=`,
the alias is defined, or is overwritten if it already exists;
while, only an alias name taken,
the alias is printed in the _reusable_ format: `git alias <name>=<command>`.
You can mix these two ways in one command line.

Otherwise, without arguments, git-alias prints all the user-defined aliases
in the reusable format in ascending order.
This behavior is equivalent to the case that the `-p` option is taken.
If any options and arguments are taken with the `-p` option,
first of all, all the aliases are printed, and after that, they are dealt with.

#### Options

- `-p` - Print all the user-defined aliases in the reusable format in ascending order.
- `--help` - Print the full usage.
  But you **cannot use** this option unless other options are given before
  because of an error, such as `No manual entry for git-alias`,
  in executing git-alias as a Git subcommand.

### git-unalias

```
git unalias [-d] -a
git unalias [-d] <name>...
```

`git unalias` can remove Git aliases.

When an alias name is taken, the alias is removed,
and at the same time, is printed in the reusable format.
The `-a` option allows git-unalias to remove all the user-defined aliases.

When the `-d` option is taken, git-unalias **doesn't actually remove** aliases,
but prints what would be removed.

#### Options

- `-a` - Remove all the user-defined aliases.
- `-d` - Print what would be removed without actually removing.
- `--help` - Print the full usage.
  But you **cannot use** this option alone for the same reason as git-alias'.

## Sample

`git alias` and `git unalias` works as follows:

```
$ git alias co='checkout' br='branch'

$ git alias br ci='commit' co
git alias br='branch'
git alias co='checkout'

$ git alias
git alias br='branch'
git alias ci='commit'
git alias co='checkout'

$ git alias -p st='status' br
git alias br='branch'
git alias ci='commit'
git alias co='checkout'
git alias br='branch'

$ git unalias br st
Removing...
git alias br='branch'
git alias st='status'

$ git unalias -a
Removing...
git alias co='checkout'
git alias ci='commit'

$ git alias

```
