From: =?UTF-8?B?SMOpY3RvciBPcsOzbiBNYXJ0w61uZXo=?= 
        <hector.oron-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: dtc: build errors with swig
Date: Fri, 29 Sep 2017 10:32:58 +0200
Message-ID: <CAODfWeHyJpGw_GxqA6F=w4Fc=1if9-HabUXmSNcbBRKcrk74Sg@mail.gmail.com>
References: <CAODfWeERM-HwcdmsZi+Afo2i5M54rnQk8vRJ_3nOSsC5H0qhYw@mail.gmail.com>
 <20170929003436.GA7712@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=h0Ai3tf/DNjfIIzT4nQLZ74J2rcDTIHsFbAeQuTyFUs=;
        b=d0QvFOy6qNlb5it4dvqS0byY8egjEEgSTcjfkJoeiPoudnEKbjS2lY7eXfjk7JEh76
         S/rQphVEO05AVrOyK6FlHWqJS2PSReqjEfVmi6VMyCwUpzmvrj8TEnCC46231nwra70s
         TJL5398YxXaOkEkBGDiLV26CtA/JNvGytouuHMaoTTCJ9mMufOhkEExP2xMqeGHEbYdy
         /CYtYBfq45iRXMSx30pVtV0QpwWoVy4oYAd+4KhmS+DmZczdhNjLglr5sBsDR4HQWVLr
         ScTR/dhHqLVfoz6C4bOV34ic2QqA3T0NSuGUUfSKrBvoGgSa2LSFXjhlGRcIR8KEVdQf
         5r2g==
In-Reply-To: <20170929003436.GA7712-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hello,

2017-09-29 2:34 GMT+02:00 David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>:
> On Fri, Sep 29, 2017 at 12:28:19AM +0200, H=C3=A9ctor Or=C3=B3n Mart=C3=
=ADnez wrote:

> Hrm, I haven't seen errors like that.  What swig and compiler version
> do you have?

GCC 7.2.0
Swig 3.0.12


>> pylibfdt/libfdt_wrap.c: In function =E2=80=98SWIG_Python_NewShadowInstan=
ce=E2=80=99:
>> pylibfdt/libfdt_wrap.c:2483:65: error: declaration of =E2=80=98swig_this=
=E2=80=99 shadows a global declaration [-Werror=3Dshadow]
>>  SWIG_Python_NewShadowInstance(SwigPyClientData *data, PyObject *swig_th=
is)
>>                                                                  ^~~~~~~=
~~
>> pylibfdt/libfdt_wrap.c:2224:18: note: shadowed declaration is here
>>  static PyObject *swig_this =3D NULL;
>>                   ^~~~~~~~~
>> pylibfdt/libfdt_wrap.c: In function =E2=80=98SWIG_Python_SetSwigThis=E2=
=80=99:
>> pylibfdt/libfdt_wrap.c:2558:51: error: declaration of =E2=80=98swig_this=
=E2=80=99 shadows a global declaration [-Werror=3Dshadow]
>>  SWIG_Python_SetSwigThis(PyObject *inst, PyObject *swig_this)
>>                                                    ^~~~~~~~~
>> pylibfdt/libfdt_wrap.c:2224:18: note: shadowed declaration is here
>>  static PyObject *swig_this =3D NULL;
>>                   ^~~~~~~~~
>> pylibfdt/libfdt_wrap.c: In function =E2=80=98SWIG_FromCharPtrAndSize=E2=
=80=99:
>> pylibfdt/libfdt_wrap.c:3354:29: error: cast discards =E2=80=98const=E2=
=80=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>>   SWIG_InternalNewPointerObj((char *)(carray), pchar_descriptor, 0) : SW=
IG_Py_Void();
>>                              ^
>> pylibfdt/libfdt_wrap.c:1166:86: note: in definition of macro =E2=80=98SW=
IG_InternalNewPointerObj=E2=80=99
>>  #define SWIG_InternalNewPointerObj(ptr, type, flags) SWIG_Python_NewPoi=
nterObj(NULL, ptr, type, flags)
>>                                                                         =
              ^~~
>> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_new_fdt_header=E2=80=
=99:
>> pylibfdt/libfdt_wrap.c:3027:28: error: cast discards =E2=80=98const=E2=
=80=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>>  #define SWIG_as_voidptr(a) (void *)((const void *)(a))
>>                             ^
>> pylibfdt/libfdt_wrap.c:1163:89: note: in definition of macro =E2=80=98SW=
IG_NewPointerObj=E2=80=99
>>  #define SWIG_NewPointerObj(ptr, type, flags)            SWIG_Python_New=
PointerObj(NULL, ptr, type, flags)
>>                                                                         =
                 ^~~
