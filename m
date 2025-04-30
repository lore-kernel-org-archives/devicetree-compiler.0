Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CA11C2437
	for <devicetree-compiler@vger.kernel.org>; Wed, 30 Apr 2025 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746025826; cv=none; b=Ens7gAxnU82GaEuWHGPA0vzGUOZXFMxelCE1DDUWeCmNopgsDqdqTjS28q3ZedlVmvISOB3AqXfmRZ9RikDbaugVcUKyeKLGF3ZouJGiPKKBIQbHTkAqQimt/b/FPOXWf2BCSIba7B13HqTgpelvlNVCiR19szzwB6Ce5bN/kew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746025826; c=relaxed/simple;
	bh=lZ3FYX95GcSiP3ip2j2hpgNJVAocrskxd902yxkkVks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q5BA2PILKaZkcr/y+oMWVDhwgfJskW5bkWC+fVCz9wY8j1sZ/1RKtGpjNLipJgsTGBko7cHqgnQIJIizc8G7G5o+j6qKaZQRLrvZ1hI588AR7xfXiIatTUGek4B8VOiB+mym5h+nZm19OxvT2e3d1ZZ0Fbflpvk5Sg6hjO+Zz74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AU0dW8Wj; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AU0dW8Wj"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so84986d6.1
        for <devicetree-compiler@vger.kernel.org>; Wed, 30 Apr 2025 08:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746025823; x=1746630623; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lZ3FYX95GcSiP3ip2j2hpgNJVAocrskxd902yxkkVks=;
        b=AU0dW8WjgcANKJrIU3CT4Zs1gk2fQgG4Ya9qo9/Ge3IMWBA9KA2kpesE5JQ/kjcuBv
         7zbrGYMDqlmor5Ex3wh5FvCbpHMd7ChEdExkKgVhC6dm7rE+cow37OesY0/uYGw6CWjz
         MK7d7taQpoTjzNmSMAWBXMDmYCG6jvNydikI4TQzySpYAsUbRuNzOlJxdP1WFRyYCv5C
         ffRUQL35nigspWB11yKcVIv3RlK6YxGgs259+ZTrbEZzBLxGB9MMN5j6ZD8oQTzHOCq6
         YNRE24qVkZG/Q1/IMzGDMnT7mhDEZkVDNm6woycOtnHuL/BQnOYXfr86a02XTPy6Zi85
         TY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025823; x=1746630623;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lZ3FYX95GcSiP3ip2j2hpgNJVAocrskxd902yxkkVks=;
        b=rjivWWYjbKapj2GsrgD3HiexDvWqkqBKN2+xNvOge+nxrje1hsSKIQUYTzwOnM/Kjt
         g6wkNx3fiYuy1kzVYU8vAwTJYgXXgaOJBg1gCo2fIhyBwjaRtuRxHtKdpsNdmnsN6uy1
         +vMXeIcQb2wDOexZtzJ7SKvMhcBIuSqbs0BnQf9CjeqZOCq3oV0BOf/4gqOPzUqfWTB7
         jkbFilkTVE8hwwWg2ySuQ8ZxiTWs3jMwS1HapOE/Wcxl2VnrWdrOvIK9JnYlWLx7HhSf
         INOWbNA9LtZVlT3o5RvkVRbh7UYssBwX9gf6YNvq+uTKGfPsGFUrwIVqkSp+UF1tKRZf
         jlWg==
X-Gm-Message-State: AOJu0Yz3lXaD4FN5WDLwYkFe2Jn/4NopsqKuIg+BLLYpV5w8nXKybvkk
	UVjEfFC+HCkGy3KYG/7g/Nnu9KmDCM12bWgRcb81TwsrZfFVK+1VhplaxA==
X-Gm-Gg: ASbGnctpWpk7ERESpPuIRTWXmdOK4UTXK1bXaoTMuIPJytlpR4Ja8LOpNzDyAiq3A78
	X4ioMbzHjTVZth2FSaS9rI8Zd2PiUmrub0+6cvEay3zY5aBnOgH6TMhlVEjwWq9iKm2/r5tdOtS
	GMc9FRnQHLHbtNLEJf5pvf/CVOcPeMS1m/HXGloQ0nThEN1HoLi7PD4M833D0qhQGuab2k2pz2y
	FikuCZMv/nsL2eyemyB9ljshfY0gniInQ16yw8VVBZyq9G4g2nqCh9ftq9RyI/XwCj9uvkLdGSU
	Bvz5/aXN1pzxEBZVfBdMgbXeF5P8V0SMvseOuhmpx7QowBWUEkRCYjG+8UXZEt8v1w==
