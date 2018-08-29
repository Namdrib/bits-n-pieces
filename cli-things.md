# List of neat bash things that can be done
## Misc
### Cheat sheets
https://www.rain.org/~mkummel/unix.html
https://ubuntudanmark.dk/filer/fwunixref.pdf
https://www.garron.me/en/bits/

### Check syntax and good style here
https://www.shellcheck.net/

## Things
### Custom bash prompt
- A default prompt might look like: `User@Device path/to/current/directory $` with or without various colours
- This can be changed in `~/.bashrc` to customise the prompt
- [Getting Git branch in the prompt](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
- [Other people's prompts](https://www.reddit.com/r/linux/comments/2uf5uu/this_is_my_bash_prompt_which_is_your_favorite/)
- [Other people's prompts](https://www.reddit.com/r/archlinux/comments/5vusvx/here_is_my_bash_prompt_whats_your_favorite/)
- use `export PS1=...` in the terminal to test a prompt before editing

Moved example PS1s to https://github.com/Namdrib/dotfiles/blob/a7a162485bf55b7f4ac763ea7e53fc86030cd3b7/system/.prompt

### File/path manipulation/other
- Change to previous directory

`cd -`

- Count the number of files in the directory with ls [something]
```bash
# That's a lower-case L after wc, and a ONE after ls
# the -1 means "put each entry on its own line"
ls [something] -1 | wc -l 
```

- Word count for each file in the directory

`ls [something] | xargs wc -l`

- Pull relevant lines of man pages

`man git | grep pull`

- Sort a text file and remove duplicate entries
```bash
sort [someFile] | uniq -u > file.txt
#  ^ sort file    ^ Remove dupes  ^ output the result to the file
```

- Download a file (or files) from a site remotely
```
wget http://site.url/file.name
wget -r -A .pdf http://site.url/file.name # ALL of a file type from a site
wget -c http://site.url/file.name # Resume an interrupted download (must be in same dir)
wget --limit-rate 100k http://site.url/file.name # Limit the rate to 100kBps or use m for mB
```

- Create multiple directories at a time using `mkdir`
```bash
mkdir -p some/dir/path/{one,two,three}
# will create the following:
some/dir/path/one
some/dir/path/two
some/dir/path/three
# the -p flag means "create the parent directories if they don't already exist"
```

- Clear out an entire dircetory tree (files AND folders)

`find /folder/of/interest/ -type f -delete`

- List all files that have "phrase"
```bash
cat * | grep phrase
# Same as above, but show file
find * | xargs grep "phrase"
# Same as above, but show line number as well
grep -n 'phrase' *
```

- Find files that DO NOT have "phrase"

`find . -not  -ipath '.*svn*' -exec grep -H -E -o -c "phrase" {} \; | grep 0`

- Find all files with no extension
```bash
find . -maxdepth 1 -type f ! -name "*.*"
# remove maxdepth for recursive
```

- Check whether file exists 
```bash
# For dircetory, replace -f with -d
# To check NON-existence: ! at the start
if [ -f path/to.file ] ; then
	# Do something
fi
```

- Compression
```bash
# Compress folderToCompress into a single file: compressFileName.tar.gz
tar -zcvf compressFileName.tar.gz folderToCompress
# Uncompress
tar -xvzf compressFileName.tar.gz
```

- Use brace expansion to quickly move/copy files

`mv my/file{,_new}`
- the same as: `mv my/file my/file_new`

- Testing line for ANZAC stuff
- The middle line gets all items in a folder that match the question number
- and get all the \*.in tests redirected to the executable, and then
- diffs it with the \*.ans answers
```bash
make c && for item in sampledata/C/*.in ;do 
	time ./a < $item | diff - sampledata/C/`basename ${item%%.in}`.ans
done
```

- Find all folders (recursively) that are empty
- Replace `-print` with `-delete` once sure that they can go

`find . -type d -empty -print`

- Count number of pages in all pdf files in current directory

`( for pdf in *.pdf ; do pdfinfo "$pdf" ; done ) | grep Pages | sed 's/[^0-9]*//' | paste -sd+ | bc`

### String manipulation
- Print something that's been aligned (spaces)

`printf "%ns" "message" # where n is the amount to do`

- Print a character n times
```
printf "%0.sC" {1..number} # where C is the character, and number is a constant
printf "%0.cS" $(seq 1 $n) # where n is a variable (although try to avoid seq in bash)
```

### VersionControl
- Mass-rename an svn directory
```bash
# For each file, rename, string manip
for i in 'find *.cpp'; do 
	svn mv $i 'echo $i | sed s/originalString/targetString/g'; 
done

# For example: rename all .cpp files to .hpp
for i in 'find *.cpp'; do svn mv $i 'echo $i | sed s/cpp/hpp/g'; done
```

- Find out current SVN revision

`svn info path.to.online-svn.repo | grep "Last Changed Rev" | awk '{print $4; }'`

- Add all the un-added files to svn. Word of warning: this does ALL of them. Add a file to ignore list first as necessary.
``` bash
# the two lines have equivalent effect
svn status | grep '?' | sed 's/^.* /svn add /' | bash
svn add `svn status . | grep "^?" | awk '{print $2}'`
```

- Pull every git repo in my git folder:
```bash
for item in * ;do
	if [[ -d $item ]] ;then
		cd $item && git pull;
		cd ../;
	fi
done
```


### Random
- Dice roll (1-6)

`echo $[$[$RANDOM % 6] + 1]`

- Flip a coin

`[ $[ $RANDOM % 2 ] == 0 ] && echo "HEADS" || echo "TAILS"`

- Output dimensions of terminal window
```bash
tput cols # Width
tput lines # Height
```

- Automatically update installed Cygwin packages

`./setup-x86_64.exe --no-desktop --no-shortcuts --no-startmenu --quiet-mode`
