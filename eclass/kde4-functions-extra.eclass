# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: kde4-functions-extra.eclass
# @BLURB: Common ebuild functions for KDE 4 packages
# @DESCRIPTION:
# This eclass contains some extra functions that are missing from
# kde4-functions eclass.

if [[ -z ${_KDE4_FUNCTIONS_EXTRA_ECLASS} ]]; then
_KDE4_FUNCTIONS_ECLASS_EXTRA=1

# @ECLASS-VARIABLE: EAPI
# @DESCRIPTION:
# Currently kde4 eclasses support EAPI 5 and 6.
case ${EAPI} in
	5|6) : ;;
	*) die "EAPI=${EAPI:-0} is not supported" ;;
esac

# @FUNCTION: add_kdeplasma_dep
# @DESCRIPTION:
# Create proper dependency for kde-plasma/ dependencies.
# This takes 1 to 3 arguments. The first being the package name, the optional
# second is additional USE flags to append, and the optional third is the
# version to use instead of the automatic version (use sparingly).
# The output of this should be added directly to DEPEND/RDEPEND, and may be
# wrapped in a USE conditional (but not an || conditional without an extra set
# of parentheses).
add_kdeplasma_dep() {
	debug-print-function ${FUNCNAME} "$@"

	local ver
	local use=${2}

	if [[ -n ${use} ]] ; then
		use="[${use}]"
	fi
	if [[ -n ${3} ]]; then
		ver=${3}
	elif [[ -n ${KDE_OVERRIDE_MINIMAL} ]]; then
		ver=${KDE_OVERRIDE_MINIMAL}
	elif [[ ${KDEBASE} != kde-base ]]; then
		ver=${KDE_MINIMAL}
	# if building kde-apps, live master or stable-live branch,
	# use the final SC version since there are no further general releases.
	# except when it is kdepim split packages, which rely on same-version deps
	elif [[ ${CATEGORY} == kde-apps || ${PV} == *9999 ]]; then
		ver=4.14.3
	else
		ver=${PV}
	fi

	[[ -z ${1} ]] && die "Missing parameter"

	echo " >=kde-plasma/${1}-${ver}:4${use}"
}

# @FUNCTION: add_kdeframeworks_dep
# @DESCRIPTION:
# Create proper dependency for kde-frameworks/ dependencies.
# This takes 1 to 3 arguments. The first being the package name, the optional
# second is additional USE flags to append, and the optional third is the
# version to use instead of the automatic version (use sparingly).
# The output of this should be added directly to DEPEND/RDEPEND, and may be
# wrapped in a USE conditional (but not an || conditional without an extra set
# of parentheses).
add_kdeframeworks_dep() {
	debug-print-function ${FUNCNAME} "$@"

	local ver
	local use=${2}

	if [[ -n ${use} ]] ; then
		use="[${use}]"
	fi
	if [[ -n ${3} ]]; then
		ver=${3}
	elif [[ -n ${KDE_OVERRIDE_MINIMAL} ]]; then
		ver=${KDE_OVERRIDE_MINIMAL}
	elif [[ ${KDEBASE} != kde-base ]]; then
		ver=${KDE_MINIMAL}
	# if building kde-apps, live master or stable-live branch,
	# use the final SC version since there are no further general releases.
	# except when it is kdepim split packages, which rely on same-version deps
	elif [[ ${CATEGORY} == kde-apps || ${PV} == *9999 ]]; then
		ver=4.14.3
	else
		ver=${PV}
	fi

	[[ -z ${1} ]] && die "Missing parameter"

	echo " >=kde-frameworks/${1}-${ver}:4${use}"
}

fi
