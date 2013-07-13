Filename normalizator
=====================

This program renames local files from weird escaped versions into their proper
form. For instance, if you download [a korean video from
vimeo](http://vimeo.com/70045920) with a tool like
[JDownloader](http://www.jdownloader.org), you will get funny ``_ucXXXX``
sequences, which are really escaped unicode characters. Once you have those
files local, you can call normalize on them to *fix* them.  Example:

```
$ normalize_filenames *.mp4
Would [CAM] 130708 _uc368_ub2c8_ud790 Goodbye To Romance - KBS _ub77c_ub514_uc624 __uc774_ubb34_uc1a1, _uc784_uc218_ubbfc_uc758 _ud76c_ub9dd_uac00_uc694_ _uacf5_uac1c_ubc29_uc1a1_hd.mp4 -> 'CAM 130708 써니힐 Goodbye To Romance - KBS 라디오  이무송, 임수민의 희망가요  공개방송 hd.mp4'
Would [CAM] 130708 _uc368_ub2c8_ud790 _ub9cc_uc778_uc758 _uc5f0_uc778 - KBS _ub77c_ub514_uc624 __uc774_ubb34_uc1a1, _uc784_uc218_ubbfc_uc758 _ud76c_ub9dd_uac00_uc694_ _uacf5_uac1c_ubc29_uc1a1_hd.mp4 -> 'CAM 130708 써니힐 만인의 연인 - KBS 라디오  이무송, 임수민의 희망가요  공개방송 hd.mp4'
```


License
=======

[MIT license](LICENSE.md).


Installation and usage
======================

Use [Nimrod's babel package manager](https://github.com/nimrod-code/babel) to
install the [argument parser module](https://github.com/gradha/argument_parser)
required by this program:

	$ babel install argument_parser

Once you have the module you can compile with ``nimrod c
normalize_filenames.nim`` and put the binary somewhere where you can use it.
Alternatively you can use the provided
[nakefile](https://github.com/fowlmouth/nake) to build and install the program:

	$ babel install nake
	$ nake local_install

Run the program the ``-h`` or ``--help`` switch to get a list of parameters. By
default no renaming is performed, so you can use it to check the expected
output. Once you are sure it does what you want, pass the ``doit`` switch.


Changes
=======

This is version 0.1.1. For a list of changes see the [CHANGES.md
file](CHANGES.md).


Git branches
============

This project uses the [git-flow branching
model](https://github.com/nvie/gitflow). Which means the ``master`` default
branch doesn't *see* much movement, development happens in another branch like
``develop``. Most people will be fine using the ``master`` branch, but if you
want to contribute something please check out first the ``develop`` brach and
do pull requests against that.


Feedback
========

You can send me feedback through [github's issue
tracker](https://github.com/gradha/kpop_blog/issues). I also take
a look from time to time to [Nimrod's forums](http://forum.nimrod-code.org)
where you can talk to other nimrod programmers.
