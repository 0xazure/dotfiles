# 0xazure does `.dotfiles`

There are many collections of `.dotfiles` around; these are mine.

See something that coule be improved?  Open [an issue](/issues/new) or
better yet, [submit a pull request](/compare)!

Disclaimer:

> **By using this project, you understand and agree that I cannot be
held responsible for any mishaps or broken environments**.

## Installation

My primary work machine is a Macbook Pro running OS X, so everything
is configured for that envrionment.  Some things may still work on
other platforms, but any instructions are written with the assumption
that these `.dotfiles` are being installed on an OS X machine.

Prerequisites:

- [XCode](https://developer.apple.com/xcode/) and the command line tools
  - Run `xcode-select --install` and accept the license agreement

> Ensure you have **backed up** any important configurations and files
before attempting an installation.

Clone the `.dotfiles`:

```sh
$ git clone --recursive https://github.com/0xazure/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
```

Running [`./script/bootstrap`](./script/bootstrap) will check for and
install missing dependencies for running the automated setup tasks.  Be
sure to **read the script in its entirety** before running it.

Execute the following:

```sh
$ ./script/bootstrap
```

Once the dependencies have been installed, set up the `.dotfiles` with:

```sh
$ ./script/install
```

This will symlink the appropriate files from the `.dotfiles` into
your `$HOME` directory, as well as perform some setup for the various
tools and applications included.

## Thanks

See [THANKS.md](./THANKS.md) for references and acknowledgements.
