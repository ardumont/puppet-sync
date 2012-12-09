Installation
============

Installing puppet-aptitude is easy. You have a few options:

.. note::
    puppet-aptitude is only meant for use with ubuntu systems. If you are
    managing non-ubuntu systems via puppet, ensure that puppet-aptitude is not
    installed on those nodes.

1. Install From Git
-------------------

To install via Git, all you need to do is clone a copy of the puppet-aptitude
repository like so::

    git clone git://github.com/rdegges/puppet-aptitude.git aptitude

That will clone puppet-aptitude into a folder named ``aptitude``. Then you can
simply copy that file over to your puppet module directory, usually::

    cp -R aptitude /etc/puppet/modules/

2. Install as a Git Submodule
-----------------------------

If your puppet server is managed via Git itself, you may want to install
puppet-aptitude as a Git submodule, so that you can pull in future updates.

Assuming that your puppet Git repo is setup as follows::

    puppet/.git
    puppet/modules/...

You can simply run the following command from within the puppet directory::

    git submodule add git://github.com/rdegges/puppet-aptitude.git modules/aptitude

Then, if you ever want to pull updates from puppet-aptitude (if there is ever a
new release or whatever), you can simply run::

    cd modules/aptitude
    git fetch origin master:master
    git checkout master
    git pull
    cd ../..
    git add modules/aptitude
    git commit -m "updating puppet-aptitude to latest version"

3. Install From Tarball
-----------------------

Lastly, if you want to avoid using Git at all, you can, of course, simply
download the puppet-aptitude tarball, and unzip it into your puppet server's
module directory (typically ``/etc/puppet/modules``).

You can download the latest version of puppet-aptitude on the `official GitHub
page <https://github.com/rdegges/puppet-aptitude>`_ (just click the big download
button).
