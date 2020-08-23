# Copyright 1999-2020 Gentoo
# Distributed under the terms of the GNU General Public License v2

KMNAME="knetworkmanager"
inherit kde eutils

DESCRIPTION="KDE frontend for NetworkManager"
HOMEPAGE="http://en.opensuse.org/Projects/KNetworkManager"
SRC_URI="mirror://kde-sunset/${KMNAME}-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="cisco openvpn pptp dialup"

need-kde 3.5

DEPEND="net-misc/networkmanager
	=kde-frameworks/kdelibs-3.5*
	>=dev-libs/dbus-qt3-old-0.9
	sys-apps/hal
	net-wireless/wireless-tools
	>=dev-libs/libnl-1.1
	cisco?   ( net-misc/networkmanager-vpnc )
	openvpn? ( net-misc/networkmanager-openvpn )
	pptp?    ( net-misc/networkmanager-pptp )
	dialup? ( =kde-base/kppp-3.5* )"

RDEPEND="${DEPEND}"
DEPEND="${DEPEND}
	>=sys-kernel/linux-headers-2.6.19
	sys-apps/util-linux"

S="${WORKDIR}/${KMNAME}"

pkg_setup() {
	kde_pkg_setup
}

src_unpack() {
	kde_src_unpack
	cd "${S}"
	epatch "${FILESDIR}"/${KMNAME}-0.7-dbus_access.patch
	epatch "${FILESDIR}"/${KMNAME}-0.7-no_blank_psk.patch
	epatch "${FILESDIR}"/${KMNAME}-0.7-configure-check-for-nm.patch
	epatch "${FILESDIR}"/${KMNAME}-0.7-uuid_fix.patch
}

src_compile() {
	set-kdedir
	export PREFIX="${KDEDIR}"
	local myconf="$(use_with cisco vpnc) \
		$(use_with openvpn) \
		$(use_with pptp) \
		$(use_with dialup) \
		--with-distro=gentoo --disable-rpath"
	kde_src_compile
}

src_install() {
	kde_src_install

	# kde.eclass sets sysconfdir too weird for us, delete conf from there and reinstall to /etc
	set-kdedir
	rm -rf "${D}/${KDEDIR}/etc"
	insinto /etc/dbus-1/system.d/
	doins ${KMNAME}-0.7/knetworkmanager.conf
}
