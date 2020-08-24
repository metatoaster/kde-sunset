# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit kde4-meta-pkg

DESCRIPTION="KDE bindings - merge this to pull in all kdebindings-derived packages"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="java perl"

RDEPEND="
	$(add_kdebase_dep smokegen)
	$(add_kdebase_dep smokekde)
	$(add_kdebase_dep smokeqt)
	java? ( $(add_kdebase_dep krossjava) )
	perl? (
		$(add_kdebase_dep perlkde)
		$(add_kdebase_dep perlqt)
	)
"
