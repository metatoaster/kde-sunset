# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

KDE_HANDBOOK="optional"
inherit kde4-base

DESCRIPTION="A MIDI/Karaoke player based on kdelibs"
HOMEPAGE="https://userbase.kde.org/KMid"
SRC_URI="mirror://sourceforge/kmid2/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="amd64 x86"
IUSE="debug"

RDEPEND="
	media-libs/alsa-lib
	>=media-sound/drumstick-0.4
	<media-sound/drumstick-1.0.0
"
DEPEND="${RDEPEND}"

DOCS=( ChangeLog README TODO )
