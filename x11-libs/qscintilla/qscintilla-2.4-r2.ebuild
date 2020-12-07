# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_P="QScintilla-gpl-${PV/_pre/-snapshot-}"
inherit qmake-utils

DESCRIPTION="Qt port of Neil Hodgson's Scintilla C++ editor class"
HOMEPAGE="https://riverbankcomputing.com/software/qscintilla/intro"
SRC_URI="https://www.riverbankcomputing.co.uk/static/Downloads/QScintilla2/${MY_P}.tar.gz
mirror://kde-sunset/${MY_P}.tar.gz"
S="${WORKDIR}"/${MY_P}

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="0-qt4"
KEYWORDS="amd64 ~hppa ~ppc ~ppc64 ~sparc x86"
IUSE="doc"

DEPEND="dev-qt/qtgui:4"
RDEPEND="${DEPEND}
	!<x11-libs/qscintilla-2.4-r2:0
"

DOCS=( ChangeLog NEWS )

PATCHES=( "${FILESDIR}/${PN}-2.4-designer.patch" )

src_configure() {
	cd "${S}"/Qt4 || die
	eqmake4 qscintilla.pro

	cd "${S}"/designer-Qt4 || die
	eqmake4 designer.pro
}

src_compile() {
	cd "${S}"/Qt4 || die
	emake all staticlib

	cd "${S}"/designer-Qt4 || die
	emake
}

src_install() {
	einstalldocs

	cd "${S}"/Qt4 || die
	# header files
	insinto /usr/include/Qsci
	doins Qsci/*.h
	# libraries
	dolib.so libqscintilla2.so*
	dolib.a libqscintilla2.a
	# translations
	insinto /usr/share/${PN}/translations
	doins qscintilla_*.qm
	local qm
	for qm in $(ls -1 qscintilla_*.qm); do
		dosym ../../${PN}/translations/${qm} /usr/share/qt4/translations/${qm}
	done

	# designer plugin
	cd "${S}"/designer-Qt4 || die
	emake INSTALL_ROOT="${D}" install

	# documentation
	cd "${S}" || die
	if use doc; then
		docinto html
		dodoc -r doc/html-Qt4/.
		docinto Scintilla
		dodoc -r doc/Scintilla/.
	fi
}

pkg_postinst() {
	ewarn "Please remerge dev-python/PyQt4 if you have problems with eric or other"
	ewarn "qscintilla related packages before submitting bug reports."
}
