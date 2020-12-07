# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

KDE_HANDBOOK="optional"
inherit kde4-base

DESCRIPTION="KDE remote desktop connection (RDP and VNC) client"
HOMEPAGE="https://apps.kde.org/en/krdc"

KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug +rdp telepathy vnc"

DEPEND="
	telepathy? ( net-libs/telepathy-qt:0-qt4 )
	vnc? ( >=net-libs/libvncserver-0.9 )
"
RDEPEND="${DEPEND}
	rdp? ( >=net-misc/freerdp-1.1.0_beta1[X] )
"

PATCHES=( "${FILESDIR}/${PN}-4.13.1-freerdp.patch" )

src_configure() {
	local mycmakeargs=(
		-DWITH_TelepathyQt4=$(usex telepathy)
		-DWITH_LibVNCServer=$(usex vnc)
	)
	kde4-base_src_configure
}
