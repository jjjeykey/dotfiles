#!/bin/bash
# inspiration from http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

if ! is_ubuntu; then
  echo "Not Ubuntu, exiting"
fi

deploy_dir=~/.dotfiles/conf/ubuntu/home_config  # dotfiles directory for dofiles that go to .config
backupdir=~/dotfiles-backup                   # old dotfiles backup directory

dest_configDir=~/.config         # eval interprets as if inserted in command line, that is for recognizing ~, what ln doesnt do 

echo "Creating $backupdir for backup of any existing dotfiles in ~"
mkdir -p $backupdir

echo "Changing to backup directory $backupdir"
cd $backupdir

for filename in $deploy_dir/*; do
  basename=$(basename $filename)
  backup_subdir=$backupdir/$basename_$(date +%d_%m_%Y)_ID$(date +%s)  # s is seconds since 1971, and is used to make filename unique
  dest=$dest_configDir/$basename
  if [[ -e $dest ]]; then
    echo "Warn: $dest exists, making backup in $backup_subdir"
    mv $dest $backup_subdir || exit;
    echo "Recreate $dest folder"
    mkdir -p $dest
  fi
  if [[ -d $filename ]]; then
    # if it is a directory only create links of sub folders, not folder itself
    for filename_sub in $dir/$filename/*; do
      basename_of_sub=$(basename $filename_sub)
      echo "Link $basename/$basename_of_sub to $dest"
      ln -fs $filename_sub $dest
    done
  fi
  # non-dotfile directories need to be moved to our config destination again
  echo "Restore non-link files..."
  for file_to_unremove in $backup_subdir/*; do
    basename_of_unremove=$(basename $file_to_unremove)
    if [[ ! -L file_to_unremove ]]; then # not a symbolic link
      echo "Move $basename/$basename_of_unremove to $dest"
      mv $file_to_unremove $dest || echo "Error: Failed to restore non-link dir"
      #cp -R $basename_of_unremove $dest || (echo "Failed: restore state" && mv $dest $dest-old && mv $backup_subdir $dest)
    fi
  done
done


