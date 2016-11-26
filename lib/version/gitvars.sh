#!/bin/sh -e

# ---------------------------------------------------------------------- 
# gitvars.sh
# Generate git vars
# ---------------------------------------------------------------------- 

read PROD <prodname
exec >gitvars

# Fix each line from gitvars.pre where git may or may not have already
# substituted the variables.  If someone generated a tarball with 'git archive',
# then the data will have been substituted already.  If we're in a checkout of
# the git repo, then it won't, but we can just ask git to do the substitutions
# right now.
while read line; do
	# Lines *may* be of the form: $Format: ... $
	x=${line#\$Format:}  # remove prefix
	if [ "$x" != "$line" ]; then
		# git didn't substitute it
		x=${x%\$}  # remove trailing $
		if [ "$x" = "%d" ]; then
			tag=$(git describe --match="$PROD-*")
			x="(tag: $tag)"
		else
			x=$(git log -1 --pretty=format:"$x")
		fi
	fi
	echo "$x"
done <gitvars.pre
