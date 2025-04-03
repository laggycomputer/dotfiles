# fuzzy find (telescope)
`cargo install [ripgrep](https://github.com/BurntSushi/ripgrep)`

# LSPs
`cargo install [pylyzer](https://github.com/mtshiba/pylyzer)`

## clangd
it's on `apt` if you use that
do `gcc -E -v -xc++ /dev/null` and look at the paths after `#include "..." search starts here`

then make `~/.clangd`:

```
CompileFlags:
  Add:
  - -I<one of the include paths, repeat on more lines>
```
