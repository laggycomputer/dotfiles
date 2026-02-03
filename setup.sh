echo "export DOTFILES_DIR=$(pwd)" >> ~/.bashrc
echo "source \${DOTFILES_DIR}/shell_startup.sh" >> ~/.bashrc
ln -s ${PWD}/.omp.json ~/.omp.json
mkdir -p ~/.config/gdb
ln -s ${PWD}/gdbinit ~/.config/gdb/gdbinit
