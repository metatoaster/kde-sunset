# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KDE_LINGUAS_DIR="applet/locale"
KDE_LINGUAS="de et pl pt pt_BR sv tr uk"
WEBKIT_REQUIRED="always"
inherit kde4-base

DESCRIPTION="Plasmoid to show date and time in adjustable format using rich text"
HOMEPAGE="https://store.kde.org/p/999193"
SRC_URI="https://github.com/Emdek/plasmoid-adjustable-clock/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="
	kde-plasma/libplasmaclock:4
"
RDEPEND="${DEPEND}
	kde-plasma/plasma-workspace:4
"

src_prepare() {
	kde4-base_src_prepare

	local lang
	for lang in ${KDE_LINGUAS} ; do
		if ! use "l10n_$(kde4_lingua_to_l10n "${lang}")" ; then
			rm ${KDE_LINGUAS_DIR}/${lang}.mo || die
		fi
	done
}

pkg_postinst() {
	elog "Version 4.0 (and newer) is not backwards compatible with 3.x."
	elog "All custom formats need to be exported and manually converted."
}
