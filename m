From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dtc: build errors with swig
Date: Fri, 29 Sep 2017 10:34:36 +1000
Message-ID: <20170929003436.GA7712@umbus.fritz.box>
References: <CAODfWeERM-HwcdmsZi+Afo2i5M54rnQk8vRJ_3nOSsC5H0qhYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1506645889;
        bh=nMEDC/Iz0Sh0DUjZ9wySNt7XvriDF8rGUo6zLSmNTK0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XesHwEqDxnn4FSvrr35cpwMNPpJD7CeHK1m1XQjayFuKHcuo0GNYQfVWd+dUIJBtk
         qx1acPmO+K5V3Pyxg2XizedeLjFquM0vGCMyNBaYyylehSrCgg9Uo9nUYnwQVtGOc1
         KFrE4rZYWCuFtiapfYQHWGB8hm0TvHmDD//lNw60=
Content-Disposition: inline
In-Reply-To: <CAODfWeERM-HwcdmsZi+Afo2i5M54rnQk8vRJ_3nOSsC5H0qhYw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?H=E9ctor_Or=F3n_Mart=EDnez?= <hector.oron-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2017 at 12:28:19AM +0200, H=C3=A9ctor Or=C3=B3n Mart=C3=ADn=
ez wrote:
> Hello,
>=20
>   I have attempted to build python library for device tree compiler,
> however I ran out into build issues with swig components due to -Wall.
> I have tried to look for a bug tracking system to report it, but I
> have been unable to find one.
>=20
>   Find log attached with build issues in Debian/unstable build.
>=20
> P.S./ I am not in the mailing list, please keep me on CC

Hrm, I haven't seen errors like that.  What swig and compiler version
do you have?

>=20
> Regards,

