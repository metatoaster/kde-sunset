# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DECLARATIVE_REQUIRED="always"
inherit kde4-base kde4-functions-extra

DESCRIPTION="KDE Activity Manager"

KEYWORDS="amd64 ~arm x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="
	|| (
		$(add_kdeplasma_dep kactivitymanagerd)
		kde-plasma/kactivitymanagerd:5
	)
"

src_configure() {
	local mycmakeargs=(
		-DKACTIVITIES_LIBRARY_ONLY=ON
		-DWITH_NepomukCore=OFF
	)
	kde4-base_src_configure
}
