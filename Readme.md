# How to use this repo

This repo should be clone in the $HOME folder

## To copy the dotfiles in a new machine

```bash
git clone https://github.com/louiskimlevu/dotfiles $HOME
mv .git .git-dotfiles
```

Rename the git directory to prevent the prompt from treating the $HOME folder as a git repository

## List tracked files

```bash
config ls-tree --full-tree --name-only -r HEAD
```

## check the status

```bash
config status
```

## stage only tracked files

```bash
config add -u
```

## commit

```bash
config cz c
```

## push

```bash
config push
```

## lazy git

```bash
config-lg
```
