# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="KDE toys - merge this to pull in all kdetoys-derived packages"
HOMEPAGE+=" https://techbase.kde.org/Projects/Kdetoys"

LICENSE="metapackage"
SLOT="4"
KEYWORDS=" ~amd64 ~x86"
IUSE=""

RDEPEND="
	>=kde-apps/amor-15.08.3:4
	>=kde-apps/ktux-15.08.3:4
"
