# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit kde4-base

DESCRIPTION="A KDE utility that edits GRUB configuration files"
HOMEPAGE="https://www.linux-apps.com/p/1127871 https://sourceforge.net/projects/kgrubeditor/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

pkg_postinst() {
	if ! has_version "<sys-boot/grub-1" && ! has_version sys-boot/grub-static; then
		ewarn "Neither <sys-boot/grub-1 nor sys-boot/grub-static packages found installed."
	fi
	ewarn "NOTE: kgrubeditor can not handle grub-2.x configuration files!"
}
