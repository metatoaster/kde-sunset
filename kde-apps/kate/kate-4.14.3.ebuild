# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KDE_HANDBOOK="optional"
KMNAME="kate"
inherit kde4-meta kde4-functions-extra

DESCRIPTION="Kate is an MDI texteditor"
HOMEPAGE="https://www.kde.org/applications/utilities/kate http://kate-editor.org"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	$(add_kdeframeworks_dep kactivities '' 4.13)
	dev-libs/libxml2
	dev-libs/libxslt
	dev-libs/qjson
"
RDEPEND="${DEPEND}
	$(add_kdeapps_dep katepart)
"

KMEXTRA="
	addons/kate
	addons/plasma
"

src_configure() {
	local mycmakeargs=(
		-DBUILD_pate=OFF
	)

	kde4-meta_src_configure
}

pkg_postinst() {
	kde4-meta_pkg_postinst

	if ! has_version kde-apps/kaddressbook:${SLOT}; then
		elog "File templates plugin requires kde-apps/kaddressbook:${SLOT}."
		elog "Please install it if you plan to use this plugin."
	fi
}
