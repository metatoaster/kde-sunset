# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop qmake-utils xdg

DESCRIPTION="Source Editing Environment based on Qt"
HOMEPAGE="http://kscope.sourceforge.net/"
SRC_URI="mirror://sourceforge/kscope/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="amd64 ~ppc ~sparc x86"
IUSE=""

RDEPEND="
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	x11-libs/qscintilla:0-qt4=
"
DEPEND="${RDEPEND}"

DOCS=( ChangeLog )

PATCHES=(
	"${FILESDIR}/${P}"-actions.patch
	"${FILESDIR}/${P}"-underlinking.patch
	"${FILESDIR}/${P}"-fix-glibc-conflict.patch
)

src_prepare() {
	default

	sed -e "s:/usr/local:/usr:" -i config || die
	sed -e "s:\$\${QSCI_ROOT_PATH}/include/Qsci:& /usr/include/qt4/Qsci:g" \
		-e "s:\$\${QSCI_ROOT_PATH}/lib:& -L/usr/lib/qt4:g" \
		-e "s:/lib:/$(get_libdir):g" \
		-i app/app.pro core/core.pro cscope/cscope.pro editor/editor.pro || die

	# fix build failure with parallel make
	echo "CONFIG += ordered" >> kscope.pro
}

src_configure() {
	eqmake4
}

src_install() {
	emake INSTALL_ROOT="${D}" install
	doicon app/images/kscope.png
	make_desktop_entry kscopeapp KScope ${PN} "Qt;Development"
	einstalldocs
}
