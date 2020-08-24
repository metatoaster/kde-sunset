# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit kde4-meta-pkg kde4-functions-extra

DESCRIPTION="KDE - merge this to pull in all split kde-base/* packages"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="accessibility kdepim minimal nls sdk"

RDEPEND="
	$(add_kdeapps_dep kate)
	$(add_kdeapps_dep kdeadmin-meta)
	kde-apps/kdeartwork-meta:*
	$(add_kdeapps_dep kdebase-meta)
	$(add_kdeapps_dep kdeedu-meta)
	$(add_kdeapps_dep kdegames-meta)
	$(add_kdeapps_dep kdegraphics-meta)
	$(add_kdeapps_dep kdemultimedia-meta)
	$(add_kdeapps_dep kdenetwork-meta)
	$(add_kdeapps_dep kdeutils-meta)
	accessibility? ( $(add_kdeapps_dep kdeaccessibility-meta) )
	kdepim? ( $(add_kdeapps_dep kdepim-meta '' 4.4.11.1) )
	nls? ( $(add_kdeapps_dep kde4-l10n '' 4.11) )
	sdk? (
		$(add_kdeapps_dep kdebindings-meta)
		$(add_kdeapps_dep kdesdk-meta)
		$(add_kdeapps_dep kdewebdev-meta)
	)
	!minimal? ( $(add_kdeplasma_dep kdeplasma-addons) )
"
REQUIRED_USE="minimal? ( !kdepim )"
