# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake flag-o-matic toolchain-funcs xdg-utils

DESCRIPTION="PDF rendering library based on the xpdf-3.0 code base"
HOMEPAGE="https://poppler.freedesktop.org/"
SRC_URI="https://poppler.freedesktop.org/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0-qt4/72" # CHECK THIS WHEN BUMPING!!! SUBSLOT IS libpoppler.so SOVERSION
KEYWORDS="amd64 ~arm ~hppa ~mips ~ppc ~ppc64 ~s390 ~sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="cjk curl debug doc +jpeg +jpeg2k +lcms nss png tiff"

# No test data provided
RESTRICT="test"

DEPEND="
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	>=media-libs/fontconfig-2.6.0
	>=media-libs/freetype-2.3.9
	sys-libs/zlib
	curl? ( net-misc/curl )
	jpeg? ( virtual/jpeg:0 )
	jpeg2k? ( media-libs/openjpeg:2= )
	lcms? ( media-libs/lcms:2 )
	nss? ( >=dev-libs/nss-3.19:0 )
	png? ( media-libs/libpng:0= )
	tiff? ( media-libs/tiff:0 )
"
RDEPEND="${DEPEND}
	cjk? ( >=app-text/poppler-data-0.4.7 )
"
BDEPEND="virtual/pkgconfig"

DOCS=( AUTHORS NEWS README README-XPDF )

PATCHES=(
	"${FILESDIR}/${PN}-0.60.1-qt5-dependencies.patch"
	"${FILESDIR}/${PN}-0.28.1-fix-multilib-configuration.patch"
	"${FILESDIR}/${PN}-0.61.0-respect-cflags.patch"
	"${FILESDIR}/${PN}-0.33.0-openjpeg2.patch"
	"${FILESDIR}/${PN}-0.40-FindQt4.patch"
	"${FILESDIR}/${PN}-0.57.0-disable-internal-jpx.patch"
	"${FILESDIR}/${P}-slotting.patch" # compatibility with Gentoo ebuild repo
)

src_prepare() {
	cmake_src_prepare
	cmake_comment_add_subdirectory test # we don't do tests, don't build them.

	# Clang doesn't grok this flag, the configure nicely tests that, but
	# cmake just uses it, so remove it if we use clang
	if [[ ${CC} == clang ]] ; then
		sed -i -e 's/-fno-check-new//' cmake/modules/PopplerMacros.cmake || die
	fi

	if ! grep -Fq 'cmake_policy(SET CMP0002 OLD)' CMakeLists.txt ; then
		sed '/^cmake_minimum_required/acmake_policy(SET CMP0002 OLD)' \
			-i CMakeLists.txt || die
	else
		einfo "policy(SET CMP0002 OLD) - workaround can be removed"
	fi

	# we need to up the C++ version, bug #622526, #643278
	append-cxxflags -std=c++11
}

src_configure() {
	xdg_environment_reset
	local mycmakeargs=(
		-DBUILD_GTK_TESTS=OFF
		-DBUILD_QT4_TESTS=OFF
		-DBUILD_QT5_TESTS=OFF
		-DBUILD_CPP_TESTS=OFF
		-DENABLE_SPLASH=ON
		-DENABLE_ZLIB=ON
		-DENABLE_ZLIB_UNCOMPRESS=OFF
		-DENABLE_XPDF_HEADERS=ON
		-DENABLE_LIBCURL="$(usex curl)"
		-DENABLE_CPP=OFF
		-DENABLE_UTILS=OFF
		-DSPLASH_CMYK=OFF
		-DUSE_FIXEDPOINT=OFF
		-DUSE_FLOAT=OFF
		-DWITH_Cairo=OFF
		-DWITH_JPEG="$(usex jpeg)"
		-DWITH_NSS3="$(usex nss)"
		-DWITH_PNG="$(usex png)"
		-DWITH_Qt4=ON
		-DCMAKE_DISABLE_FIND_PACKAGE_Qt5Core=ON
		-DWITH_TIFF="$(usex tiff)"
	)
	if use jpeg; then
		mycmakeargs+=(-DENABLE_DCTDECODER=libjpeg)
	else
		mycmakeargs+=(-DENABLE_DCTDECODER=none)
	fi
	if use jpeg2k; then
		mycmakeargs+=(-DENABLE_LIBOPENJPEG=openjpeg2)
	else
		mycmakeargs+=(-DENABLE_LIBOPENJPEG=none)
	fi
	if use lcms; then
		mycmakeargs+=(-DENABLE_CMS=lcms2)
	else
		mycmakeargs+=(-DENABLE_CMS=)
	fi

	cmake_src_configure
}
