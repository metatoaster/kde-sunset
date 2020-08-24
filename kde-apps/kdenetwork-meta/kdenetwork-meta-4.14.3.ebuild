# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit kde4-meta-pkg

DESCRIPTION="kdenetwork - merge this to pull in all kdenetwork-derived packages"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="ppp"

RDEPEND="
	$(add_kdeapps_dep kdenetwork-filesharing)
	$(add_kdeapps_dep kget)
	!ppc? ( !ppc64? ( $(add_kdeapps_dep kopete) ) )
	$(add_kdeapps_dep krdc)
	$(add_kdeapps_dep krfb)
	$(add_kdeapps_dep zeroconf-ioslave)
	!arm? ( ppp? ( $(add_kdeapps_dep kppp) ) )
"
