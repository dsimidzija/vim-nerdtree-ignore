# Custom NERDTreeIgnore settings per project

## Features

This plugin enables you to set a custom `NERDTreeIgnore` filter for each
project. This is done by creating a `.nerdtreeignore` file containing the regex
expressions commonly used by `NERDTreeIgnore`. When you move to a directory
containing such a file, it will be loaded and used, until you change the root
of NERDTree to a directory that does not contain the `.nerdtreeignore` file,
in which case the default value is restored.

An example of use would be to hide binary files, temporary files or \*.js files
in your coffeescript project.

Note that NERDTree > 4.2.0 has added `NERDTreeAddPathFilter` function which
enables you to do the filtering in your .vimrc, but I think this plugin is
simpler and easier to use, since `.nerdtreeignore` can be added to source
control and shared by everyone.

## Installation

1. Install [NERDTree][] (obviously)

2. Install the plugin:

	**Pathogen**:

		cd ~/.vim/bundle
		git clone https://github.com/dsimidzija/vim-nerdtree-ignore.git

	**Vundle**:

		Bundle 'dsimidzija/vim-nerdtree-ignore'

	**Janus**:

		cd ~/.janus
		git clone https://github.com/dsimidzija/vim-nerdtree-ignore.git

3. ???

4. Profit!

Oh yeah, and

5. create `.nerdtreeignore` wherever you need one. Example:

```
^debug$[[dir]]
^tmp$[[dir]]
\.sw[po]$
\.log$
```

For more info, take a look at `:h NERDTreeIgnore`.

## Commands and Mappings

None yet.

## Configuration

None yet.

## Known Issues

When you go up from your current root directory, NERDTree does not trigger
the `NERDTreeNewRoot` event, so you'll need to position your cursor on your
new root and press `C` to trigger it. This seems to be by design.

## Credits

Path utility functions graciously stolen from [vim-misc][], all credit
for those goes to **Peter Odding**.

## License

MIT License. Copyright (c) Dusko Simidzija.

[vim-misc]: https://github.com/xolox/vim-misc
[NERDTree]: https://github.com/scrooloose/nerdtree
