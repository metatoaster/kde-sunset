# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

KDE_MINIMAL="4.13.1"
KDE_HANDBOOK="optional"
inherit kde4-base

DESCRIPTION="A collection manager for the KDE environment"
HOMEPAGE="https://tellico-project.org/"
SRC_URI="https://tellico-project.org/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="addressbook cddb debug pdf scanner taglib v4l xmp yaz"

RDEPEND="
	dev-libs/libxml2
	dev-libs/libxslt
	dev-libs/qjson
	dev-qt/qtdbus:4
	media-libs/qimageblitz
	addressbook? ( $(add_kdeapps_dep kdepimlibs) )
	cddb? ( $(add_kdeapps_dep libkcddb) )
	pdf? ( app-text/poppler:0-qt4 )
	scanner? ( $(add_kdeapps_dep libksane) )
	taglib? ( >=media-libs/taglib-1.5 )
	v4l? ( >=media-libs/libv4l-0.8.3 )
	xmp? ( >=media-libs/exempi-2 )
	yaz? ( >=dev-libs/yaz-2:0 )
"
DEPEND="${RDEPEND}
	sys-devel/gettext
"

# tests need network access and well-defined server responses
RESTRICT="test"

DOCS=( AUTHORS ChangeLog README )

src_configure() {
	local mycmakeargs=(
		-DWITH_Nepomuk=OFF
		-DWITH_KdepimLibs=$(usex addressbook)
		-DWITH_KdeMultimedia=$(usex cddb)
		-DWITH_PopplerQt4=$(usex pdf)
		-DWITH_KSane=$(usex scanner)
		-DWITH_Taglib=$(usex taglib)
		-DENABLE_WEBCAM=$(usex v4l)
		-DWITH_Exempi=$(usex xmp)
		-DWITH_Yaz=$(usex yaz)
	)

	kde4-base_src_configure
}
