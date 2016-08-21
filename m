From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [U-Boot,v4,06/13] libfdt: Add max phandle retrieval function
Date: Sun, 21 Aug 2016 11:07:17 -0400
Message-ID: <20160821150717.GY5342@bill-the-cat>
References: <20160705082646.25044-7-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jr/gb2Ce1GM9KKZD"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uY6jA+NdtSfmaLCUCezO1lth6NzzxB54JmQI6C2Pm3o=;
        b=D9MUkPiTojlYgaFY+m5LtLzsdu/VGVpGhaGLPh1eCJdRYJzANwzRV8N+yNhATMKsxP
         R3I7Qh+6HxiVIPtqGj0nICeGeQ04cU0WZZirztaNopK8BHGhWtJksWBrYZgd4gtruMSC
         OHUz+FnQEP/JjkCFfG/0T2R0361VOzsg5M4HQ=
Content-Disposition: inline
In-Reply-To: <20160705082646.25044-7-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


--jr/gb2Ce1GM9KKZD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2016 at 10:26:39AM +0200, Maxime Ripard wrote:

> Add a function to retrieve the highest phandle in a given device tree.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Reviewed-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Applied to u-boot/master, thanks!

--=20
Tom

--jr/gb2Ce1GM9KKZD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXucOlAAoJEIf59jXTHXZSWGsP/2mDNUJIb5ZZoaNQpoctT5QZ
xjG0zyAEGdzjoOcrzMtx6vPAf/uoQLCcrxDbYW/Ndd038oBhl2AeFvA4RlMC5u9D
x7aMPTlz0tV5Z08lRS15vOpY/OY0L5GHOVyimSSZZCa+4KBc0o4ybysQoxZPjNQu
HUqCtVsKaTqPEXc32W5UjDhGekupr5VCeLXATDWvIkyAWR2+q0/kfDddRx+JNGkC
xEULuuLQue3f7j1dumwYiE+U6PHMl5v0aXLtWaqMOAt75FR/rifJAbBt2UPzmYvt
f59RtJU6kOtrDolLha1gEOVcIMvJz+Hdd4zLdoGwiilzhJLhAXcO98J8mkcdEgoY
BhkD3YaC/tDYPTU4j+f96Jxrx3vimo2Xn6J5ORpTMexltes/Pl8r9/Lgcio7M+6p
9NGEoot3CAU501+gp/J/UzzqIR57+m7+r/Bss+GB/dH1en1aOVc3igU0nFEBDCTQ
bIk7ZOnlcl3ZBRol1W6d4tKt+J190zOYmASP1o6uTTccpt29FP+PIWitpcCmGI2W
B2y5Tsq//d3oznV8vdM7LcQPlUXwIp4oAhFqQmmQ7hkAb83v/S+9ojEaWm2NG0G+
j2OxNwfDaSeR9IrzM8GAR8L8Oa0kRzOSXwyiIJ73EVG9DKEKq8bNABvhdOPsgHM4
cJzqjcIvz86rB69fEhII
=AKSA
-----END PGP SIGNATURE-----

--jr/gb2Ce1GM9KKZD--
