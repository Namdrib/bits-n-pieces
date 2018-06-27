# bits-n-pieces
- Random bits n pieces that may or may not be useful
- Probably all going to be terminal-related things (neat commands, bashrc modifications, apt packages, etc.)

Location placements (or of the original files)
- .bashrc: ~/.bashrc
- .vimrc: ~/.vimrc (may not exist)

## Random notes
- List of terminal `ls` visuals and their explanation: https://unix.stackexchange.com/questions/94498/what-causes-this-green-background-in-ls-output#94505

## Git to remember creds for a bit
`git config --global credential.helper cache`
- alternatively, use `"cache --timeout=x"` instead of `cache` to set the timeout in seconds (yes, with quotes)

## For Cygwin: add a context menu ("Bash Propmt Here")
- install the `mintty` and `chere` packages
- Run as admin, then: `chere -i -t mintty -s bash`
