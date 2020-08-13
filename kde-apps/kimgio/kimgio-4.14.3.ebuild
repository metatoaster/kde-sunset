# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KMNAME="kde-runtime"
inherit kde4-meta

DESCRIPTION="KDE WebP image format plugin"
KEYWORDS="amd64 ~arm ~ppc ~ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="media-libs/libwebp:="
RDEPEND="${DEPEND}"
