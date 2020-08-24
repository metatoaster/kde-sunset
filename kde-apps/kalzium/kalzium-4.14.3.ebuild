# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

KDE_HANDBOOK="optional"
CPPUNIT_REQUIRED="optional"
OPENGL_REQUIRED="always"
inherit kde4-base flag-o-matic

DESCRIPTION="KDE: periodic table of the elements"
HOMEPAGE="https://www.kde.org/applications/education/kalzium
https://edu.kde.org/kalzium"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug +plasma solver"

DEPEND="
	$(add_kdeapps_dep libkdeedu)
	solver? ( dev-ml/facile[ocamlopt] )
"
RDEPEND=${DEPEND}

KMEXTRACTONLY="
	libkdeedu/kdeeduui/
	libkdeedu/libscience/
"

src_configure(){
	# Fix missing finite()
	[[ ${CHOST} == *-solaris* ]] && append-cppflags -DHAVE_IEEEFP_H

	local mycmakeargs=(
		-DWITH_Eigen2=OFF
		-DWITH_Avogadro=OFF
		-DWITH_OpenBabel2=OFF
		-DWITH_OpenGL=OFF
		$(cmake-utils_use_with solver OCaml)
		$(cmake-utils_use_with solver Libfacile)
	)

	kde4-base_src_configure
}
