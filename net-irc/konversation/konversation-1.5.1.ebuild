# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KDE_HANDBOOK="optional"
inherit kde4-base

DESCRIPTION="User friendly IRC Client for KDE4"
HOMEPAGE="https://kde.org/applications/en/internet/org.kde.konversation
https://konversation.kde.org"
SRC_URI="mirror://kde/stable/${PN}/${PV}/src/${P}.tar.xz"

LICENSE="GPL-2 handbook? ( FDL-1.2 )"
SLOT="4"
KEYWORDS="amd64 x86"
IUSE="+crypt debug"

DEPEND="
	$(add_kdeapps_dep kdepimlibs)
	media-libs/phonon:0-qt4
	crypt? ( app-crypt/qca:2-qt4 )
"
RDEPEND="${DEPEND}
	crypt? ( app-crypt/qca:2-qt4[ssl] )
"

src_configure() {
	local mycmakeargs=(
		-DWITH_QCA2=$(usex crypt)
	)

	kde4-base_src_configure
}
