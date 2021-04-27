# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KDE_SCM="git"
if [[ ${PV} != 9999* ]]; then
	KDE_HANDBOOK="optional"
	KDE_DOC_DIRS="doc"

	SRC_URI="http://deb.debian.org/debian/pool/main/k/${PN}/${P}.orig.tar.bz2 -> ${P}.tar.bz2"
	S="${WORKDIR}"/"${MY_P}"

	KEYWORDS="~amd64 ~x86"
else
	LIBKT_VERSION_MIN="${PV}"
	LIBKT_VERSION_MAX="99999999"
fi

inherit kde4-base kde4-functions-extra

DESCRIPTION="Powerful BitTorrent client by KDE"
HOMEPAGE="http://ktorrent.pwsp.net/"

LICENSE="GPL-2"
SLOT="4"
IUSE="+bwscheduler debug +downloadorder +infowidget +ipfilter +logviewer
+magnetgenerator +mediaplayer plasma rss +scanfolder +search +shutdown +stats
+upnp webinterface +zeroconf"

COMMONDEPEND="
	>=net-libs/libktorrent-1.3.1:4
	infowidget? ( dev-libs/geoip )
	mediaplayer? ( >=media-libs/taglib-1.5 )
	plasma? ( $(add_kdeplasma_dep libtaskmanager) )
	rss? ( $(add_kdeapps_dep kdepimlibs) )
	search? (
		$(add_kdeframeworks_dep kdelibs webkit 4.14.22)
		dev-qt/qtwebkit:4
	)
	shutdown? ( $(add_kdeplasma_dep libkworkspace) )
"
DEPEND="${COMMONDEPEND}
	dev-libs/boost
	sys-devel/gettext
"
RDEPEND="${COMMONDEPEND}
	ipfilter? (
		app-arch/bzip2
		app-arch/unzip
		$(add_kdeapps_dep kdebase-kioslaves)
	)
"

PATCHES=(
	"${FILESDIR}/${P}-ipfilter.patch"
	"${FILESDIR}/${P}-underlinking.patch"
)

src_prepare() {
	if ! use plasma; then
		sed -i \
			-e "s:add_subdirectory(plasma):#nada:g" \
			CMakeLists.txt || die "Failed to make plasmoid optional"
	fi

	kde4-base_src_prepare
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_enable bwscheduler BWSCHEDULER_PLUGIN)
		$(cmake-utils_use_enable downloadorder DOWNLOADORDER_PLUGIN)
		$(cmake-utils_use_enable infowidget INFOWIDGET_PLUGIN)
		$(cmake-utils_use_with infowidget SYSTEM_GEOIP)
		$(cmake-utils_use_enable ipfilter IPFILTER_PLUGIN)
		-DENABLE_SCRIPTING_PLUGIN=OFF
		$(cmake-utils_use_enable logviewer LOGVIEWER_PLUGIN)
		$(cmake-utils_use_enable magnetgenerator MAGNETGENERATOR_PLUGIN)
		$(cmake-utils_use_enable mediaplayer MEDIAPLAYER_PLUGIN)
		$(cmake-utils_use_enable rss SYNDICATION_PLUGIN)
		$(cmake-utils_use_enable scanfolder SCANFOLDER_PLUGIN)
		$(cmake-utils_use_enable search SEARCH_PLUGIN)
		$(cmake-utils_use_enable shutdown SHUTDOWN_PLUGIN)
		$(cmake-utils_use_enable stats STATS_PLUGIN)
		$(cmake-utils_use_enable upnp UPNP_PLUGIN)
		$(cmake-utils_use_enable webinterface WEBINTERFACE_PLUGIN)
		$(cmake-utils_use_enable zeroconf ZEROCONF_PLUGIN)
	)
	kde4-base_src_configure
}
