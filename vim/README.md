
# Vim

A default Vim installation will feature a file containing Vim’s core global settings called `.vimrc`. This file will be located at either `/etc/vim/vimrc`, `etc/vimrc` or `~/`, depending on your linux distribution.

## References

- https://github.com/avelino/vim-bootstrap#installation
- http://vim-bootstrap.com/
- https://github.com/takaite/tkt-vimrc
- https://gist.github.com/azadkuh/5d223d46a8c269dadfe4


----------


# Vim Cheat Sheet

Starting Vim

	vim [file1] [file2] ...


# Vim Modality
Vim has 3 main modes:

* Normal Mode: For navigation and manipulation of text. This is the mode that vim will usually start in
* Edit Mode: For inserting new text, where you type into your file like other editors.
* Command Mode: For executing extra commands like the help, shell, ...


## Normal Mode
### Motions
Move around the text (file) by:

                        gg
                     <ctrl+b>
                     <ctrl+u>
                        -
                        k
                        ^
    0 / ^ / B / b / h <   > l / e / E / w / W / $
                        v
                        +
                        j
                     <ctrl+d>
                     <ctrl+f>
                        G


#### Arrow Keys

* `h`: left
* `j`: down
* `k`: up
* `l`: right

#### Word

* `w`: next word
* `W`: next WORD
* `b`: previous word
* `B`: previous WORD
* `e`: end of word
* `E`: end of WORD

#### Line

* `0`: begin of line (column 0)
* `^`: begin of line (non-blank)
* `$`: end of line
* `-` = `k^`: start of previous line
* `+` = `j^`: start of next line

#### Window

* `H`: top of window
* `M`: middle of window
* `L`: low (bottom) of window
* `zt`: scroll to top
* `zz`: scroll to middle
* `zb`: scroll to bottom
* `<ctrl+b>` / `<ctrl+f>`: previous / next page
* `<ctrl+u>` / `<ctrl+d>`: previous / next half page

#### File

* `gg` / `G`: go to begin / end of file
* `[num]gg` / `[num]G` / `:num<CR>` : go to line *num*
* `gd`: go to definition of current word
* `gf`: go to the file (under the cursor)


### Searching
Searching in *Normal Mode*:

* `f[char]` / `F[char]`: find forward / backward to next / previous char (exactly on char)
* `t[chat]` / `T[char]`: up to forward / backward to next / previous char (next to the char)
* `,` / `;`: previous / next repeat for `f`/`t`/`F`/`T` action
* `*` / `#`: find current word backward / forward
* `/[pattern]` / `?[pattern]`: search forward / backward by matching pattern
* `n` / `N`: next / previous result
* `[I`: show lines with matching word under cursor


### Jumps and Marks

* `<ctrl+o>`: jump back
* `<ctrl+i>`: jump forward
* `<ctrl+6>`: jump to the buffer you just left
* `<ctrl+]>`: jump to tag under cursor (if `./tags` is available)
* `''`: jump back to last jump
* `'.`: jump to last edited line
* `{` / `}`: previous / next paragraph
* `%`: matching (), {}, []
* `m[char]` / `'[char]`: mark by / jump to `[char]`
* `m[CHAR]` / `'[CHAR]`: mark by / jump to `[CHAR]` across the files.


### Edit

#### Goto Insert Mode
These commands take you in `Insert Mode`:

* `i`: insert at left of cursor
* `I` -> insert at the line beginning (non-blank)
* `a`: insert at right of cursor
* `A`: insert at end of line
* `o`: insert by adding new line below the cursor
* `O`: insert by insert new line above the cursor
* `s`: substitute at cursor and enter insert mode
* `S` = `^DA` = `ddO`: delete current line and enter insert mode
* `C` = `c$`: change line from cursor to EOL


#### Stay in Command Mode
Editing the text without transition to `Insert Mode`:

* `.`: repeat last command
* `~`: swap case
* `x`: delete char current char
* `r`: replace char under the cursor
* `dd`: delete current line
* `J`: merge with the next line
* `D`: delete line from cursor to the EOL
* `yy`: yank/copy current line
* `u`: undo
* `<ctrl+r>`: redo

