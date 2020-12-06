# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

KMNAME="kde-workspace"
DECLARATIVE_REQUIRED="always"
OPENGL_REQUIRED="always"
#VIRTUALX_REQUIRED=test
inherit flag-o-matic kde4-meta

DESCRIPTION="KDE window manager"
HOMEPAGE+=" https://userbase.kde.org/KWin"

KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug gles2-only"

RESTRICT+=" test"
# test 8: kwin-TestVirtualDesktops hangs even with virtualx

COMMONDEPEND="
	kde-frameworks/kactivities:4
	kde-frameworks/kdelibs:4[opengl]
	kde-plasma/kephal:4
	kde-plasma/libkworkspace:4
	kde-plasma/liboxygenstyle:4
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libxcb
	x11-libs/xcb-util-image
	x11-libs/xcb-util-keysyms
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	>=x11-libs/libXrandr-1.2.1
	x11-libs/libXrender
	x11-libs/libXxf86vm
	!gles2-only? ( >=media-libs/mesa-7.10 )
	gles2-only? ( >=media-libs/mesa-7.12[egl(+),gles2] )
"
DEPEND="${COMMONDEPEND}
	x11-libs/xcb-util-renderutil
	x11-base/xorg-proto
"
RDEPEND="${COMMONDEPEND}
	x11-apps/scripts
"

KMEXTRACTONLY="
	ksmserver/
	libs/kephal/
	libs/oxygen/
"

PATCHES=( "${FILESDIR}/${P}-gcc6.patch" )

src_configure() {
	# FIXME Remove when activity API moved away from libkworkspace
	append-cppflags "-I${EPREFIX}/usr/include/kworkspace"

	local mycmakeargs=(
		-DWITH_Wayland=OFF
		-DWITH_OpenGLES=$(usex gles2-only)
		-DWITH_OpenGL=$(usex !gles2-only)
	)

	kde4-meta_src_configure
}
