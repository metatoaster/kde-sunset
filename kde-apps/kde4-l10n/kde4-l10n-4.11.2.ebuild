# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit kde4-base

DESCRIPTION="KDE internationalization package"
HOMEPAGE="https://l10n.kde.org"

DEPEND="
	sys-devel/gettext
"
RDEPEND="!<kde-apps/konq-plugins-4.6:4"

KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"

# /usr/portage/distfiles $ ls -1 kde-l10n-*-${PV}.* |sed -e 's:-${PV}.tar.xz::' -e 's:kde-l10n-::' |tr '\n' ' '
MY_LANGS="ar bg bs ca ca@valencia cs da de el en_GB es et eu fa fi fr ga gl he
hi hr hu ia is it ja kk km ko lt lv mr nb nds nl nn pa pl pt pt_BR ro ru sk sl
sr sv tg tr ug uk vi wa zh_CN zh_TW"

IUSE="+handbook $(printf 'l10n_%s ' ${MY_LANGS//[@_]/-})"

URI_BASE="mirror://kde/Attic/4.11.2/src/kde-l10n"
SRC_URI=""

for MY_LANG in ${MY_LANGS} ; do
	SRC_URI="${SRC_URI} l10n_${MY_LANG/[@_]/-}? ( ${URI_BASE}/kde-l10n-${MY_LANG}-${PV}.tar.xz )"
done

S="${WORKDIR}"

src_unpack() {
	local LNG DIR
	if [[ -z ${A} ]]; then
		elog
		elog "None of the requested L10N are supported by ${P}."
		elog
		elog "${P} supports these language codes:"
		elog "${MY_LANGS//[@_]/-}"
		elog
	fi

	[[ -n ${A} ]] && unpack ${A}
	cd "${S}"

	# add all l10n to cmake
	if [[ -n ${A} ]]; then
		for LNG in ${MY_LANGS}; do
			DIR="kde-l10n-${LNG}-${PV}"
			if [[ -d "${DIR}" ]] ; then
				echo "add_subdirectory( ${DIR} )" >> "${S}"/CMakeLists.txt
			fi
		done
	fi
}

src_prepare() {
	find "${S}" -name CMakeLists.txt -type f \
		-exec sed -i -e 's:^ *add_subdirectory( *kdepim-runtime *):# no kdepim-runtime:g' {} +
	find "${S}" -name CMakeLists.txt -type f \
		-exec sed -i -e 's:^ *add_subdirectory( *kdepim *):# no kdepim:g' {} +

	# bug 481106, please remove in 4.11.1 and later
	use l10n_pl && rm "${S}"/kde-l10n-pl-${PV}/messages/kde-runtime/{accountwizard*,akonadi_*}.po

	kde4-base_src_prepare
}

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_build handbook docs)
	)
	[[ -n ${A} ]] && kde4-base_src_configure
}

src_compile() {
	[[ -n ${A} ]] && kde4-base_src_compile
}

src_test() {
	[[ -n ${A} ]] && kde4-base_src_test
}

src_install() {
	[[ -n ${A} ]] && kde4-base_src_install
}
