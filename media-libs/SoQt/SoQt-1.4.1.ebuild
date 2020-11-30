# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic

DESCRIPTION="Glue between Coin3D and Qt"
HOMEPAGE="http://www.coin3d.org/"
SRC_URI="https://github.com/coin3d/soqt/archive/${P}.tar.gz"
S="${WORKDIR}/soqt-${P}"

LICENSE="|| ( GPL-2 PEL )"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE="doc"

RDEPEND="
	dev-qt/qtgui:4[qt3support]
	dev-qt/qtopengl:4[qt3support]
	dev-qt/qt3support:4
	>=media-libs/coin-2.4.4
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/pkgconfig
	doc? ( app-doc/doxygen )
"

PATCHES=( "${FILESDIR}/${P}-gcc44.patch" )

src_configure() {
	export PATH="/usr/bin/:${PATH}"
	export QTDIR="/usr"
	export CONFIG_QTLIBS="$(pkg-config --libs QtGui)"

	append-ldflags $(no-as-needed)

	econf \
		--with-coin \
		--disable-html-help\
		$(use_enable doc html) \
		htmldir=/usr/share/doc/${PF}/html
}

src_compile() {
	emake -j1
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc AUTHORS ChangeLog NEWS README*
}