Paste:

* `p`: paste to the next line
* `P`: paste above current line

Visual Mode:

* `v`: into visual/select mode
* `V`: into visual/select mode by line
* `<ctrl+v>`: into visual/select mode by block

Alignment:

* `=<CR>`, `==`: auto indent
* `><CR>`, `>>`: shift right, increase indent
* `<<CR>`, `<<`: shift left, decrease indent



#### Operators
Operator are generally constructed as:
```
[operator][count][motion]
[operator]i[motion]
```

* Operators:
	* `c`: change command ...
	* `d`: delete ...
	* `y`: yank (copy) ...
	* `g~`: swap case ...
	* `gu`: to lower case ...
	* `gU`: to upper case ...
* Motion:
	* `w` / `W`: word / WORD
	* `[`, `]`: block
	* `(`, `)`: block
	* `<`, `>`: block
	* `"`, `'`: in double quote or quote
	* `t`: XML/HTML tag
	* `s`: sentence

Examples:

* `di)`: delete the text inside current paranthesis
* `ci"`: change the text inside ""
* `gUiw`: make the word under the cursor to upper case


### Utilities


#### Registers

* `"[char][y|d]`: yank/delete into register
* `"[char][p|P]`: paste from register
* `:echo @[char]`: shows register content
* `:reg[isters]`: shows all registers


#### Macro

* `q[char]`: start recording into register `char`
* `q`: stop recording macro
* `@[char]`: play macro in register `char`
* `@@`: repeat last playback


#### Code Folding

* `zi`: toggles folding on or off
* `za`: toggles current fold open or close
* `zc`: close current fold
* `zC`: close current fold recursively
* `zo`: open current fold
* `zO`: open current fold recursively
* `zR`: open all folds
* `zM`: close all folds
* `zv`: expand folds to reveal the cursor
* `zk` / `zj`: move to previous / next fold


#### Windows and Split

* `<ctrl+w> s` = `:sp[lit]`: split current window horizontally
* `<ctrl+w> v` = `:vs[plit]`: split current window vertically
* `<ctrl+w> c` = `:cl[ose]`: close current window
* `<ctrl+w> o` = `:on[ly]`: close all windows except current one
* `<ctrl+w> <ctrl+w>`: switch to next split window
* `<ctrl+w> <ctrl+p>`: switch to previous split window
* `<ctrl+w> hjkl`: switch (move cursor) to left, below, above or right split
* `<ctrl+w> HJKL`: move current window to left, below, above or right
* `<ctrl+w> r`: rotate window clockwise
* `<ctrl+w> =`: make all windows equal in size
* `[num]<ctrl+w> +-`: increase/decrease current window height
* `[num]<ctrl+w> <>`: increase/decrease current window width
* `<ctrl+w> _`: minimize current window
* `<ctrl+w> T`: move current window to new tab


#### Spell Checking

* `]s` / `[s`: jump to next / previous spelling error
* `z=`: suggest corrections for current word
* `zg`: add current word to the dictionary
* `zw`: remove current word from dictionary


## Insert Mode

### Mode Change

* `Esc` = `<ctrl+c>` = `<ctrl+[>`: exit insert mode

### Auto Complete

* `<ctrl+p>`: auto-complete / previous item
* `<ctrl+n>`: auto-complete / next item
* `<ctrl+x><ctrl+l>`: auto complete line mode

### Cool Editing Stuff
* `<ctrl+w>`: delete word before cursor
* `<ctrl+u>`: delete line before cursor
* `<ctrl+r>[char]`: insert content of register `[char]`
* `<ctrl+t>`: increase line indent
* `<ctrl+u>`: decrease line indent


## Command Mode

### Lists

* `:jumps`: shows the jump list
* `:changes`: shows the change list
* `:reg[isters]`: shows the registers
* `:marks`: shows the marks
* `:delm[arks] {marks}`: delete specified mark(s)
	* `delm a b 1 \"`: deletes `a`, `b`, `1` and `"`
	* `delm a-h`: deletes all marks from `a` to `h`
* `:delm[marks]!`: deletes all lowercase marks


