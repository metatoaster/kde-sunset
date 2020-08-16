# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

ARTS_REQUIRED=never
inherit perl-module kde

#install pqtsh to this directory
myinst="${myinst} INSTBINDIR=${D}/usr/bin"
myconf="--enable-smoke --disable-libtool-lock"
mydoc="ChangeLog README TODO INSTALL COPYING AUTHORS"

DESCRIPTION="Perl bindings for the Qt 3.x toolkit"
HOMEPAGE="http://perlqt.sourceforge.net/"

SRC_URI="mirror://sourceforge/perlqt/${P/_beta2/-b2}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc ~sparc x86"
IUSE=""
S=${WORKDIR}/${P/_beta2/}

#if kdebindings is installed compilation is really fast!
# because libsmoke comes with kdebindings-3.1

DEPEND="
	=dev-qt/qt-meta-3*
	kde-frameworks/kdelibs:3.5
	dev-lang/perl"

src_unpack() {
	unpack ${A}
	cd ${S}/PerlQt || die
	#cp Makefile.PL.in Makefile.PL.in.orig
	#perl -pi -e "s#WriteMakefile\(#WriteMakefile\(\n'PREFIX' => '${D}/usr',\n#" Makefile.PL.in
	cd ${S} || die
}

src_compile() {
	myconf="${myconf} --without-arts"
	addwrite $QTDIR/etc/settings
	perl Makefile.PL ${myconf} --prefix=${D}/usr --exec-prefix=/usr || die
	emake
}

src_install() {

	addwrite $QTDIR/etc/settings
	dodir /lib
	make PREFIX=/usr DESTDIR=${D} install || die
	mkdir -p ${D}/usr/share/doc/${P}/tutorials || die
	cp -r ${S}/PerlQt/tutorials/* ${D}/usr/share/doc/${P}/tutorials || die
	mv ${D}/${D}/usr ${D}/ || die
	rm -rf ${D}/var || die

	for file in `find ${D}/usr/share/doc/${P}/tutorials/*/*.pl`;do
		perl -pi -e "s/use blib;/#use blib;/" ${file} || die
		chmod +x ${file} || die
	done

	mkdir -p ${D}/usr/share/doc/${P}/examples || die
	cp -r ${S}/PerlQt/examples/* ${D}/usr/share/doc/${P}/examples || die
	for file in `find ${D}/usr/share/doc/${P}/examples/*/*.pl`;do
		chmod +x ${file} || die
	done
}