>> pylibfdt/libfdt_wrap.c:4041:34: note: in expansion of macro =E2=80=98SWI=
G_as_voidptr=E2=80=99
>>    resultobj =3D SWIG_NewPointerObj(SWIG_as_voidptr(result), SWIGTYPE_p_=
fdt_header, SWIG_POINTER_NEW |  0 );
>>                                   ^~~~~~~~~~~~~~~
>> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_new_fdt_reserve_entry=
=E2=80=99:
>> pylibfdt/libfdt_wrap.c:3027:28: error: cast discards =E2=80=98const=E2=
=80=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>>  #define SWIG_as_voidptr(a) (void *)((const void *)(a))
>>                             ^
>> pylibfdt/libfdt_wrap.c:1163:89: note: in definition of macro =E2=80=98SW=
IG_NewPointerObj=E2=80=99
>>  #define SWIG_NewPointerObj(ptr, type, flags)            SWIG_Python_New=
PointerObj(NULL, ptr, type, flags)
>>                                                                         =
                 ^~~
>> pylibfdt/libfdt_wrap.c:4198:34: note: in expansion of macro =E2=80=98SWI=
G_as_voidptr=E2=80=99
>>    resultobj =3D SWIG_NewPointerObj(SWIG_as_voidptr(result), SWIGTYPE_p_=
fdt_reserve_entry, SWIG_POINTER_NEW |  0 );
>>                                   ^~~~~~~~~~~~~~~
>> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_new_fdt_node_header=
=E2=80=99:
>> pylibfdt/libfdt_wrap.c:3027:28: error: cast discards =E2=80=98const=E2=
=80=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>>  #define SWIG_as_voidptr(a) (void *)((const void *)(a))
>>                             ^
>> pylibfdt/libfdt_wrap.c:1163:89: note: in definition of macro =E2=80=98SW=
IG_NewPointerObj=E2=80=99
>>  #define SWIG_NewPointerObj(ptr, type, flags)            SWIG_Python_New=
PointerObj(NULL, ptr, type, flags)
>>                                                                         =
                 ^~~
>> pylibfdt/libfdt_wrap.c:4350:34: note: in expansion of macro =E2=80=98SWI=
G_as_voidptr=E2=80=99
>>    resultobj =3D SWIG_NewPointerObj(SWIG_as_voidptr(result), SWIGTYPE_p_=
fdt_node_header, SWIG_POINTER_NEW |  0 );
>>                                   ^~~~~~~~~~~~~~~
>> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_new_fdt_property=E2=
=80=99:
>> pylibfdt/libfdt_wrap.c:3027:28: error: cast discards =E2=80=98const=E2=
=80=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>>  #define SWIG_as_voidptr(a) (void *)((const void *)(a))
>>                             ^
>> pylibfdt/libfdt_wrap.c:1163:89: note: in definition of macro =E2=80=98SW=
IG_NewPointerObj=E2=80=99
>>  #define SWIG_NewPointerObj(ptr, type, flags)            SWIG_Python_New=
PointerObj(NULL, ptr, type, flags)
>>                                                                         =
                 ^~~
>> pylibfdt/libfdt_wrap.c:4606:34: note: in expansion of macro =E2=80=98SWI=
G_as_voidptr=E2=80=99
>>    resultobj =3D SWIG_NewPointerObj(SWIG_as_voidptr(result), SWIGTYPE_p_=
fdt_property, SWIG_POINTER_NEW |  0 );
>>                                   ^~~~~~~~~~~~~~~
>> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_offset_ptr_w=E2=
=80=99:
>> pylibfdt/libfdt_wrap.c:3027:28: error: cast discards =E2=80=98const=E2=
=80=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>>  #define SWIG_as_voidptr(a) (void *)((const void *)(a))
>>                             ^
>> pylibfdt/libfdt_wrap.c:1163:89: note: in definition of macro =E2=80=98SW=
IG_NewPointerObj=E2=80=99
>>  #define SWIG_NewPointerObj(ptr, type, flags)            SWIG_Python_New=
PointerObj(NULL, ptr, type, flags)
>>                                                                         =
                 ^~~
