# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

ARTS_REQUIRED="never"
WANT_AUTOMAKE="1.6"
inherit kde

DESCRIPTION="Nice lm-sensors frontend for KDE Plasma"
HOMEPAGE="http://ksensors.sourceforge.net/"
SRC_URI="mirror://sourceforge/ksensors/${P}.tar.gz
	mirror://debian/pool/main/k/ksensors/${PN}_${PV}-16.diff.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="hddtemp ibmacpi"

DEPEND=">=sys-apps/lm-sensors-2.6.3"
RDEPEND="${DEPEND}
	hddtemp? ( >=app-admin/hddtemp-0.3_beta15-r1 )"

need-kde 3.5

src_unpack() {
	kde_src_unpack

	rm -f "${S}"/configure

	cd "${WORKDIR}"

	# Debian patchset, fixes bugs 120350, 171208, 173821, 232782
	epatch ${PN}_${PV}-16.diff

	epatch "${FILESDIR}/ksensors-0.7.3-desktop-file.diff"
	epatch "${FILESDIR}/ksensors-0.7.3-sound-dir.diff"

	# On Gentoo hddtemp resides in /usr/sbin which is not in the user's
	# path. Thus, call hddtemp with full path.
	use hddtemp && epatch "${FILESDIR}/${P}-hddtemp-path.patch"

	# User-contributed patch, fixes bug 116661
	use ibmacpi && epatch "${FILESDIR}/${P}-ibm-acpi.patch"
}

pkg_postinst() {
	kde_pkg_postinst

	if use hddtemp; then
		[[ -u "${ROOT}"/usr/sbin/hddtemp ]] || \
			elog "You need to run \"chmod u+s /usr/sbin/hddtemp\" to show disk temperatures."
	fi
}
