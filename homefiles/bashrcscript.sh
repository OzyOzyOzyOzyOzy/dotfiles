#!/bin/bash
echo "Copying over bashrc from repo. Old bashrc file will be renamed to '.bashrcold'."

cp ~/.bashrc ~/.bashrcold

cp .bashrc ~/.bashrc

echo "Please reload your session by logging out and back in to apply changes."
