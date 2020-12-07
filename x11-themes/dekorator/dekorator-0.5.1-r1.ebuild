# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit kde4-base

DESCRIPTION="Window decoration engine for KDE"
HOMEPAGE="https://store.kde.org/p/1167273"
SRC_URI="https://github.com/KDE/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="
	kde-plasma/kwin:4
	media-libs/qimageblitz
"
RDEPEND="${DEPEND}"

DOCS=( AUTHORS ChangeLog CHANGELOG.original README README.original TODO )
