# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KMNAME="kde-workspace"
inherit kde4-meta

DESCRIPTION="KDE Plasma daemon listening for wall and write messages"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND=">=sys-libs/libutempter-1.1.5"
RDEPEND="${DEPEND}"
