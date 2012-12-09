FAQ
===

Below are some answers to frequently asked questions.

Is puppet-aptitude Tested?
--------------------------

Yep! There are puppet module smoke tests defined in the ``tests`` subdir. You
can find them `here
<https://github.com/rdegges/puppet-aptitude/tree/master/tests>`_. If you'd like
to run the test suite, install puppet-aptitude, then run the following::

    cd /etc/puppet/modules/aptitude/tests
    for i in `find . -type f -name '*.pp'`; do puppet apply --noop $i; done

That will fake the various test cases.

I Found a Bug!
--------------

Cool! Please submit an issue on the official `GitHub issue tracker
<https://github.com/rdegges/puppet-aptitude/issues>`_.

What is puppet?
---------------

An awesome tool for managing loads of servers in a reusable fashion. Check out
`their website <http://www.puppetlabs.com/>`_.
