# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

COMMIT=6149f60ce87457d8c54b7fa399645c07c96e8094
inherit qmake-utils

DESCRIPTION="Qt widget to display images with animated transition effect"
HOMEPAGE="https://github.com/ariya/pictureflow
https://ariya.io/2007/10/pictureflow-a-clone-of-coverflow-as-a-qt-widget"
SRC_URI="https://github.com/ariya/${PN}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~sparc x86"
IUSE=""

DEPEND="dev-qt/qtgui:4"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-remove-slide.patch" )

src_configure() {
	eqmake4 ${PN}-qt/pictureflow.pro
}

src_install() {
	dobin ${PN}
	dodoc ChangeLog
}
