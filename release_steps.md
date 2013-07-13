What to do for a new public release?
====================================

* Create new milestone with version number.
* Create new dummy issue "Release versionname" and assign to that milestone.
* git flow release start versionname (versionname without v).
* Check if the future const version number of the module matches public number,
  if it doesn't update the module const version number to new release.
* Move closed issues from "future milestone" to the release milestone.
* Update [CHANGES.md](CHANGES.md) with list of changes and version/number.
* Update [README.md](README.md) to indicate latest version.
* ``git commit -av`` into the release branch the version number changes.
* git flow release finish versionname (the tagname is versionname without v).
* Push all to git: ``git push; git push --tags``.
* Close the dummy release issue.
* Increase version const number in main module, at least maintenance, and also
  in [README.md](README.md), should be stable version + 0.1.1.
* Add to [CHANGES.md](CHANGES.md) development version with unknown date.
* ``git commit -av`` into develop with *Bumps version numbers for develop
  branch. Refs #release issue*.
