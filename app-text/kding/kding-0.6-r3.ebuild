# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

KDE_HANDBOOK="optional"
KDE_LINGUAS="de"
inherit kde4-base

DESCRIPTION="KDE port of Ding, a dictionary lookup program"
HOMEPAGE="https://sourceforge.net/projects/kding/ https://phabricator.kde.org/T10719"
SRC_URI="https://phabricator.kde.org/file/download/jnmscnve2mrtdqqhsmw2/PHID-FILE-vr5jgyqczprj7fnl3o77/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="amd64 x86"
IUSE="debug"

DEPEND="media-libs/libpng:0"

PATCHES=(
	"${FILESDIR}/${P}-dtd.patch"
	"${FILESDIR}/${P}-cmake.patch"
)

src_prepare() {
	sed -e "/Encoding=UTF-8/d" \
		-i resources/kding.desktop || die "fixing .desktop file failed"

	kde4-base_src_prepare
}

src_install() {
	kde4-base_src_install

	# bug 510510
	pngfix -q --out=out.png "${ED}/usr/share/icons/hicolor/22x22/apps/kding.png"
	mv -f out.png "${ED}/usr/share/icons/hicolor/22x22/apps/kding.png" \
	|| die "fixing broken png file failed"
}
