# mutt-wizard

This is a simplified version of Luke Smith's mutt-wizard.
Most of the changes are for code-quality and making it as
POSIX-compliant as possible. I did those changes to run it
on my system. Some features have been removed.

## Changes
* Removed the `crontab` feature.
* Removed the annoying ProtonMail prompt and all ProtonMail functionality
* Made sed calls POSIX-compliant.
* Changed the password manager to [pm] (which removes the dependency of bash)
* Linted
* Added `out/err/die` functions to tidy up the mess of unorganized `echo/printf` functions everywhere
* Fix lots of ugly code
* Removed Mac compatibility (sorry)


## TODO
* Make `find` calls POSIX-compliant


[pm]: https://github.com/cemkeylan/cem-utils/tree/master/pm