### File and Buffers

* `:w[rite]`: write current file
* `:q`: close/quit current file, split or tab
* `:wq` = `ZZ`: write current file and quit
* `:q!` = `ZQ`: quit without writing the changes
* `:qa`: quit all splits
* `:ls`: list all open files/buffers
* `:f[ile]` = `<ctrl+g>`: shows current file path
* `:e[dit]`: open a file for editing
* `:ene[w]`: open a blank new file for editing
* `:b<n>`: jump to buffer `n` returned from `:ls`
* `:b <file>`: jump to buffer `file`, Tab to scroll through available options
* `:bn[ext]`: jump to next buffer
* `:bp[rev]`: jump to previous buffer
* `:bd[elete]`: remove file from buffer list


### Shell
* `:mak[e]`: run make in current directory
* `:cw`: toggle mini window for errors
* `:!`: executes external shell command
* `:r[ead]`: read external program output into current file


### Windows and Splits

* `:sp[lit]` = `<ctrl+w> s`: split current window horizontally
* `:vs[plit]` = `<ctrl+w> v`: split current window vertically
* `:cl[ose]` = `<ctrl+w> c`: close current window
* `:on[ly]` = `<ctrl+w> o`: close all windows except current one


### Tabs

* `<ctrl+w> gf`: open file under the cursor into new tab
* `:tabs`: list current tabs and windows
* `:tabn` = `<ctrl+PageDown>`: next tab
* `:tabn <n>`: goto tab `n`
* `:tabp` = `tabN` = `<ctrl+PageUp>`: previous tab
* `:tabe [file]`: create a new blank tab or opens `file` in that tab


### Help

* `:h cmd`: normal mode command help
* `:h :cmd`: command line help for cmd
* `:h i_cmd`: insert mode command help
* `:h v_cmd`: visual mode command help
* `:h c_cmd`: command line editing cmd help
* `:h 'option'`: help of option
* `:helpg[rep]`: search through help docs!

#### Special Help Sections

* `:h motions`
* `:h word-motions`
* `:h jump-motions`
* `:h mark-motions`
* `:h operators`
* `:h buffres`
* `:h windows`
* `:h tabs`
* `:h registers`
* `:h pattern-searches`


### Options

* `:set <opt>?`: shows current option value
* `:set no<opt>`:  turn off flag `opt`
* `:set opt`: turn on flag `opt`
* `:set opt=val`: override value of `opt`
* `:set opt+=val`: append `val` to `opt`
* `:echo &opt`: shows value of `opt`

#### Essential Options
* `hidden` or `hid`: when off, a buffer is unloaded when it's abandoned.
* `laststatus` or `ls`: shows status line: 0 (never), 1 (only if at least two windows), 3 (always)
* `hisearch` or `his`: highlight search matches
* `number` or `nu`: shows line number
* `showcmd` or `sc`: shows command as you type them (may not be available on your compilation)
* `ruler` or `ru`: shows line and column number of the cursor
* `wrap`: controls line wrapping
* `ignorecase` or `ic`: ignores case for search patterns
* `smartindent` or `si`: flag for smart indenting
* `foldmethod` or `fdm`: fold method
* `spell` / `nospell`: turn spell checking enable or disable.


### Substitute

* `:s/search/replace/`: basic substitution on a line
* `:%s/search/replace/`: run substitution on every line
* `:%s/search/replace/g`: `g` flag means apply to every match
* `:%s/search/replace/c`: `c` flag means ask for confirmation


### Tags / ctags
By executing `$> ctags -r` under project tree:

* `:tag <name>TAB`: goes to tag name
* `<ctrl+]>`: goes to the tag under cursor


# Vimdiff

* `do`: get changes from other window into the current window
* `dp`: put the changes from current window into the other window
* `]c`: jump to the next change
* `[c`: jump to the previous change
* `zo`: open fold
* `zc`: close fold
* `zr`: reducing folding level
* `zm`: one more folding level, please
* `:diffupdate`, `:diffu`: recalculate the diff
* `:diffg RE`: get from REMOTE
* `:diffg BA`: get from BASE
* `:diffg LO`: get from LOCAL

