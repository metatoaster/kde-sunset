# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

COMMIT=44331654256df83bc1d3cbb271a8ce3d4c464686
inherit cmake

DESCRIPTION="Collection of libraries to integrate Last.fm services"
HOMEPAGE="https://github.com/lastfm/liblastfm"
SRC_URI="https://github.com/lastfm/liblastfm/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="GPL-3"
KEYWORDS="amd64 ~ppc ~ppc64 x86 ~amd64-linux ~x86-linux"
SLOT="0-qt4"
IUSE="fingerprint test"

# 1 of 2 (UrlBuilderTest) is failing, last checked version 1.0.9
RESTRICT="test"

COMMON_DEPEND="
	dev-qt/qtcore:4[ssl]
	dev-qt/qtdbus:4
	fingerprint? (
		dev-qt/qtsql:4
		media-libs/libsamplerate
		sci-libs/fftw:3.0
	)
"
DEPEND="${COMMON_DEPEND}
	test? ( dev-qt/qttest:4 )
"
RDEPEND="${COMMON_DEPEND}
	!<media-libs/lastfmlib-0.4.0
	!<media-libs/liblastfm-1.1.0_pre20150206-r1:0
"

src_configure() {
	local mycmakeargs=(
		-DBUILD_DEMOS=OFF
		-DBUILD_WITH_QT4=ON
		-DBUILD_FINGERPRINT=$(usex fingerprint)
		-DBUILD_TESTS=$(usex test)
	)
	cmake_src_configure
}
