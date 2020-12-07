# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

KDE_HANDBOOK="optional"
inherit kde4-base

DESCRIPTION="Paint Program for KDE"
HOMEPAGE="https://apps.kde.org/en/kolourpaint"

LICENSE="BSD LGPL-2"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="media-libs/qimageblitz"
RDEPEND="${DEPEND}"

pkg_postinst() {
	kde4-base_pkg_postinst

	if ! has_version kde-apps/ksaneplugin:${SLOT} ; then
		elog "To enable scanner support, please install kde-apps/ksaneplugin:${SLOT}"
	fi
}
