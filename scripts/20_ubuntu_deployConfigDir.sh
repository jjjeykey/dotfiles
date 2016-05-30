#!/bin/bash
# inspiration from http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

backupdir=~/dotfiles-backup # old dotfiles backup directory
backupPath="" # folder with id in backup dir
backupFile="" # folder or file inside backup path

function argError() {
  echo "Use script <deploy_dir> <[home|config]>"
  echo "eg. $0 ~/.dotfiles/dotfiles/dotConfig config"
  exit
}

if [[ $# -ne 2 ]]; then
  argError
else
  # Test command line arguments
  if [[ ! -e $1 ]]; then
    echo "Deploy dir: $deploy_dir, doesnt exist"
    exit
  else
    deploy_dir=$1 # dotfiles directory for dofiles that go to .config
  fi

  if [[ $2 == 'home' ]]; then
    destDir=~
  elif [[ $2 == 'config' ]]; then
    destDir=~/.config 
  else
    argError
  fi
fi

echo "Creating $backupdir for backup of any existing dotfiles in ~"
mkdir -p $backupdir

for fullFilename in $deploy_dir/*; do # you need to be explicit if you want to
  # include files beginning with a dot
  basename=$(basename $fullFilename)
  backupPath=$backupdir/$basename_$(date +%d_%m_%Y)_ID$(date +%s)/  # s is seconds since 1971, and is used to make filename unique
  mkdir -p $backupPath

  if [[ $2 == 'home' ]]; then
    dest=$destDir/.$basename # include a dot
  else
    dest=$destDir/$basename
  fi

  # Test if destination exists already and backup then
  basename_of_FileToBackup=$(basename $dest)
  backupFile=$backupPath/${basename_of_FileToBackup#.} # ${#.} is for stripping the dot in the basename
  if [[ -e $dest ]]; then
    echo "Warn: $dest exists, making backup in $backupPath"
    mv $dest $backupFile || exit; 
  fi

  # If dotfile directory:
  if [[ -d $fullFilename ]]; then
    echo "Create $dest folder"
    mkdir -p $dest
    # if it is a directory only create links of sub folders and files, not folder itself
    for dotSub in $fullFilename/*; do
      basename_of_sub=$(basename $dotSub)
      echo "Link $basename/$basename_of_sub to $dest"
      ln -fs $dotSub $dest
    done

    # non-cloud directories and files (which are not links) need to be moved to our config destination again
    echo "Restore local files from backup directory..."
    for fileToRestore in $backupFile/* $backupFile/[^.]*; do
      basename_of_unremove=$(basename $fileToRestore)
      if [[ ! -L fileToRestore ]]; then # not a symbolic link
        echo "Move $basename/$basename_of_unremove to $dest"
        cp -R $fileToRestore $dest || echo "Error: Failed to restore local directory from backup directory"
      fi
    done
  else
    echo "Link $basename to $dest"
    ln -fs $fullFilename $dest
  fi

done