>  dpkg-buildpackage -rfakeroot -us -uc -i -I
> dpkg-buildpackage: info: paquet font device-tree-compiler
> dpkg-buildpackage: info: versi=C3=B3 del font 1.4.5-1
> dpkg-buildpackage: info: distribuci=C3=B3 del font unstable
> dpkg-buildpackage: info: font canviat per H=C3=A9ctor Or=C3=B3n Mart=C3=
=ADnez <zumbi-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  dpkg-source -i -I --before-build device-tree-compiler
> dpkg-buildpackage: info: arquitectura de l'amfitri=C3=B3 amd64
>  fakeroot debian/rules clean
> dh clean
>    debian/rules override_dh_auto_clean
> make[1]: Entering directory '/home/zumbi/SCM/GITAuth/Debian/device-tree-c=
ompiler'
> dh_auto_clean
> 	make -j4 clean
> make[2]: Entering directory '/home/zumbi/SCM/GITAuth/Debian/device-tree-c=
ompiler'
> 	 CLEAN (pylibfdt)
> 	 CLEAN (tests)
> 	 CLEAN (libfdt)
> 	 CLEAN
> make[2]: Leaving directory '/home/zumbi/SCM/GITAuth/Debian/device-tree-co=
mpiler'
> [ ! -f Documentation/Makefile ] || /usr/bin/make -C Documentation clean
> make[2]: Entering directory '/home/zumbi/SCM/GITAuth/Debian/device-tree-c=
ompiler/Documentation'
> rm -f *.aux *.log *.dvi *.ps *.pdf dtc-manual.txt
> make[2]: Leaving directory '/home/zumbi/SCM/GITAuth/Debian/device-tree-co=
mpiler/Documentation'
> [ ! -d build ] || rm -rf build
> make[1]: Leaving directory '/home/zumbi/SCM/GITAuth/Debian/device-tree-co=
mpiler'
>    dh_autoreconf_clean
>    dh_clean
>  dpkg-source -i -I -b device-tree-compiler
> dpkg-source: info: s'est=C3=A0 emprant el format de font =C2=AB3.0 (quilt=
)=C2=BB
> dpkg-source: info: s'est=C3=A0 construint device-tree-compiler emprant ./=
device-tree-compiler_1.4.5.orig.tar.gz existent
> dpkg-source: info: s'est=C3=A0 construint device-tree-compiler a device-t=
ree-compiler_1.4.5-1.debian.tar.xz
> dpkg-source: info: s'est=C3=A0 construint device-tree-compiler a device-t=
ree-compiler_1.4.5-1.dsc
>  debian/rules build
> dh build
>    dh_update_autotools_config
>    dh_autoreconf
>    dh_auto_configure
>    debian/rules override_dh_auto_build
> make[1]: Entering directory '/home/zumbi/SCM/GITAuth/Debian/device-tree-c=
ompiler'
> dh_auto_build=20
> 	make -j4
> make[2]: Entering directory '/home/zumbi/SCM/GITAuth/Debian/device-tree-c=
ompiler'
> 	 DEP tests/dumptrees.c
> 	 DEP tests/trees.S
> 	 DEP tests/testutils.c
> 	 DEP tests/value-labels.c
> 	 DEP tests/asm_tree_dump.c
> 	 DEP tests/truncated_property.c
> 	 DEP tests/check_path.c
> 	 DEP tests/overlay_bad_fixup.c
> 	 DEP tests/overlay.c
> 	 DEP tests/subnode_iterate.c
> 	 DEP tests/property_iterate.c
> 	 DEP tests/integer-expressions.c
> 	 DEP tests/utilfdt_test.c
> 	 DEP tests/path_offset_aliases.c
> 	 DEP tests/add_subnode_with_nops.c
> 	 DEP tests/dtbs_equal_unordered.c
> 	 DEP tests/dtb_reverse.c
> 	 DEP tests/dtbs_equal_ordered.c
> 	 DEP tests/extra-terminating-null.c
> 	 DEP tests/incbin.c
> 	 DEP tests/boot-cpuid.c
> 	 DEP tests/phandle_format.c
> 	 DEP tests/path-references.c
> 	 DEP tests/references.c
> 	 DEP tests/string_escapes.c
> 	 DEP tests/propname_escapes.c
> 	 DEP tests/appendprop2.c
> 	 DEP tests/appendprop1.c
> 	 DEP tests/del_node.c
> 	 DEP tests/del_property.c
> 	 DEP tests/setprop.c
> 	 DEP tests/set_name.c
> 	 DEP tests/rw_tree1.c
> 	 DEP tests/open_pack.c
> 	 DEP tests/nopulate.c
> 	 DEP tests/mangle-layout.c
> 	 DEP tests/move_and_save.c
> 	 DEP tests/sw_tree1.c
> 	 DEP tests/nop_node.c
> 	 DEP tests/nop_property.c
> 	 DEP tests/setprop_inplace.c
> 	 DEP tests/stringlist.c
> 	 DEP tests/addr_size_cells.c
> 	 DEP tests/notfound.c
> 	 DEP tests/sized_cells.c
> 	 DEP tests/char_literal.c
> 	 DEP tests/get_alias.c
> 	 DEP tests/node_offset_by_compatible.c
> 	 DEP tests/node_check_compatible.c
> 	 DEP tests/node_offset_by_phandle.c
> 	 DEP tests/node_offset_by_prop_value.c
> 	 DEP tests/parent_offset.c
> 	 DEP tests/get_path.c
> 	 DEP tests/supernode_atdepth_offset.c
> 	 DEP tests/get_phandle.c
> 	 DEP tests/get_name.c
> 	 DEP tests/getprop.c
> 	 DEP tests/path_offset.c
> 	 DEP tests/subnode_offset.c
> 	 DEP tests/find_property.c
> 	 DEP tests/root_node.c
> 	 DEP tests/get_mem_rsv.c
> 	 DEP libfdt/fdt_overlay.c
> 	 DEP libfdt/fdt_addresses.c
> 	 DEP libfdt/fdt_empty_tree.c
> 	 DEP libfdt/fdt_strerror.c
> 	 DEP libfdt/fdt_rw.c
> 	 DEP libfdt/fdt_sw.c
> 	 DEP libfdt/fdt_wip.c
> 	 DEP libfdt/fdt.c
> 	 DEP libfdt/fdt_ro.c
> 	 DEP util.c
> 	 DEP fdtoverlay.c
> 	 DEP fdtput.c
> 	 DEP fdtget.c
> 	 DEP fdtdump.c
> 	 LEX convert-dtsv0-lexer.lex.c
> 	 DEP srcpos.c
> 	 BISON dtc-parser.tab.c
> 	 LEX dtc-lexer.lex.c
> 	 DEP treesource.c
> 	 DEP livetree.c
> 	 DEP fstree.c
> 	 DEP flattree.c
> 	 DEP dtc.c
> 	 DEP data.c
> 	 DEP checks.c
> 	 DEP convert-dtsv0-lexer.lex.c
> 	 DEP dtc-parser.tab.c
> 	 DEP dtc-lexer.lex.c
> 	CHK version_gen.h
> 	UPD version_gen.h
> 	 DEP util.c
> 	CHK version_gen.h
> 	 CC srcpos.o
> 	 CC util.o
> 	 CC convert-dtsv0-lexer.lex.o
> 	 CC dtc.o
> 	 CC checks.o
> 	 CC data.o
> 	 CC flattree.o
> 	 CC fstree.o
> 	 CC livetree.o
> 	 CC treesource.o
> 	 CC dtc-lexer.lex.o
> 	 CC dtc-parser.tab.o
> 	 CC fdtdump.o
> 	 CC fdtget.o
> 	 CC libfdt/fdt.o
> 	 CC libfdt/fdt_ro.o
> 	 CC libfdt/fdt_sw.o
> 	 CC libfdt/fdt_wip.o
> 	 CC libfdt/fdt_rw.o
> 	 CC libfdt/fdt_strerror.o
> 	 CC libfdt/fdt_empty_tree.o
> 	 CC libfdt/fdt_addresses.o
> 	 CC libfdt/fdt_overlay.o
> 	 CC fdtput.o
> 	 CC fdtoverlay.o
> 	 LD convert-dtsv0
> make[3]: Entering directory '/home/zumbi/SCM/GITAuth/Debian/device-tree-c=
ompiler'
> 	 LD dtc
> 	CHK version_gen.h
> 	 PYMOD pylibfdt/_libfdt.so
> 	 LD fdtdump
> 	 AR libfdt/libfdt.a
> 	 LD libfdt/libfdt-1.4.5.so
> 	 LD fdtget
> 	 LD fdtput
> 	 LD fdtoverlay
> pylibfdt/libfdt_wrap.c: In function =E2=80=98SWIG_Python_NewShadowInstanc=
e=E2=80=99:
> pylibfdt/libfdt_wrap.c:2483:65: error: declaration of =E2=80=98swig_this=
=E2=80=99 shadows a global declaration [-Werror=3Dshadow]
>  SWIG_Python_NewShadowInstance(SwigPyClientData *data, PyObject *swig_thi=
s)
>                                                                  ^~~~~~~~~
> pylibfdt/libfdt_wrap.c:2224:18: note: shadowed declaration is here
>  static PyObject *swig_this =3D NULL;
>                   ^~~~~~~~~
> pylibfdt/libfdt_wrap.c: In function =E2=80=98SWIG_Python_SetSwigThis=E2=
=80=99:
> pylibfdt/libfdt_wrap.c:2558:51: error: declaration of =E2=80=98swig_this=
=E2=80=99 shadows a global declaration [-Werror=3Dshadow]
>  SWIG_Python_SetSwigThis(PyObject *inst, PyObject *swig_this)
>                                                    ^~~~~~~~~
> pylibfdt/libfdt_wrap.c:2224:18: note: shadowed declaration is here
>  static PyObject *swig_this =3D NULL;
>                   ^~~~~~~~~
> pylibfdt/libfdt_wrap.c: In function =E2=80=98SWIG_FromCharPtrAndSize=E2=
=80=99:
> pylibfdt/libfdt_wrap.c:3354:29: error: cast discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>   SWIG_InternalNewPointerObj((char *)(carray), pchar_descriptor, 0) : SWI=
G_Py_Void();
>                              ^
> pylibfdt/libfdt_wrap.c:1166:86: note: in definition of macro =E2=80=98SWI=
G_InternalNewPointerObj=E2=80=99
>  #define SWIG_InternalNewPointerObj(ptr, type, flags) SWIG_Python_NewPoin=
terObj(NULL, ptr, type, flags)
>                                                                          =
             ^~~
> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_new_fdt_header=E2=80=
=99:
> pylibfdt/libfdt_wrap.c:3027:28: error: cast discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>  #define SWIG_as_voidptr(a) (void *)((const void *)(a))
>                             ^
> pylibfdt/libfdt_wrap.c:1163:89: note: in definition of macro =E2=80=98SWI=
G_NewPointerObj=E2=80=99
>  #define SWIG_NewPointerObj(ptr, type, flags)            SWIG_Python_NewP=
ointerObj(NULL, ptr, type, flags)
>                                                                          =
                ^~~
> pylibfdt/libfdt_wrap.c:4041:34: note: in expansion of macro =E2=80=98SWIG=
_as_voidptr=E2=80=99
>    resultobj =3D SWIG_NewPointerObj(SWIG_as_voidptr(result), SWIGTYPE_p_f=
dt_header, SWIG_POINTER_NEW |  0 );
>                                   ^~~~~~~~~~~~~~~
> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_new_fdt_reserve_entry=
=E2=80=99:
> pylibfdt/libfdt_wrap.c:3027:28: error: cast discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>  #define SWIG_as_voidptr(a) (void *)((const void *)(a))
>                             ^
> pylibfdt/libfdt_wrap.c:1163:89: note: in definition of macro =E2=80=98SWI=
G_NewPointerObj=E2=80=99
>  #define SWIG_NewPointerObj(ptr, type, flags)            SWIG_Python_NewP=
ointerObj(NULL, ptr, type, flags)
>                                                                          =
                ^~~
