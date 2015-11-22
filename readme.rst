Euler
=====

:math:`e` can be calculated relatively easy.

It is defined like this:

:math:`e &= \sum_{k=0}^{\infty} \frac{1}{k!}`

Which is the same as this:

:math:`e &= \frac{1}{0!} + \frac{1}{1!} + \frac{1}{2!} + \frac{1}{3!} + \frac{1}{4!} \cdot \cdot \cdot`

And even further:

:math:`e &= 1 + \frac{1}{1} + \frac{1}{1 \cdot 2} + \frac{1}{1 \cdot 2 \cdot 3} + \frac{1}{1 \cdot 2 \cdot 3 \cdot 4} \cdot \cdot \cdot`


That formula can be implemented in a pretty straight forward algorithm.

.. note:: The goal here is not to create code that produces correct results!

    If you want to know some exact value, you can look it up [#A001113]_:

    :math:`e &= 2.718281828459045235360287471352662497757247093699959574966967`

    .. [#A001113] https://oeis.org/A001113/constant

The goal is to cross-compare the languages in terms of efficiency and speed.

This algorithm does enough work to produce comparable results and is
simple enough to avoid bugs from sneaking in.

More languages may be following soon..

In any version, per default :math:`k &= 100` is chosen, the first parameter
on the command line replaces :math:`k` with given number.

Makefile
--------

A simple ``make`` or ``make all`` will build all files.

To run (and build it before if necessary) the project in one specific language
try ``make c``, ``make java`` or ``make py``.

Or ``make run`` to run (and build before if necessary) all languages.

Use ``make clean`` to delete all compiled files.
