# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2
inherit autotools eutils qt3

DESCRIPTION="Softphone for VoIP communcations using SIP protocol"
HOMEPAGE="http://www.twinklephone.com/"
SRC_URI="http://www.xs4all.nl/~mfnboer/twinkle/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc ~ppc64 x86"
IUSE="ilbc speex"

RDEPEND=">=net-libs/ccrtp-1.6.0
	dev-cpp/commoncpp2
	dev-qt/qt-meta:3
	media-libs/libsndfile
	dev-libs/boost
	ilbc? ( dev-libs/ilbc-rfc3951 )
	speex? ( media-libs/speex )
	media-libs/alsa-lib"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-1.4.1-kdedetect.patch
	eautoreconf
}

src_configure() {
	econf \
		--disable-dependency-tracking \
		--without-kde \
		$(use_with ilbc) \
		$(use_with speex) \
		--without-zrtp \
		--without-arts
}

src_install() {
	emake DESTDIR="${D}" install || die
	domenu twinkle.desktop || die
	dodoc AUTHORS ChangeLog NEWS README THANKS || die
}
