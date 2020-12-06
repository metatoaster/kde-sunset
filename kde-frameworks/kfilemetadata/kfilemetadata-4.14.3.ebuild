# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CMAKE_REMOVE_MODULES_LIST=( FindPopplerQt4 )
inherit kde4-base

DESCRIPTION="Library for extracting file metadata"

SLOT="4"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug epub exif ffmpeg mobi pdf taglib"

DEPEND="
	epub? ( app-text/ebook-tools )
	exif? ( media-gfx/exiv2:= )
	ffmpeg? ( media-video/ffmpeg:0= )
	mobi? ( $(add_kdeapps_dep kdegraphics-mobipocket) )
	pdf? ( app-text/poppler:0-qt4 )
	taglib? ( media-libs/taglib )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package epub EPub)
		$(cmake-utils_use_find_package exif Exiv2)
		$(cmake-utils_use_find_package ffmpeg FFmpeg)
		$(cmake-utils_use_find_package mobi QMobipocket)
		$(cmake-utils_use_find_package pdf PopplerQt4)
		$(cmake-utils_use_find_package taglib Taglib)
	)

	kde4-base_src_configure
}
