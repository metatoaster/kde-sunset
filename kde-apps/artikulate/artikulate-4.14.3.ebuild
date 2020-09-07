# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DECLARATIVE_REQUIRED="always"
KDE_HANDBOOK="optional"
inherit kde4-base

DESCRIPTION="Language learning application that helps improving pronunciation skills"
HOMEPAGE="https://edu.kde.org/applications/language/artikulate"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	dev-qt/qtxmlpatterns:4
	>=media-libs/qt-gstreamer-1.2.0:0-qt4
"
RDEPEND="${DEPEND}
	$(add_kdeapps_dep kqtquickcharts)
"
