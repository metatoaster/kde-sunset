# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KDE_HANDBOOK="optional"
inherit kde4-base kde4-functions-extra

DESCRIPTION="KDE multi-protocol IM client"
HOMEPAGE="https://kopete.kde.org https://apps.kde.org/en/kopete"

KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug ssl v4l"

# tests hang, last checked for 4.2.96
RESTRICT=test

# Available plugins
#	addbookmarks: NO DEPS
#	alias: NO DEPS (disabled upstream)
#	autoreplace: NO DEPS
#	contactnotes: NO DEPS
#	highlight: NO DEPS
#	history: NO DEPS
#	latex: virtual/latex as RDEPEND
#	nowlistening: NO DEPS
#	otr: libotr
#	pipes: NO DEPS
#	privacy: NO DEPS
#	statistics: dev-db/sqlite:3
#	texteffect: NO DEPS
#	translator: NO DEPS
#	urlpicpreview: NO DEPS
#	webpresence: libxml2 libxslt
# NOTE: By default we enable all plugins that don't have any dependencies
PLUGINS="+addbookmarks +autoreplace +contactnotes +highlight +history latex
+nowlistening otr +pipes +privacy +statistics +texteffect +translator
+urlpicpreview webpresence"

# Available protocols
#	gadu: net-libs/libgadu @since 4.3
#	groupwise: app-crypt/qca:2-qt4
#	irc: NO DEPS, probably will fail so inform user about it
#	xmpp: net-dns/libidn app-crypt/qca:2-qt4 ENABLED BY DEFAULT NETWORK
#	jingle: media-libs/speex net-libs/ortp DISABLED BY UPSTREAM
#	meanwhile: net-libs/meanwhile
#	oscar: NO DEPS
#	testbed: NO DEPS
#	winpopup: NO DEPS (we're adding samba as RDEPEND so it works)
#	zeroconf (bonjour): NO DEPS
PROTOCOLS="gadu groupwise meanwhile oscar testbed winpopup +xmpp zeroconf"

# disabled protocols
#   irc: NO DEPS
#   jingle: media-libs/speex net-libs/ortp DISABLED BY UPSTREAM
#   msn: net-libs/libmsn
#   qq: NO DEPS
#   telepathy: net-libs/decibel
#   yahoo: media-libs/jasper (service shutdown)
#   skype, sms (until fixed)

IUSE="${IUSE} ${PLUGINS} ${PROTOCOLS}"

COMMONDEPEND="
	$(add_kdeframeworks_dep kdelibs 'zeroconf?')
	$(add_kdeapps_dep kdepimlibs)
	dev-libs/libpcre
	>=dev-qt/qtgui-4.4.0:4[mng]
	media-libs/phonon:0-qt4
	media-libs/qimageblitz
	x11-libs/libX11
	x11-libs/libXScrnSaver
	gadu? ( >=net-libs/libgadu-1.8.0[threads] )
	groupwise? ( app-crypt/qca:2-qt4 )
	meanwhile? ( net-libs/meanwhile )
	otr? ( >=net-libs/libotr-4.0.0 )
	statistics? ( dev-db/sqlite:3 )
	v4l? ( media-libs/libv4l )
	webpresence? (
		dev-libs/libxml2
		dev-libs/libxslt
	)
	xmpp? (
		app-crypt/qca:2-qt4
		net-dns/libidn
		sys-libs/zlib
	)
"
RDEPEND="${COMMONDEPEND}
	latex? (
		|| (
			media-gfx/imagemagick
			media-gfx/graphicsmagick[imagemagick]
		)
		virtual/latex-base
	)
	ssl? ( app-crypt/qca:2-qt4[ssl] )
	winpopup? ( net-fs/samba )
"
DEPEND="${COMMONDEPEND}
	x11-base/xorg-proto
"

src_configure() {
	local x x2
	# Handle common stuff
	local mycmakeargs=(
		-DWITH_GOOGLETALK=OFF
		-DWITH_LiboRTP=OFF
		-DWITH_Mediastreamer=OFF
		-DWITH_Speex=OFF
		$(cmake-utils_use_disable v4l VIDEOSUPPORT)
	)
	# enable protocols
	for x in ${PROTOCOLS}; do
		case ${x/+/} in
			xmpp) x2=jabber ;;
			zeroconf) x2=bonjour ;;
			*) x2='' ;;
		esac
		mycmakeargs+=($(cmake-utils_use_with ${x/+/} ${x2}))
	done

	mycmakeargs+=( -DWITH_libjingle=OFF -DWITH_Libmsn=OFF -DWITH_qq=OFF )

	# enable plugins
	for x in ${PLUGINS}; do
		mycmakeargs+=($(cmake-utils_use_with ${x/+/}))
	done

	kde4-base_src_configure
}

pkg_postinst() {
	kde4-base_pkg_postinst

	#if use telepathy; then
	#	elog "To use kopete telepathy plugins, you need to start gabble first:"
	#	elog "GABBLE_PERSIST=1 telepathy-gabble &"
	#	elog "export TELEPATHY_DATA_PATH='${EPREFIX}/usr/share/telepathy/managers/'"
	#fi

	if ! use ssl; then
		if use xmpp ; then # || use irc; then
			if ! has_version "app-crypt/qca:2-qt4[ssl]" ; then
				elog "In order to use ssl in xmpp you'll need to"
				elog "install app-crypt/qca package with USE=ssl."
			fi
		fi
	fi
}
