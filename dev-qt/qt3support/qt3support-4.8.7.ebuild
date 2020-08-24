# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit qt4-build-multilib

DESCRIPTION="The Qt3Support module for the Qt toolkit"

if [[ ${QT4_BUILD_TYPE} == release ]]; then
	KEYWORDS="~alpha amd64 ~arm ~hppa ~mips ppc ppc64 ~sparc x86"
fi

IUSE="+accessibility"

DEPEND="
	~dev-qt/qtcore-${PV}[debug=,qt3support,${MULTILIB_USEDEP}]
	~dev-qt/qtgui-${PV}[accessibility=,debug=,qt3support,${MULTILIB_USEDEP}]
	~dev-qt/qtsql-${PV}[debug=,qt3support,${MULTILIB_USEDEP}]
"
RDEPEND="${DEPEND}"

QT4_TARGET_DIRECTORIES="
	src/qt3support
	src/tools/uic3
	tools/porting"

multilib_src_configure() {
	local myconf=(
		-qt3support
		$(qt_use accessibility)
	)
	qt4_multilib_src_configure
}
