# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit desktop eutils qmake-utils xdg

DESCRIPTION="Open Source 2D CAD"
HOMEPAGE="https://www.qcad.org/en/"
SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-libs/glib
	dev-qt/designer:4
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	dev-qt/qthelp:4
	dev-qt/qtopengl:4
	dev-qt/qtscript:4
	dev-qt/qtsql:4
	dev-qt/qtsvg:4
	dev-qt/qtwebkit:4
	dev-qt/qtxmlpatterns:4
	media-libs/glu
	media-libs/mesa
"
RDEPEND="${DEPEND}"

src_configure () {
	eqmake4 -r
}

src_install () {
	#dobin ${FILESDIR}/qcad
	#test -e ${S}/release/${PN} || ln ${S}/release/qcad-bin ${S}/release/${PN}
	#dobin ${S}/release/${PN}
	domenu "${S}"/*.desktop
	doicon "${S}"/scripts/${PN}_icon.svg
	doicon --size 256 "${S}"/scripts/${PN}_icon.png

	insinto /usr/lib/${PN}/
	doins -r scripts fonts patterns linetypes themes
	insopts -m0755
	doins release/*
	make_wrapper ${PN} /usr/lib/${PN}/qcad-bin "" /usr/lib/${PN}:/usr/lib/${PN}/plugins
	doins -r plugins

	docinto examples
	dodoc -r examples/*
	docompress -x /usr/share/doc/${PF}/examples
}
