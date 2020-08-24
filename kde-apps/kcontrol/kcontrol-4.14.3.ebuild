# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KDE_HANDBOOK="optional"
KMNAME="kde-runtime"
inherit kde4-meta kde4-functions-extra

DESCRIPTION="The KDE Control Center"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

RDEPEND="
	$(add_kdeplasma_dep khotkeys '' 4.11)
	$(add_kdeapps_dep zeroconf-ioslave)
"
