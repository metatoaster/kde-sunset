# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-crypt/qca-tls/qca-tls-1.0-r4.ebuild,v 1.9 2009/03/18 18:09:26 ranger Exp $

inherit eutils

DESCRIPTION="plugin to provide SSL/TLS capability to programs that utilize QCA"
HOMEPAGE="http://delta.affinix.com/qca/"
SRC_URI="http://delta.affinix.com/download/${PN%-*}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
#alpha amd64 and ppc64 need testing
KEYWORDS="~alpha amd64 hppa ~ia64 ~mips ppc ppc64 ~sparc x86"
IUSE=""

DEPEND="=app-crypt/qca-1*
	>=dev-libs/openssl-0.9.6i"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/qca-pathfix.patch
	epatch "${FILESDIR}"/qca-openssl-0.9.8.patch
	epatch "${FILESDIR}"/qca-openssl-1.0.0.patch
}

src_compile() {
	./configure || die "configure failed"
	sed -i \
		-e "/^CFLAGS/s:$: ${CFLAGS}:" \
		-e "/^CXXFLAGS/s:$: ${CXXFLAGS}:" \
		-e "/-strip/d" \
		Makefile
	emake || die "emake failed"
}

src_install() {
	emake INSTALL_ROOT="${D}" install || die "make install failed"

	dodoc README
}
