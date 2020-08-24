# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit kde4-base

DESCRIPTION="A FFmpeg based thumbnail Generator for Video Files"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	media-video/ffmpeg:0=
"
RDEPEND="${DEPEND}
	$(add_kdeapps_dep kdebase-kioslaves)
"