X-Google-Smtp-Source: AGHT+IGVZnNZ4pX+OE5sPIiJ1N8ygIxrlk6jASMOoPXIKXpdFRK6pw8xMW1e+8ol6nlFaeQn3heDVw==
X-Received: by 2002:a05:6214:768:b0:6ef:3de:5ff7 with SMTP id 6a1803df08f44-6f4fceb431bmr58418716d6.15.1746025823118;
        Wed, 30 Apr 2025 08:10:23 -0700 (PDT)
Received: from ?IPV6:2603:6011:3f0:6f00::12ac? ([2603:6011:3f0:6f00::12ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4fe6abeaasm9214836d6.10.2025.04.30.08.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 08:10:22 -0700 (PDT)
Message-ID: <4abaf886-440f-48ec-b133-899111f3aec2@gmail.com>
Date: Wed, 30 Apr 2025 11:10:20 -0400
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Makefile: deprecate in favor of Meson
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org
References: <3a024c31-bdeb-442a-9eab-305c0d8fec41@gentoo.org>
 <20250429014241.90681-1-eschwartz@gentoo.org>
 <20250429014241.90681-2-eschwartz@gentoo.org> <aBI6EOjA6OYOz8oA@zatzit>
Content-Language: en-US
From: Eli Schwartz <eschwartz93@gmail.com>
Autocrypt: addr=eschwartz93@gmail.com; keydata=
 xsFNBFcpfj0BEADkTcFAwHJmtXbR7WHu6qJ3c83ccZl4qjBsU//JEn9yTtfj8M2a3g+lpGAF
 C/8isGz9InmrqBn1BXQFwcySAkRYuromR5ZPH1HIsv21RTtJbo5wCs8GlvoRYsp5pE7JEIVC
 RsWixG5pFhinlssUxtm0szlrzfaKanohWDfj+2WuWh4doXJZtTQePCGpouSziButkwkgQMqE
 U+ubBiTtjF/f/oCyC6YMWx+5knaqNSWxjF52rXAngVD0YYAiJ7o0KOQhrC2RLF+l0x4hRikp
 QaZrqVL1CaP7gjceOlOZ/zdCOImAaha9ygZiJG652HCIPfsy7uypYwxoMEeldoTnsXbjJXuL
 fMwIp8dCVbKMhebXdCNIWCjNewusz3I4+JjOO+uPgA+YgHu8+A56tpJ7lmHw5C95XjheXt/N
 bo9HONG4oeILZ9pQxnx93ocZM6v0W+taoBbPzOLE0al7Oy5vmJwO/QkprDU/TkzPtrgiCKPV
 Ml/+smp5FXbOjp/Y5UVlFmj2aemDIVAv70RlewAytwQLdGHLv3Au81hq5xrX7JAopEkfhYJY
 g2+7s78C0VaMPXHw2XyLpj5uPBR2q8KihSaASfhGBH0IcxLd+lEq1+NHT2l/WlQVjRfXHZns
 k8giW8M12TJZvvm9rpXMAFk7zSmmojp1M/7+ImOTcDYvErW1iQARAQABzSRFbGkgU2Nod2Fy
 dHogPGVzY2h3YXJ0ejkzQGdtYWlsLmNvbT7CwZQEEwEKAD4CGwMFCwkIBwMFFQoJCAsFFgID
 AQACHgECF4AWIQS9J7B6XvRcKtr3DgSEgYpoGa9KmwUCYstIWwUJEUVkngAKCRCEgYpoGa9K
 m50AEACoEoXaBaVerjTGbezOHK8J+GWkDJQ8wetJJfHhBgDq/lypKF+1LmolXAkmJF29ShBx
 r9zr5n91E1xn4bX53X8NdVAf2r/dFMtzlu0jsl0UcZ6OllpkTBtWqbjNgAI+C/v/lbBVcCz+
 irtrRfM/guLNaaUuZlh+Qtt4kdKygP64jhqRude/eD0tAVzXbnka0k2E40dNT8W23SPnbjJh
 gpZeGeufIf8xFddDdLaqZMuxjDcxqq1jcasPB8M57Vkt5NpTaIvCtO4ZWejoj9im+Onsdvfs
 3mCHr1DcIEAYj36/2U8yXzpsdgFXD96WcLFRL3l4ELTAPua3MFNdty6Bf35Yli1Fby4yOnf8
 5UQd4SRh1pYqBoBw7uEtY8qOJR+bvqo2XnTrR9HVYBZVrVhFe/CCSxOfm2ZxZn2bzMzoJZ5X
 jcMNGdkHVcutvgJOIUASnwSoJM4hoVdwRmGgrT1Mu18rkk05+NjElPmGcn9vFZXVddnqvuqd
 gf4di2xl0adpWgFFSfKeOBjNcPSQqNLjNcJTGVJ0lvlmGcYfyw020IoGu/bBEUpQA12i/4JE
 N5Qx1frWsvXQ+ioJkFsjydbpWqLR5xI44p1FWU2lwKT4QbtSkgx9sHOec+DIIarwxqDiMXR9
 ZhG/Ue7+pXAVD/Zs/XtxXCZQBhl7keIXTmZKTccuYM7BTQRXKX49ARAAo1bWz1d7RvffuaX9
 SAOqQEfeEHaRilIKpqU5+yuBSd7vLNF1QPb105cuMJtj0bHhQnqYlToNODAHn9Ug+Axgz3dT
 +s8j1/mizFLfgpHnWdNr7/a1lMPhmPqtoeEdUAd0bqX94xHedZBtlvhLAwoelNhatJkqbrWc
 voI9d3RMLA3tPrTxY6aeDTa+5LL8oHeZ04KXlWxQIqxXT+e0JEs+0V9viicYy/8i4DqfObtr
 jdNOV3cKCW3rmNTATlVmciGY8xHkwM77C67ibFyYOdoYo6IP7EUI1oTBZN1M2A23sSgUlAHP
 qPFwD38JPiBLYu5pIA3SwDaatTD/+BEdhsiIQsZaWsn0E98Bb0bHfukMvEYFEcwA//HXTVIN
 SGry/Tc9baIgD0hG8ImDCbR9RfXdz0uzelHypcKGnGB7FLtZ8Vw4swa06CXEGG0Oo5AfYRuU
 2bQtFxH66xHEFSfgfpTy5nHTH9Ra1mTtpoDil6rMLq1q43w5XP7oEucZwdZa+hlj2M4I/i+I
 gcaU+Bd9bQMa2mmvmI7pOFMxCCvprY5fDaRY1v8rKWRg12bD4kYM3npR37rWkk+Zdj+w+XgS
 oCW0gNT2yHDDMq7H6qYUjyvaG8l0vhWb44rzQLBFfQv/Lc3QI4jUu6e7TbQui3cw5Qn0E+yu
 4teV2fIVDbLB8wvRS/8AEQEAAcLBfAQYAQoAJgIbDBYhBL0nsHpe9Fwq2vcOBISBimgZr0qb
 BQJiy0j1BQkRRWU4AAoJEISBimgZr0qbjUwQAL+qByV+VpVmD3Guqym9uUX/gUmLdLar7ZrM
 Nr3RnDo/N0Dl2IZpm+eoNGlnBh2+q6bcZUWWoEtbOoy6XrlPnx3Cf+Bg4bFDNN4ibIQkYV2z
 cU9E1AWadCKUm1Z2eDqjc5TlLZiyUGQUh4kAW2Z3gFe1ffhyKarVExfTSxwE1ec5Q9cy6T29
 iO3QjAD3v7R9EXZJIn/RRbsaWQSQLz+DVDZxjy2XcmTGLS3HMIqdYFHYAxUx7HLbCAhfIyD0
 TDsMOutl3B2PWENYWmhO6E+USSwPokx461ePqcYG5haqnoUcXGQ2SGtLaoQ2iKGvGAe17xpQ
 yHK7NGSPWOEmYSJ1bRFJYKoe8+jtesoEY335hyQRn7RbMvTslVUvtVjRYu4FXOwPXT3NLbj8
 v+in+Njm1UfuWvOZS695wepBGvDtMM3Ze+ZRB3S7zmo1/eKol1cQQ/abYlX+7TrUbxcQ+bAQ
 b8PeDaL4sAH77fE6m+3jsMb1CFbN3+LcaUxGV7ysh7kVYVqwhiRqnmF0E3I9z3nyZ9HQgwHt
 1jmoa4lMiRDnkkOFdhoJ3vqmxHKW9XtxrUJlLQfTejUSooLFjNe6tvXgrTvrosGTpDZIIT0/
 8qKt4Nxg06u0jmnXMbbWwoPNWl9PfcPtNhjaycocCzfog5LI8N7HbRy+jHmArWAywaZVLrLe
In-Reply-To: <aBI6EOjA6OYOz8oA@zatzit>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HbdehJQfAbh6E86scLcaQwhx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HbdehJQfAbh6E86scLcaQwhx
Content-Type: multipart/mixed; boundary="------------rFquz6BjRTTMdzax9EwGNv90";
 protected-headers="v1"
From: Eli Schwartz <eschwartz93@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org
Message-ID: <4abaf886-440f-48ec-b133-899111f3aec2@gmail.com>
Subject: Re: [PATCH v2 1/2] Makefile: deprecate in favor of Meson
References: <3a024c31-bdeb-442a-9eab-305c0d8fec41@gentoo.org>
 <20250429014241.90681-1-eschwartz@gentoo.org>
 <20250429014241.90681-2-eschwartz@gentoo.org> <aBI6EOjA6OYOz8oA@zatzit>
In-Reply-To: <aBI6EOjA6OYOz8oA@zatzit>

--------------rFquz6BjRTTMdzax9EwGNv90
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4/30/25 10:56 AM, David Gibson wrote:
>> +$(warning WARNING: Building dtc using the Makefile is deprecated, in =
favor of using the Meson build system instead.)
>> +$(warning )
>> +$(warning https://mesonbuild.com)
>=20
> For succinctness, I suggest:
>=20
> WARNING: Building dtc using make is deprecated in favour of using Meson=
 (https://mesonbuild.com)
>=20
> Note that British/Australian spelling is preferred for this project, he=
nce "favour".


Yup, sounds reasonable. :)


>> +$(warning )
>> +$(warning Use `meson setup builddir/ && ninja -C builddir/` to build,=
 or `meson configure` to see build options.)
>=20
> I'd prefer to suggest "meson compile -C builddir" here, rather than
> directly invoking ninja, and I'd also like to list "meson test -C
> builddir" as the replacement for "make check".


As you wish, of course. But note that "meson compile" is a dispatching
command that first checks whether the build has been setup using a
non-default --backend option instead of the default ninja:

- Microsoft msbuild
- Apple xcode

and then determines which of the three to run. So if you decide to run
"meson compile -C builddir/" it will just in turn run, on your behalf,
"ninja -C builddir/".

It also has the side effect of, if your compiler is MSVC cl.exe, loading
vcvarsall.bat before dispatching to ninja, as a workaround for

https://github.com/ninja-build/ninja/issues/1610

None of that matters for dtc, I guess. :)



--=20
Eli Schwartz

--------------rFquz6BjRTTMdzax9EwGNv90--

--------------HbdehJQfAbh6E86scLcaQwhx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEEYEETBMCdNmKDQO7/zrFn77VyK9YFAmgSPV1fFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDYw
NDExMzA0QzA5RDM2NjI4MzQwRUVGRkNFQjE2N0VGQjU3MjJCRDYACgkQzrFn77Vy
K9bQGA//S6T2TlmY92Eba0aryKgKbpfWTzsQMBTbconeB7itOsyJ8pVfPpLwEP7q
B2wuyXK8prdjNQblGfAwflMbzTjmP6KIijJizoWFm6dU5WOsZ1Jpmv/0ObUOE+dw
6Cndvk/hApifWS2LRAr28uEVQLSIiTGT77aQc4laHWVzK2m3m3J2LbuMT+KM7EGx
1ERnZcOWP8b7MpaIIxB5mK5j1BNIGZuKN+xucdOCXId9UFV49xaiGEamg5Wt1SLV
7bc1f0qglQSeAddq8FxxMHkYbYc2rOUYdndbipLIK2gdxhH/NDDq+ZXWmonKOXHX
T1wPCZzi/qH4XEQ7mVjWNoyJdiUuAIpFLixoL/+fNeZ+qfvUJBFDwtlT0qufe8L7
OxRkmPCNQZeoZKoURwpDQgYFiAj8aqxa5d7cLGZ+MC79g4uLHeKsGLPmKh5+3hwv
orb2o6M/tGzCdX/KyXsnrGn6G9iPWgoxpCF8xhg+i0cIg9ow3vioHUV/OZVC2Hjs
pKK2rcaUfxYLxkxvIls0BUSp236nKYi+IwJzr9xVvmN4I2/nTjsV0dIJkoG+ItpW
5QcYEbTrA6rbi9YSrP6HLl3Qw3fhBr6PIx6/wiQwHb7/ZkyhSZvHV6G0YZug/gDM
nwfdA89sACmaJVcSiy5x0iO3kFYy0IG/6FK3xKYlYg60CS0Yvs8=
=GwZh
-----END PGP SIGNATURE-----

--------------HbdehJQfAbh6E86scLcaQwhx--
