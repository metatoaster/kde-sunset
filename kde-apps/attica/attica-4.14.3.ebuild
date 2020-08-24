# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KMNAME="kde-runtime"
inherit kde4-meta

DESCRIPTION="Open Collaboration Services provider management"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	dev-libs/libattica
"
RDEPEND="${DEPEND}"
