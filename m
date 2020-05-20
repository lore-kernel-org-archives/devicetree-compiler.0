From: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Supporting aliases in PATHREFs
Date: Wed, 20 May 2020 11:04:54 -0500
Message-ID: <8D778C5A-59DB-4649-B5BF-6918603876A1@linaro.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.14\))
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:content-transfer-encoding:mime-version:subject:message-id:date
         :to;
        bh=hXV4NE0HocWQUb5Un4WY7xaQfkTpkROdduVlaOEylog=;
        b=p0Y+fTurnTUDRV4FX9DZTo3Or1g8AYaCU5e95XdfnfkuctBybDeWqmgee3nVXMUBCi
         CNDI/V4j6wS0ePWKKISc8COVjQAHaVlPte14MEr7NznBKxgYTIf8ufyJU1S4/FJNKwb8
         kogA/0AX9D2VNPCm62cb0JFcF+mAr/Vmkq5NwlLnBcLP0ZtUw68fGRccIcqmHxeX6dwP
         a3CJF6RCuQD4ZEOdfF7tEoLbTBTBiPOnTZfYCN7sn0XCv5eHiDce6CeMqQuCpqp5C10B
         jKqRwEVZH4AtAJnOBURnbh9KYlExhbQkVkDk4Y4DCrIxXoKAGCKQsG+Uq2Bkb5RRdyYo
         X0zw==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

We currently have support for referring to a path via:

&{/foo/bar}
{
  =E2=80=A6
};


Was looking at supporting aliases in that as well, so you could have:

aliases {
   aname =3D &{/foo/bar};
};

&{aname}
{
=E2=80=A6
};

As I look at making the changes to support this, had a few questions:
1. So we use DT_PATH_REF in the lexer for this, or introduce something =
like DT_ALIAS_REF?
2. On the yacc side, looks like there is get_node_by_ref() and =
add_orphan_node() would need changing to distinguish a PATH, ALIAS, and =
LABEL reference as right now they utilize the ref starting with =E2=80=9C/=
=E2=80=9C to distinguish between PATH & LABEL references.  Would passing =
a 3rd parameter that is some ENUM type be the way to go here?
3. Are there any other places I should look to fix things so aliases can =
be used similar to a path?

I=E2=80=99m not super familiar with lex/yacc so looking for guidance.

thanks

- k=
