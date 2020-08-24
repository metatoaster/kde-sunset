# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KDE_HANDBOOK="optional"
inherit kde4-base

DESCRIPTION="KDE Screenshot Utility"
HOMEPAGE="https://www.kde.org/applications/graphics/ksnapshot/"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug kipi"

DEPEND="
	x11-libs/libXfixes
	x11-libs/libX11
	x11-libs/libXext
	kipi? ( $(add_kdeapps_dep libkipi) )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_with kipi)
	)

	kde4-base_src_configure
}
