# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

KDE_HANDBOOK="optional"
inherit kde4-base

DESCRIPTION="VNC-compatible server to share KDE desktops"
HOMEPAGE="https://apps.kde.org/en/krfb"

KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug telepathy ktp"
REQUIRED_USE="ktp? ( telepathy )"

DEPEND="
	>=net-libs/libvncserver-0.9.9
	sys-libs/zlib
	virtual/jpeg:0
	x11-libs/libX11
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXtst
	telepathy? ( net-libs/telepathy-qt:0-qt4 )
"
RDEPEND="${DEPEND}"

src_prepare() {
	# bug 518824, patch before eclass magic
	eapply "${FILESDIR}/${PN}-4.14.0-CVE-2014-4607-unbundle-libvncserver.patch"

	kde4-base_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DWITH_TelepathyQt4=$(usex telepathy)
		-DWITH_KTp=$(use ktp)
	)

	kde4-base_src_configure
}