> pylibfdt/libfdt_wrap.c:4198:34: note: in expansion of macro =E2=80=98SWIG=
_as_voidptr=E2=80=99
>    resultobj =3D SWIG_NewPointerObj(SWIG_as_voidptr(result), SWIGTYPE_p_f=
dt_reserve_entry, SWIG_POINTER_NEW |  0 );
>                                   ^~~~~~~~~~~~~~~
> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_new_fdt_node_header=E2=
=80=99:
> pylibfdt/libfdt_wrap.c:3027:28: error: cast discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>  #define SWIG_as_voidptr(a) (void *)((const void *)(a))
>                             ^
> pylibfdt/libfdt_wrap.c:1163:89: note: in definition of macro =E2=80=98SWI=
G_NewPointerObj=E2=80=99
>  #define SWIG_NewPointerObj(ptr, type, flags)            SWIG_Python_NewP=
ointerObj(NULL, ptr, type, flags)
>                                                                          =
                ^~~
> pylibfdt/libfdt_wrap.c:4350:34: note: in expansion of macro =E2=80=98SWIG=
_as_voidptr=E2=80=99
>    resultobj =3D SWIG_NewPointerObj(SWIG_as_voidptr(result), SWIGTYPE_p_f=
dt_node_header, SWIG_POINTER_NEW |  0 );
>                                   ^~~~~~~~~~~~~~~
> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_new_fdt_property=E2=80=
=99:
> pylibfdt/libfdt_wrap.c:3027:28: error: cast discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>  #define SWIG_as_voidptr(a) (void *)((const void *)(a))
>                             ^
> pylibfdt/libfdt_wrap.c:1163:89: note: in definition of macro =E2=80=98SWI=
G_NewPointerObj=E2=80=99
>  #define SWIG_NewPointerObj(ptr, type, flags)            SWIG_Python_NewP=
ointerObj(NULL, ptr, type, flags)
>                                                                          =
                ^~~
