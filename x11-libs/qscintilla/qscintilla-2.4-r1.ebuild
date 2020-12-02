# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=2

MY_P="QScintilla-gpl-${PV/_pre/-snapshot-}"
inherit eutils multilib qt4-r2

DESCRIPTION="Qt port of Neil Hodgson's Scintilla C++ editor class"
HOMEPAGE="https://riverbankcomputing.com/software/qscintilla/intro"
SRC_URI="https://www.riverbankcomputing.co.uk/static/Downloads/QScintilla2/${MY_P}.tar.gz
mirror://kde-sunset/${MY_P}.tar.gz"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="amd64 ~hppa ~ppc ~ppc64 ~sparc x86"
IUSE="doc"

RDEPEND="dev-qt/qtgui:4"
DEPEND="${RDEPEND}"

S="${WORKDIR}"/${MY_P}

PATCHES=( "${FILESDIR}/${PN}-2.4-designer.patch" )

src_configure() {
	cd "${S}"/Qt4
	eqmake4 qscintilla.pro

	cd "${S}"/designer-Qt4
	eqmake4 designer.pro
}

src_compile() {
	cd "${S}"/Qt4
	emake all staticlib || die "emake failed"

	cd "${S}"/designer-Qt4
	emake || die "failed to build designer plugin"
}

src_install() {
	cd "${S}"/Qt4
	# header files
	insinto /usr/include/Qsci
	doins Qsci/*.h || die
	# libraries
	dolib.so libqscintilla2.so* || die
	dolib.a libqscintilla2.a || die
	# translations
	insinto /usr/share/${PN}/translations
	doins qscintilla_*.qm || die
	for trans in $(ls -1 qscintilla_*.qm); do
		dosym /usr/share/${PN}/translations/${trans} \
			/usr/share/qt4/translations/${trans} || die
	done

	# designer plugin
	cd "${S}"/designer-Qt4
	emake INSTALL_ROOT="${D}" install || die "designer plugin installation failed"

	# documentation
	cd "${S}"
	dodoc ChangeLog NEWS
	if use doc; then
		dohtml doc/html-Qt4/* || die
		insinto /usr/share/doc/${PF}/Scintilla
		doins doc/Scintilla/* || die
	fi
}

pkg_postinst() {
	ewarn "Please remerge dev-python/PyQt4 if you have problems with eric or other"
	ewarn "qscintilla related packages before submitting bug reports."
}
