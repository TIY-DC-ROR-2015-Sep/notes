# Computer Setup

Hey y'all. I want to be sure everyone is ready to roll, so here's are a few things I'd like for you to go ahead and install. Please ask if you have any trouble, or just are curious about why something works the way it does; I'll assume everything went smoothly unless I hear otherwise.

## (Optional) iTerm2

Feel free to use the default system terminal, but [iTerm2](https://www.iterm2.com/index.html) has a few extra niceties and better settings out of the box.

## Homebrew

Homebrew is a package manager - that is, a program that helps us manage what other packages are installed.

Installation notes [here](http://brew.sh/)

**You're ready if**

    $ brew --version

returns something >= 0.9. _(Note: any time you see `$ some stuff`, it's shorthand for "type `some stuff` into your terminal")_

## Git

You probably have an existing version of git on your machine, but

    $ brew install git

will install a more recent one. Then follow along with Github's ["set up git" instructions](https://help.github.com/articles/set-up-git/). (I actually prefer the SSH setup over HTTPS, but either is fine.)

**You're ready if**

    $ git --version

returns something >= 2.2 and

    $ git config --global user.name
    $ git config --global user.email

are both set.

## Rbenv & Ruby

You will eventually need to be able to juggle multiple versions of Ruby on your machine, and it's much easier to set that up when you're getting started. Rbenv is one of several tools that help solve that problem.

_(Note: if you've been playing around with ruby on your own and have already installed a different tool for this - like rvm or chruby - you can ignore this and use the one you have. Just make sure you have ruby 2.2.2 installed)_

Install `rbenv` [using these instructions](https://github.com/sstephenson/rbenv#basic-github-checkout). Do go ahead and follow the optional step installing `ruby-install`.

Once that's done, you should be able to run

    $ rbenv install -l

to list all the available versions of ruby, and

    $ rbenv install 2.2.2

to install the most recent (2.2.2, as of this writing)

Once it's installed (which will take a bit), run

    $ rbenv global 2.2.2

to set that version as the system-wide default.

**You're ready if**

    $ ruby --version

returns 2.2.2

## An Editor

Make sure you have a good editor installed and that you've familiarized yourself with the basics of it (you should be comfortable opening a file, writing some ruby code in it, and finding and running the program you wrote).

Reasonable choices include [Atom](https://atom.io/), [Sublime](http://www.sublimetext.com/), and [RubyMine](https://www.jetbrains.com/ruby/). Any of them (and several others) are fine. I'll be using Atom in class (and probably some vim at some point), so that'd be a good pick if you don't already have a preference.
