# Installing/re-installing ubuntu bash for WSL
Probably change wording at some point ^

## Potentially helpful sites/sources
- https://unix.stackexchange.com/questions/9940/convince-apt-get-not-to-use-ipv6-method#100887
- https://github.com/ilikenwf/apt-fast
- http://xmodulo.com/speed-slow-apt-get-install-debian-ubuntu.html
- https://askubuntu.com/questions/9135/how-to-backup-settings-and-list-of-installed-packages
- https://github.com/nvbn/thefuck

## Text-only summary (if you don't want to open the links)
### Installing apt-fast
```
sudo apt-get install aria2
sudo add-apt-repository ppa:apt-fast/stable
sudo apt-get update
sudo apt-get -y install apt-fast
```

### Not using IPv6 for apt-get
`sudo apt-get [blah] -o Acquire::ForceIPv4=true`

### Auto-correct commands
- `sudo pip3 install thefuck`
- Put `eval $(thefuck --alias)` in `~/.bashrc`
- `source ~/.bashrc` or restart the shell
- then just `fuck` every time something goes wrong :)
