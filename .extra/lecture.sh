#!/usr/bin/env zsh

echo -n "Add sudo lecture? [yN] "
read PROCEED
if [[ $PROCEED != "y" && $PROCEED != "Y" ]]; then return; fi

sudo "${DOTFILES_REPO_DIR}/.extra/add-lecture.sh" "${DOTFILES_REPO_DIR}/etc/sudo-lecture"
