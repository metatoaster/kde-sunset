# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="kdeartwork - merge this to pull in all kdeartwork-derived packages"
HOMEPAGE="https://www.kde.org/"

LICENSE="metapackage"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=kde-apps/kdeartwork-colorschemes-15.08.3:4
	>=kde-apps/kdeartwork-desktopthemes-15.08.3:4
	>=kde-apps/kdeartwork-emoticons-15.08.3:4
	>=kde-apps/kdeartwork-iconthemes-15.08.3:4
	>=kde-apps/kdeartwork-wallpapers-15.08.3:4
	>=kde-apps/kdeartwork-weatherwallpapers-15.08.3:4
"
