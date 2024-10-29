Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0191DE3B7
	for <devicetree-compiler@vger.kernel.org>; Tue, 29 Oct 2024 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730206973; cv=none; b=ZRZ0WE9WUd9hvGhxQU/Gas1mbf0gJE7/LV4M+aM9m15OaqgqR8l6QgtGiuWaivjBCOqTnYniITp9z4+2Iu8wRY1c33kUa+DYg9kEq+XsuyjaZXvwri0LWY+F/pwkAesQ8u25ge0ZLcptAcw2nw0+MmctYlAs02kROccoeMOmD9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730206973; c=relaxed/simple;
	bh=IRoMnCrPKgDNQl/fx+DleBgEnNDrv/L0aGV9ACRJCeg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HrcI6oXvbqw5eABB2m/MbnkXf6rJRrntruUEh/M2pfWcyhXI7dvip1OXCq86WlRgTw5nKPN/I4HabXTTb5MAX0j69nCUSWMmShtUu0ql8g/UuuQTZhzeKwgfI5TWrfUK+9LvpWFY9iB0LZg1RQTy4eSCtEZ4JuLHSMqUiEwmQSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=THAJWVmH; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="THAJWVmH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1730206375;
	bh=2c8Vtu35HNC/3kwMq8yxR9mfWEOmECpwBxWDWlkQDYQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=THAJWVmHwy2reb4MJts6lzzws5xKXMO/elbkw9gDGZIGrytePA6wL6w7mxh8VbK0C
	 e8i4ZSWX3tG1OvipAgwVOw2322TosQCMAcMB3AFmNQmt7MntdfQlKcpqLhyCDoTROG
	 fTaXag00SB185Re28n++65NGOAS4g045PfG5YlW4=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 9BB8B1A3F67;
	Tue, 29 Oct 2024 08:52:54 -0400 (EDT)
Message-ID: <fc3dcef2676252484cfa427ad0197cd9aa697420.camel@xry111.site>
Subject: Re: [PATCH] libfdt: Fix build with swig 4.3.0
From: Xi Ruoyao <xry111@xry111.site>
To: Rudi Heitbaum <rudi@heitbaum.com>, u-boot@lists.denx.de
Cc: devicetree-compiler@vger.kernel.org
Date: Tue, 29 Oct 2024 20:52:52 +0800
In-Reply-To: <Zxzh0ODFyZnav5JE@74d70d9af7e3>
References: <Zxzh0ODFyZnav5JE@74d70d9af7e3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2024-10-26 at 12:34 +0000, Rudi Heitbaum wrote:
> Call SWIG_AppendOutput instead of SWIG_Python_AppendOutput so that
> is_void is handled within swig.
>=20
> Link: https://github.com/swig/swig/commit/cd39cf132c96a0887be07c826b80804=
d7677a701
>=20
> Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>

Dtc is a separate project at
https://git.kernel.org/pub/scm/utils/dtc/dtc.git, so the patch should be
rebased against it and sent to devicetree-compiler@vger.kernel.org.

> ---
> =C2=A0scripts/dtc/pylibfdt/libfdt.i_shipped | 6 +++---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/scripts/dtc/pylibfdt/libfdt.i_shipped b/scripts/dtc/pylibfdt=
/libfdt.i_shipped
> index 56cc5d48f4..e4659489a9 100644
> --- a/scripts/dtc/pylibfdt/libfdt.i_shipped
> +++ b/scripts/dtc/pylibfdt/libfdt.i_shipped
> @@ -1037,7 +1037,7 @@ typedef uint32_t fdt32_t;
> =C2=A0			fdt_string(fdt1, fdt32_to_cpu($1->nameoff)));
> =C2=A0		buff =3D PyByteArray_FromStringAndSize(
> =C2=A0			(const char *)($1 + 1), fdt32_to_cpu($1->len));
> -		resultobj =3D SWIG_Python_AppendOutput(resultobj, buff);
> +		resultobj =3D SWIG_AppendOutput(resultobj, buff);
> =C2=A0	}
> =C2=A0}
> =C2=A0
> @@ -1076,7 +1076,7 @@ typedef uint32_t fdt32_t;
> =C2=A0
> =C2=A0%typemap(argout) int *depth {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PyObject *val =3D Py_Bui=
ldValue("i", *arg$argnum);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resultobj =3D SWIG_Python_App=
endOutput(resultobj, val);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resultobj =3D SWIG_AppendOutp=
ut(resultobj, val);
> =C2=A0}
> =C2=A0
> =C2=A0%apply int *depth { int *depth };
> @@ -1092,7 +1092,7 @@ typedef uint32_t fdt32_t;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (Py=
Tuple_GET_SIZE(resultobj) =3D=3D 0)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 resultobj =3D val;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 resultobj =3D SWIG_Python_AppendOutput(resultobj, val);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 resultobj =3D SWIG_AppendOutput(resultobj, val);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0}
> =C2=A0

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