>> pylibfdt/libfdt_wrap.c:4927:34: note: in expansion of macro =E2=80=98SWI=
G_as_voidptr=E2=80=99
>>    resultobj =3D SWIG_NewPointerObj(SWIG_as_voidptr(result), SWIGTYPE_p_=
void, 0 |  0 );
>>                                   ^~~~~~~~~~~~~~~
>> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_string=E2=80=99:
>> pylibfdt/libfdt_wrap.c:5515:12: error: cast discards =E2=80=98const=E2=
=80=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>>    result =3D (char *)fdt_string((void const *)arg1,arg2);
>>             ^
>> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_get_name=E2=80=99=
:
>> pylibfdt/libfdt_wrap.c:5738:12: error: cast discards =E2=80=98const=E2=
=80=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>>    result =3D (char *)fdt_get_name((void const *)arg1,arg2,arg3);
>>             ^
>> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_get_property_by_o=
ffset=E2=80=99:
>> pylibfdt/libfdt_wrap.c:5850:12: error: cast discards =E2=80=98const=E2=
=80=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>>    result =3D (struct fdt_property *)fdt_get_property_by_offset((void co=
nst *)arg1,arg2,arg3);
>>             ^
>> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_get_property=E2=
=80=99:
>> pylibfdt/libfdt_wrap.c:5914:12: error: cast discards =E2=80=98const=E2=
=80=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>>    result =3D (struct fdt_property *)fdt_get_property((void const *)arg1=
,arg2,(char const *)arg3,arg4);
>>             ^
>> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_getprop=E2=80=99:
>> pylibfdt/libfdt_wrap.c:6046:12: error: cast discards =E2=80=98const=E2=
=80=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>>    result =3D (void *)fdt_getprop((void const *)arg1,arg2,(char const *)=
arg3,arg4);
>>             ^
>> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_getprop_w=E2=80=
=99:
>> pylibfdt/libfdt_wrap.c:3027:28: error: cast discards =E2=80=98const=E2=
=80=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>>  #define SWIG_as_voidptr(a) (void *)((const void *)(a))
>>                             ^
>> pylibfdt/libfdt_wrap.c:1163:89: note: in definition of macro =E2=80=98SW=
IG_NewPointerObj=E2=80=99
>>  #define SWIG_NewPointerObj(ptr, type, flags)            SWIG_Python_New=
PointerObj(NULL, ptr, type, flags)
>>                                                                         =
                 ^~~
>> pylibfdt/libfdt_wrap.c:6108:34: note: in expansion of macro =E2=80=98SWI=
G_as_voidptr=E2=80=99
>>    resultobj =3D SWIG_NewPointerObj(SWIG_as_voidptr(result), SWIGTYPE_p_=
void, 0 |  0 );
>>                                   ^~~~~~~~~~~~~~~
>> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_get_alias=E2=80=
=99:
>> pylibfdt/libfdt_wrap.c:6184:12: error: cast discards =E2=80=98const=E2=
=80=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>>    result =3D (char *)fdt_get_alias((void const *)arg1,(char const *)arg=
2);
>>             ^
>> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_stringlist_get=E2=
=80=99:
>> pylibfdt/libfdt_wrap.c:6761:12: error: cast discards =E2=80=98const=E2=
=80=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>>    result =3D (char *)fdt_stringlist_get((void const *)arg1,arg2,(char c=
onst *)arg3,arg4,arg5);
>>             ^
>> pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_strerror=E2=80=99=
:
>> pylibfdt/libfdt_wrap.c:8451:12: error: cast discards =E2=80=98const=E2=
=80=99 qualifier from pointer target type [-Werror=3Dcast-qual]
>>    result =3D (char *)fdt_strerror(arg1);
>>             ^
>> pylibfdt/libfdt_wrap.c: At top level:
>> pylibfdt/libfdt_wrap.c:3018:24: error: no previous prototype for =E2=80=
=98init_libfdt=E2=80=99 [-Werror=3Dmissing-prototypes]
>>  #  define SWIG_init    init_libfdt
>>                         ^
>> pylibfdt/libfdt_wrap.c:9249:1: note: in expansion of macro =E2=80=98SWIG=
_init=E2=80=99
>>  SWIG_init(void) {
>>  ^~~~~~~~~
>> cc1: all warnings being treated as errors
>> error: command 'x86_64-linux-gnu-gcc' failed with exit status 1
>> pylibfdt/Makefile.pylibfdt:15: recipe for target 'pylibfdt/_libfdt.so' f=
ailed
>> make[3]: *** [pylibfdt/_libfdt.so] Error 1
>> make[3]: Leaving directory '/home/zumbi/SCM/GITAuth/Debian/device-tree-c=
ompiler'
>> Makefile:132: recipe for target 'maybe_pylibfdt' failed
>> make[2]: *** [maybe_pylibfdt] Error 2
>> make[2]: Leaving directory '/home/zumbi/SCM/GITAuth/Debian/device-tree-c=
ompiler'
>> dh_auto_build: make -j4 returned exit code 2
>> debian/rules:27: recipe for target 'override_dh_auto_build' failed
>> make[1]: *** [override_dh_auto_build] Error 2
>> make[1]: Leaving directory '/home/zumbi/SCM/GITAuth/Debian/device-tree-c=
ompiler'

Regards,
--=20
 H=C3=A9ctor Or=C3=B3n  -.. . -... .. .- -.   -.. . ...- . .-.. --- .--. . =
.-.