> pylibfdt/libfdt_wrap.c:4606:34: note: in expansion of macro =E2=80=98SWIG=
_as_voidptr=E2=80=99
>    resultobj =3D SWIG_NewPointerObj(SWIG_as_voidptr(result), SWIGTYPE_p_f=
dt_property, SWIG_POINTER_NEW |  0 );
>                                   ^~~~~~~~~~~~~~~
> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_offset_ptr_w=E2=80=
=99:
> pylibfdt/libfdt_wrap.c:3027:28: error: cast discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>  #define SWIG_as_voidptr(a) (void *)((const void *)(a))
>                             ^
> pylibfdt/libfdt_wrap.c:1163:89: note: in definition of macro =E2=80=98SWI=
G_NewPointerObj=E2=80=99
>  #define SWIG_NewPointerObj(ptr, type, flags)            SWIG_Python_NewP=
ointerObj(NULL, ptr, type, flags)
>                                                                          =
                ^~~
> pylibfdt/libfdt_wrap.c:4927:34: note: in expansion of macro =E2=80=98SWIG=
_as_voidptr=E2=80=99
>    resultobj =3D SWIG_NewPointerObj(SWIG_as_voidptr(result), SWIGTYPE_p_v=
oid, 0 |  0 );
>                                   ^~~~~~~~~~~~~~~
> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_string=E2=80=99:
> pylibfdt/libfdt_wrap.c:5515:12: error: cast discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>    result =3D (char *)fdt_string((void const *)arg1,arg2);
>             ^
> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_get_name=E2=80=99:
> pylibfdt/libfdt_wrap.c:5738:12: error: cast discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>    result =3D (char *)fdt_get_name((void const *)arg1,arg2,arg3);
>             ^
> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_get_property_by_of=
fset=E2=80=99:
> pylibfdt/libfdt_wrap.c:5850:12: error: cast discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>    result =3D (struct fdt_property *)fdt_get_property_by_offset((void con=
st *)arg1,arg2,arg3);
>             ^
> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_get_property=E2=80=
=99:
> pylibfdt/libfdt_wrap.c:5914:12: error: cast discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>    result =3D (struct fdt_property *)fdt_get_property((void const *)arg1,=
arg2,(char const *)arg3,arg4);
>             ^
> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_getprop=E2=80=99:
> pylibfdt/libfdt_wrap.c:6046:12: error: cast discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>    result =3D (void *)fdt_getprop((void const *)arg1,arg2,(char const *)a=
rg3,arg4);
>             ^
> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_getprop_w=E2=80=99:
> pylibfdt/libfdt_wrap.c:3027:28: error: cast discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>  #define SWIG_as_voidptr(a) (void *)((const void *)(a))
>                             ^
> pylibfdt/libfdt_wrap.c:1163:89: note: in definition of macro =E2=80=98SWI=
G_NewPointerObj=E2=80=99
>  #define SWIG_NewPointerObj(ptr, type, flags)            SWIG_Python_NewP=
ointerObj(NULL, ptr, type, flags)
>                                                                          =
                ^~~
