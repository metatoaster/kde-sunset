# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

COMMIT=d626bceefe2dab03c5aa1c2ac96ef627a6b60c8d
inherit kde4-base

DESCRIPTION="KDE CD player"
HOMEPAGE="https://kde.org/applications/en/multimedia/org.kde.kscd"
SRC_URI="https://github.com/KDE/kscd/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	$(add_kdeapps_dep libkcddb)
	media-libs/musicbrainz:5
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${COMMIT}"
