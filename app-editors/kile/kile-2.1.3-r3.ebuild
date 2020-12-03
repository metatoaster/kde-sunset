# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

KDE_DOC_DIRS="doc"
KDE_HANDBOOK="optional"
MY_P=${P/_beta/b}
inherit kde4-base

DESCRIPTION="A Latex Editor and TeX shell by KDE"
HOMEPAGE="https://kile.sourceforge.io/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.bz2"

LICENSE="FDL-1.2 GPL-2"
SLOT="4"
KEYWORDS="amd64 x86"
IUSE="debug +pdf +png"

DEPEND="
	x11-misc/shared-mime-info
"
RDEPEND="${DEPEND}
	$(add_kdeapps_dep katepart '' 4.14.3)
	$(add_kdeapps_dep kdebase-data)
	$(add_kdeapps_dep konsolepart)
	|| (
		kde-apps/okular[pdf?,postscript]
		app-text/evince
	)
	virtual/imagemagick-tools[png?]
	virtual/latex-base
	virtual/tex-base
	pdf? (
		>=app-text/texlive-core-2014
		app-text/ghostscript-gpl
	)
	png? ( app-text/dvipng )
"

S=${WORKDIR}/${MY_P}

DOCS=( kile-remote-control.txt )

src_prepare() {
	kde4-base_src_prepare

	# I know upstream wants to help us but it doesn't work..
	sed -e '/INSTALL( FILES AUTHORS/s/^/#DISABLED /' \
		-i CMakeLists.txt || die

	use handbook || rm -fr doc
}
