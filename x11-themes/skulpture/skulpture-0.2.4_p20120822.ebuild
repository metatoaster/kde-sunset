# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

COMMIT=4e36baf0032c9f2e1c78cf11175e726d9582778a
inherit kde4-base

DESCRIPTION="Classical style and window decorations for KDE Plasma"
HOMEPAGE="https://github.com/cfeck/skulpture"
SRC_URI="https://github.com/cfeck/${PN}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="kde-plasma/kwin:4"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${COMMIT}"
