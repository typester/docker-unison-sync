# docker-unison-sync

Development process using Docker is awesome, but on OS X, there are some annoyed problems:

1. `vboxfs` is too slow. that is used docker local file mount process by default.
2. inotify event on container does not fired when a file change in osx.
3. Using NFS instead of vboxfs is extreme faster than before but inotify event doesn't fired too.

`docker-unison-sync` gives you to simple solution for this.
There's already some solutions to solve these problems (See "See also" section).

## Install

```sh
brew install https://raw.githubusercontent.com/typester/docker-unison-sync/master/docker-unison-sync.rb
```

## Usage

First, you should start unison sync process:

```sh
docker-unison-sync .
```

This command do:

- setup an unison container named `unison-sync` for sync, if not exists.
- start `unison-sync` cantainer if not started
- launch sync process for `.`

Then, you can mount a local directory on your container like following:

```sh
docker run -v $(docker-unison-path .):/app ...
```

Instead of:

```sh
docker run -v $PWD:/app ...
```

## Cleanup synched files

After running any sync process, synced files are remains on docker vm host. You can check real path of that by `docker-unison-path .`.

To clean these files, run `docker-unison-clean .`


# See also

- https://github.com/brikis98/docker-osx-dev
- https://github.com/leighmcculloch/docker-unison

# Author

Daisuke Murase (typester)

# License

MIT
