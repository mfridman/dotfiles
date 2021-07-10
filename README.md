# dotfiles

> hardware changes, hardware breaks, hardware gets stolen. 
> 
> dotfiles live on!


Much of what you see here is inspired and built upon the work of others. Many awesome folks in the open-source community have shared their dotfiles and have written about their setup.

See the [inspiration and resources](#inspiration-and-useful-resources) section.

Adapt and make them your own, open-source for the win :)


## setting up your Macintosh

1. Update macOS to the latest version with the App Store

2. Install Xcode Command Line Tools

        xcode-select --install

3. Generate SSH keys by running:

        curl https://raw.githubusercontent.com/mfridman/dotfiles/HEAD/setup_ssh.sh | sh -s "<your-email-address>"

Do not forget to add new SSH key to GitHub.

3. Install Oh My Zsh:

More information here [ohmyzsh/ohmyzsh#getting-started](https://github.com/ohmyzsh/ohmyzsh#getting-started)

        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

4. Install homebrew

        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

5. Clone this repo into:

        git clone git@github.com:mfridman/dotfiles.git ~/.dotfiles

6. Run the installation with:

        ~/.dotfiles/install.sh


## inspiration and useful resources

https://github.com/driesvints/dotfiles
https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789
https://github.com/mathiasbynens/dotfiles
https://github.com/jessfraz/dotfiles

https://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/
https://github.com/holman/dotfiles

https://dougblack.io/words/a-good-vimrc.html#colors
https://github.com/dougblack/dotfiles

http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles
https://github.com/michaeljsmalley/dotfiles
https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/
https://github.com/pawelgrzybek/dotfiles/blob/master/setup-macos.sh
http://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/


### improvements

consider using https://github.com/lra/mackup for app configs


### gotchas

https://github.com/ohmyzsh/ohmyzsh/issues/4865#issuecomment-401121707

```
# works
$ZSH_CUSTOM/aliases.zsh
# doesn't work
$ZSH_CUSTOM/aliases/git.zsh
```


### zsh plugins

Lots of them found [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)

Problem is you have to memorize all the shortcuts.