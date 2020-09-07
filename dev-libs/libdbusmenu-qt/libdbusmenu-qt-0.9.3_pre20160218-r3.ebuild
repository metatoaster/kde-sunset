# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_ECLASS=cmake
MY_PV=${PV/_pre/+16.04.}
inherit cmake-multilib multibuild

DESCRIPTION="Library providing Qt implementation of DBusMenu specification"
HOMEPAGE="https://launchpad.net/libdbusmenu-qt/"
SRC_URI="https://launchpad.net/ubuntu/+archive/primary/+files/${PN}_${MY_PV}.orig.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="amd64 ~arm ~ppc ~ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="+qt4 qt5"

REQUIRED_USE="|| ( qt4 qt5 )"

DEPEND="
	qt4? (
		>=dev-qt/qtcore-4.8.6:4[${MULTILIB_USEDEP}]
		>=dev-qt/qtdbus-4.8.6:4[${MULTILIB_USEDEP}]
		>=dev-qt/qtgui-4.8.6:4[${MULTILIB_USEDEP}]
	)
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtdbus:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
	)
"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}-${MY_PV}

PATCHES=( "${FILESDIR}/${P}-cmake.patch" )

pkg_setup() {
	MULTIBUILD_VARIANTS=( $(usex qt4 4) $(usex qt5 5) )
}

src_prepare() {
	cmake_src_prepare

	cmake_comment_add_subdirectory tools
	# tests fail due to missing connection to dbus
	cmake_comment_add_subdirectory tests
}

multilib_src_configure() {
	local mycmakeargs=(
		-DWITH_DOC=OFF
	)
	[[ ${QT_MULTIBUILD_VARIANT} = 4 ]] && mycmakeargs+=(
		-DUSE_QT4=ON
		-DQT_QMAKE_EXECUTABLE="/usr/$(get_libdir)/qt${QT_MULTIBUILD_VARIANT}/bin/qmake"
	)
	cmake_src_configure
}

src_configure() {
	myconfigure() {
		local QT_MULTIBUILD_VARIANT=${MULTIBUILD_VARIANT}
		if [[ ${MULTIBUILD_VARIANT} = 4 ]] ; then
			cmake-multilib_src_configure
		elif [[ ${MULTIBUILD_VARIANT} = 5 ]] ; then
			multilib_src_configure
		fi
	}
	multibuild_foreach_variant myconfigure
}

src_compile() {
	mycompile() {
		if [[ ${MULTIBUILD_VARIANT} = 4 ]] ; then
			cmake-multilib_src_compile
		elif [[ ${MULTIBUILD_VARIANT} = 5 ]] ; then
			cmake_src_compile
		fi
	}
	multibuild_foreach_variant mycompile
}

src_install() {
	myinstall() {
		if [[ ${MULTIBUILD_VARIANT} = 4 ]] ; then
			cmake-multilib_src_install
		elif [[ ${MULTIBUILD_VARIANT} = 5 ]] ; then
			cmake_src_install
		fi
	}
	multibuild_foreach_variant myinstall
}
