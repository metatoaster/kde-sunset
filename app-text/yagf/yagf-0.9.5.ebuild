# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PLOCALES="fr ru"
inherit cmake l10n

DESCRIPTION="Graphical front-end for cuneiform and tesseract OCR tools"
HOMEPAGE="https://sourceforge.net/projects/yagf-ocr/"
SRC_URI="mirror://sourceforge/project/yagf-ocr/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cuneiform pdf scanner +tesseract"

REQUIRED_USE="|| ( cuneiform tesseract )"

DEPEND="
	app-text/aspell
	dev-qt/qtcore:4
	dev-qt/qtgui:4
"
RDEPEND="${DEPEND}
	cuneiform? ( app-text/cuneiform )
	tesseract? ( app-text/tesseract )
	scanner? ( media-gfx/xsane )
	pdf? ( || ( app-text/poppler[utils] app-text/ghostscript-gpl ) )
"

DOCS=( AUTHORS ChangeLog DESCRIPTION README )

src_prepare() {
	# uk translation generation is broken
	rm src/translations/yagf_uk.ts || die
	# respect CFLAGS and fix translations path
	sed -e '/add_definitions(-Wall -g)/d' \
		-e '/-DQML_INSTALL_PATH=/s:${QML_DESTINATION}:/${QML_DESTINATION}:' \
		-i CMakeLists.txt || die 'sed on CMakeLists.txt failed'

	l10n_find_plocales_changes "src/translations" "${PN}_" '.ts'
	cmake_src_prepare
}

src_configure() {
	local libdir="$(get_libdir)"
	local mycmakeargs=(
		-DLIB_PATH_SUFFIX=${libdir#lib}
	)
	cmake_src_configure
}

src_install() {
	remove_translation() {
		rm "${ED}/usr/share/yagf/translations/${PN}_${1}.qm" ||
			die "remove '${PN}_${1}.qm' file failed"
	}
	cmake_src_install
	l10n_for_each_disabled_locale_do remove_translation
}
