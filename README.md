# [PREAMBLE]

	Thanks for taking interest in builder! This project was designed to not
	only make it easier to compile software, but to also enable a quick way
	to distribute the means of doing so. Imagine having a very small tarball
	that contains all the information to automatically obtain the source
	code, apply patches, install the necessary software to compile, compile
	the software (multi-pass is also possible), and finally, if desired,
	bundle all of that into nice distribution packages for you - all just
	by typing a short command! Well that's exactly what builder can do!

		TODO
		- add the construction of a post-build .info file




# [FOR THE IMPATIENT]

	To Install:
		1. cd /path/to/builder
		2. sudo install.sh

	To Use:
		1. builder --help




# [FOR SOFTWARE DEVELOPERS]

	Builder works with a variety of popular methods of compilation including
	autoconf, autogen, bootstrap, cmake, scons, and a default (configure,
	make, make install). There is even an option to create a custom method
	if you require it. This allows you the freedom to choose which one will
	work best for you and your project.

	While builder does not make any stage of development easier for you, its
	main design goal is to make is VERY easy for an end user to compile your
	software, or aid in the rapid distribution of your project to qualified
	package maintainers of the various Linux distros. By constructing a
	(generic) builder profile for your work, you are helping to streamline
	the steps necessary for them to tailor your software to their specific
	environment. We would encourage any developer to include this as a
	tarball packaged with their source code, or at least an option to
	download from their website.




# [FOR PACKAGE MAINTAINERS]

	It is important to note that this software will not magically determine
	all of the steps above and do it for you. Someone has to actually
	perform these steps initially (which ideally would be the software
	developer themself). This project is meant to provide an easy way to use
	the contributions of others who have taken those steps, and allow other
	package maintainers of different distros to quickly tweak the software
	building process to fit their own system. By getting a builder profile
	for a package, it is trivial to modify the compile parameters, add or
	remove patches, add or remove graphics, GUI desktop files, and other
	items to specifically tailor a software build.

	To assist in the packaging process, there are multiple scripts that
	can optionally be executed to perform any desired tasks along the way.
	See the wiki, the included 'NOTES' file, or '--help' output for more
	information.




# [ORDER OF OPERATIONS]

	Below is the list of operations that are executed during a builder run.
	As you can see there are several hooks that allow for external scripts
	to be run that can do any additional steps that are desired.

	1. Process passed switches
	2. Adjust variable values for global and target package personalization
	3. System checks to make sure everything exists and is writable
	4. Install compile-time dependencies
	5. Optionally obtain the source code
	6. Apply any included patches to source code
	7. [hook] Optionally execute pre.compile script
	8. Compile process (configure)
	9. [hook] Optionally execute post.configure script
	10. Compile process (make, make check, ..., make install)
	11. Copy in any 'extra' files
	12. [hook] Optionally execute post.compile script
	13. Optionally separate contents into individual package types
	14. Apply file and directory ownership and permissions
	15. [hook] Optionally execute pre.package script
	16. Create the various packages
	17. Copy the files into the local repo
	18. [hook] Optionally execute post.package script
	19. Cleanup
	20. Initiate the next pass if designated




# [RECENT UPDATES]

	2025/10/15
	- Updated the --help output to match current switches and added sections:
	  Build Software Steps
	  Profile Creation Steps
	  Profile Contents Key
	- Added the -E action
	- Started the -T action
	- Rearranged several switches:
	  -D to -C
	  -d to -D
	  -L to -d
	  -S to -c

	2025/10/16
	- Combined -c, -C, -d to be -c "dev|dir|repo"
	- Reverted -D to -d
	- Moved -S switch to -C action
	- Changed -U to -u
	- Added the -C action (and modifying packaging code to implement)
	- Added the -R action
	- Completed the -T action
	- Added r64 CPU arch type
	- Started work to allow creation of just one package instead of multiple

	2025/10/17
	- Removed -n and made it the last parameter
	- Added the -I action
	- Moved -p to -N
	- Moved -s to -F
	- Reversed the action and switch parameter case to match pax
	- Implemented SPM_MAK variable for generic package manager creation
	- Expanded the sample builder.conf.TC file
	- Migrated existing package code to 'pax' (since it was distro specific)
	- Completed work to allow single package creation




# [FUTURE DEV TIMELINE]

	Since we are working with several many projects (13 on github alone),
	we are going to provide an anticipated timeline of releases using
	internal staff. Obviously outside contribution will advance these
	forecasted dates.

	2025 Oct - completion of ModuleMaker for webWorks
	2025 Dec - migration of existing webWorks modules using ModuleMaker
	2026 Jan - migration of Tracker into webWorks and deprecation of
	           of standalone project
	2026 Feb - update paged to 2018 code base from ACME
	         - update pax to work with (TC) TinyCore Linux
	         - apply any patches for bug fixes to existing projects
	2026 Mar - update web.libs for dittodata and web.de
	2026 Jul - move code from web.de into cli.de and update the former
	           to use the latter via XML communication
	2026     - rest of 2026 tbd

