# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

VIRTUALX_REQUIRED="test"
inherit kde4-base

DESCRIPTION="Multiple information organizer - a DropDrawers clone"
HOMEPAGE="https://userbase.kde.org/BasKet https://github.com/basket-notepads/basket"
SRC_URI="http://${PN}.kde.org/downloads/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="amd64 x86"
IUSE="debug crypt"

DEPEND="
	$(add_kdeapps_dep kdepimlibs)
	media-libs/qimageblitz
	x11-libs/libX11
	crypt? ( >=app-crypt/gpgme-1.0 )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package crypt Gpgme)
	)
	kde4-base_src_configure
}
