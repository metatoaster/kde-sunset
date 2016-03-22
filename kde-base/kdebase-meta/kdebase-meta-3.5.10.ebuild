# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kdebase-meta/kdebase-meta-3.5.10.ebuild,v 1.8 2009/08/09 21:03:44 zmedico Exp $

EAPI="1"
inherit kde-functions
DESCRIPTION="kdebase - merge this to pull in all kdebase-derived packages"
HOMEPAGE="http://www.kde.org/"

LICENSE="GPL-2"
SLOT="3.5"
KEYWORDS="alpha amd64 hppa ia64 ~mips ppc ppc64 sparc x86 ~x86-fbsd"
IUSE=""

RDEPEND=">=kde-base/kdebase-startkde-${PV}:${SLOT}
>=kde-apps/drkonqi-${PV}:${SLOT}
>=kde-base/kappfinder-${PV}:${SLOT}
>=kde-apps/kate-${PV}:${SLOT}
>=kde-base/kcheckpass-${PV}:${SLOT}
>=kde-base/kcminit-${PV}:${SLOT}
>=kde-apps/kcontrol-${PV}:${SLOT}
>=kde-base/kdcop-${PV}:${SLOT}
>=kde-base/kdebugdialog-${PV}:${SLOT}
>=kde-apps/kdepasswd-${PV}:${SLOT}
>=kde-base/kdeprint-${PV}:${SLOT}
>=kde-base/kdesktop-${PV}:${SLOT}
>=kde-apps/kdesu-${PV}:${SLOT}
>=kde-apps/kdialog-${PV}:${SLOT}
>=kde-base/kdm-${PV}:${SLOT}
>=kde-apps/kfind-${PV}:${SLOT}
>=kde-base/khelpcenter-${PV}:${SLOT}
>=kde-base/khotkeys-${PV}:${SLOT}
>=kde-base/kicker-${PV}:${SLOT}
>=kde-apps/kdebase-kioslaves-${PV}:${SLOT}
>=kde-base/klipper-${PV}:${SLOT}
>=kde-base/kmenuedit-${PV}:${SLOT}
>=kde-apps/konqueror-${PV}:${SLOT}
>=kde-apps/konsole-${PV}:${SLOT}
>=kde-base/kpager-${PV}:${SLOT}
>=kde-base/kpersonalizer-${PV}:${SLOT}
>=kde-apps/kreadconfig-${PV}:${SLOT}
>=kde-base/kscreensaver-${PV}:${SLOT}
>=kde-base/ksmserver-${PV}:${SLOT}
>=kde-base/ksplashml-${PV}:${SLOT}
>=kde-apps/kstart-${PV}:${SLOT}
>=kde-base/ksysguard-${PV}:${SLOT}
>=kde-base/ksystraycmd-${PV}:${SLOT}
>=kde-base/ktip-${PV}:${SLOT}
>=kde-base/kwin-${PV}:${SLOT}
>=kde-base/kxkb-${PV}:${SLOT}
>=kde-apps/libkonq-${PV}:${SLOT}
>=kde-apps/nsplugins-${PV}:${SLOT}
>=kde-apps/knetattach-${PV}:${SLOT}
>=kde-apps/kdebase-data-${PV}:${SLOT}"
