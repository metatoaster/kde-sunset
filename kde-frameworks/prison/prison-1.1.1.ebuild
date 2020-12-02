# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit kde4-base

DESCRIPTION="QRCode and data matrix barcode library"
HOMEPAGE="https://cgit.kde.org/prison.git"
SRC_URI="mirror://kde/stable/${PN}/${PV}/src/${P}.tar.xz"

LICENSE="GPL-2"
KEYWORDS="amd64 ~arm x86"
SLOT="4"
IUSE="debug"

DEPEND="
	media-gfx/qrencode
	media-libs/libdmtx
"
RDEPEND="${DEPEND}"
