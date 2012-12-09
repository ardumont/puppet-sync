Usage
=====

Using puppet-aptitude is simple. Once it has been installed, you can add the
following to a node definition to make use of the basic features::

    node "somenode.somedomain.com" {
        ...
        class { "aptitude": }
        ...
    }

If you want to have puppet-aptitude automatically update all your system
packages every day, you can specify the optional ``update`` parameter::

    node "somenode.somedomain.com" {
        ...
        class { "aptitude": update => true }
        ...
    }

.. note::
    If you enable automatic updates, packages WILL be updated daily. This is the
    equivalent of doing a ``aptitude -y safe-upgrade`` once a day.

That's it! Easy, right?