> pylibfdt/libfdt_wrap.c:6108:34: note: in expansion of macro =E2=80=98SWIG=
_as_voidptr=E2=80=99
>    resultobj =3D SWIG_NewPointerObj(SWIG_as_voidptr(result), SWIGTYPE_p_v=
oid, 0 |  0 );
>                                   ^~~~~~~~~~~~~~~
> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_get_alias=E2=80=99:
> pylibfdt/libfdt_wrap.c:6184:12: error: cast discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>    result =3D (char *)fdt_get_alias((void const *)arg1,(char const *)arg2=
);
>             ^
> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_stringlist_get=E2=
=80=99:
> pylibfdt/libfdt_wrap.c:6761:12: error: cast discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>    result =3D (char *)fdt_stringlist_get((void const *)arg1,arg2,(char co=
nst *)arg3,arg4,arg5);
>             ^
> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_strerror=E2=80=99:
> pylibfdt/libfdt_wrap.c:8451:12: error: cast discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>    result =3D (char *)fdt_strerror(arg1);
>             ^
> pylibfdt/libfdt_wrap.c: At top level:
> pylibfdt/libfdt_wrap.c:3018:24: error: no previous prototype for =E2=80=
=98init_libfdt=E2=80=99 [-Werror=3Dmissing-prototypes]
>  #  define SWIG_init    init_libfdt
>                         ^
> pylibfdt/libfdt_wrap.c:9249:1: note: in expansion of macro =E2=80=98SWIG_=
init=E2=80=99
>  SWIG_init(void) {
>  ^~~~~~~~~
> cc1: all warnings being treated as errors
> error: command 'x86_64-linux-gnu-gcc' failed with exit status 1
> pylibfdt/Makefile.pylibfdt:15: recipe for target 'pylibfdt/_libfdt.so' fa=
iled
> make[3]: *** [pylibfdt/_libfdt.so] Error 1
> make[3]: Leaving directory '/home/zumbi/SCM/GITAuth/Debian/device-tree-co=
mpiler'
> Makefile:132: recipe for target 'maybe_pylibfdt' failed
> make[2]: *** [maybe_pylibfdt] Error 2
> make[2]: Leaving directory '/home/zumbi/SCM/GITAuth/Debian/device-tree-co=
mpiler'
> dh_auto_build: make -j4 returned exit code 2
> debian/rules:27: recipe for target 'override_dh_auto_build' failed
> make[1]: *** [override_dh_auto_build] Error 2
> make[1]: Leaving directory '/home/zumbi/SCM/GITAuth/Debian/device-tree-co=
mpiler'
> debian/rules:24: recipe for target 'build' failed
> make: *** [build] Error 2
> dpkg-buildpackage: error: debian/rules build ha fallat amb el codi d'eixi=
da d'error 2


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnNlRwACgkQbDjKyiDZ
s5IqMhAA0k9m1wHhKXsqr5R/Z9D4u9XhKTsp5lX51MFY6jckghSiORfJaWVSddJd
7EdtV+wUtgv6/d9cFE8fkbF+/HSoryQpwfrb/6xQtYczfeNDg5sR07znTsYBLNXT
ljOqgS0VZXWoDmjgQH6j5asuz355zOpGpzQQ5wjz8qdTXQlvEmxk8gzFqrVy5/al
AJ1te2vCT2oIcpVr/5iRGdJFOICQBOzife2g5cXe1OMBReqL10/V0etYkn5Yqq6Q
aEdwFfh6XssS+NXDgddGTtuHdEYHDmtI6FCRCyN9uvxpfY8kUEzimu0Kc8arg78R
buBdLPemEhHMckH4Z1dCRGeSPYwCRGWMigXthgxOyewlEaZhkVirx418ZmObkjYq
+Uq4bDJM8NrbPl513Z8fwZeC9ghvepAeyB93UvrO6bJgv5QnNGkSVqVMOAJ+uI4R
DfOr2ax2bwbPWqKIz0tmRqNnGpImnsopbsl6UWlOCQPErxPBybDUDPNh/3ZTNLYJ
kWyKfrf8xdTNMWBjl1/kFv1ZWUHWK2BsWGGAkcVaPb0LR07YdIUF4HMJjdz9QNJg
CRmHsM0bmcVdEU31P1ZDqk0NGqX3q9W4eydZEj3sMBgQCA3B7AOEA0i1nPl+J65d
sw9OvwcO+jo3PmOmsXfcaEKUant4h8WI5u7nicUWQLKNS6zo4G4=
=IVdE
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
