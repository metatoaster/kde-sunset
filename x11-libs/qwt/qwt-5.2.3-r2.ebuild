# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils

DESCRIPTION="2D plotting library for Qt4"
HOMEPAGE="http://qwt.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="qwt"
SLOT="5"
KEYWORDS="amd64 ~arm ~ppc ~ppc64 ~sparc x86"
IUSE="doc examples svg"

DEPEND="
	dev-qt/designer:4
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	svg? ( dev-qt/qtsvg:4 )"
RDEPEND="${DEPEND}
	doc? ( !<media-libs/coin-3.1.3[doc] )
"

DOCS=( CHANGES README )

PATCHES=( "${FILESDIR}"/${P}-install_qt.patch )

src_prepare() {
	default
	sed -e "/QwtVersion/s:5.2.2.:${PV}:g" -i ${PN}.prf || die

	cat > qwtconfig.pri <<-EOF
		target.path = "${EPREFIX}/usr/$(get_libdir)"
		headers.path = "${EPREFIX}/usr/include/qwt5"
		doc.path = "${EPREFIX}/usr/share/doc/${PF}"
		CONFIG += qt warn_on thread release
		CONFIG += QwtPlot QwtWidgets QwtDesigner
		VERSION = ${PV}
		QWT_VERSION = ${PV/_*}
		QWT_INSTALL_PLUGINS   = "${EPREFIX}/usr/$(get_libdir)/qt4/plugins/designer"
		QWT_INSTALL_FEATURES  = "${EPREFIX}/usr/share/qt4/mkspecs/features"
	EOF
	sed -i -e 's/headers doc/headers/' src/src.pro || die
	use svg && echo >> qwtconfig.pri "CONFIG += QwtSVGItem"

	echo "CONFIG += QwtDll" >> qwtconfig.pri
}

src_configure() {
	eqmake4
}

src_install() {
	emake INSTALL_ROOT="${D}" install
	einstalldocs

	if use doc; then
		docinto html
		dodoc -r doc/html/.
	fi
	if use examples; then
		# don't build examples - fix the qt files to build once installed
		cat > examples/examples.pri <<-EOF
			include( qwtconfig.pri )
			TEMPLATE     = app
			MOC_DIR      = moc
			INCLUDEPATH += "${EPREFIX}/usr/include/qwt5"
			DEPENDPATH  += "${EPREFIX}/usr/include/qwt5"
			LIBS        += -lqwt
		EOF
		sed -i -e 's:../qwtconfig:qwtconfig:' examples/examples.pro || die
		cp *.pri examples/ || die
		docinto examples
		dodoc -r examples/.
	fi
}
