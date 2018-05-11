A alias wrapper, it's easy to make linux alias and move between folders.

# Online Installation

    $ wget http://wliu.dynu.com/APPS/wgo/wgo.sh && chmod +x wgo.sh && source wgo.sh && rm wgo.sh

# Installation

    source wgo.sh

# Clean wgo

    rm ~/.wgolist; rm ~/.wgosrc; sed -i '/.*wgosrc.*/d' ~/.profile; sed -i '/.*wgolist.*/d' ~/.profile

# Usage:

* set tag

        $ cd /foo/bar
        $ wgo foobar
        $ cd /foo/bar/2
        $ wgo foobar2

* goto folder

        $ foobar
        $ pwd
        $ /foo/bar
        $ foobar2
        $ pwd
        $ /foo/bar/2

* list tags

        $ wgo
