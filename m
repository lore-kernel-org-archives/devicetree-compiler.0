Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570698;
	b=VbnJzMTjSB3ZElrDH9HKUoRSEUMXOzc5/DgVKnVbUT3gVLJK9z2dSFHX2YKjuDZM/lWZ
	 gFg6kvOnt5bvhIn86ZWUFP1Uf6C+lGFjFXgRcFxEYIzfdgD3cs+3xDkKF66+UrCkf70lo
	 4/QB0wKMXE0bdd+Sp4EBkE5fLZFSoQCwh+Kc/SH4T6BgjIS9HOIzH7mqNCuRkbzlajsfo
	 XXK6UNn8+vhDUmtY5lpBfdy0CPlGi1XYuQmAZeXkAO5CDoDTeaGAEH1R0fDFNXYyp4SZY
	 9/da+wu6vfyAl5URSrIrF7tEUQckySk33up1oICmyTa+RysX6JobfGwzfm19vI+HJFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Y9FalgqvOBxKMHjv7jEesaNhOq3+IVDOmV3JOVqLntg=;
	b=iYXPTK4vGlWDwY8Xqzwe7mGn+R9BfJKgKI0glEJOobZoUxZEm2Cv9Ty89DSXYlaH7D/E
	 hLWU0GpDELxqY5/ZudX0DWkLOQva/YI8/4S90Pvdzk78LpjTY5KU2ddVBBdn/z02j75ek
	 Eo1qgGwUt/g4MQRR8krz5otNJDbxJMlw66lHtWh6+uzu4sK9cQqK2qqJR3ob2FIkUZEO7
	 pdUjd4TBIOMi0wYcLBmaYCBG+jOISc9MwOjBnTjE87R4zo+UMmjN65WMjRDqtIcjZyNfc
	 CDMBeyBq4mTBsK/M47mqqobc06cLiwK4iKzGsiIaCNFcqph0o4Yf7XiBVYt3PRlbl4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YN6dPr6Z;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB1D606A333
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 22:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CB1D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YN6dPr6Z
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c46bd7a7345so488638566b.0
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570697; x=1794175497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y9FalgqvOBxKMHjv7jEesaNhOq3+IVDOmV3JOVqLntg=;
        b=YN6dPr6ZZFSs7eJDLsE9h0zSl//JghxDFrGD6eR3ERreBvIcAB59YdYjabx96krnVE
         UEUwk9CMvSOoWy2qWa2aehaLnMzjEZOF3eHH3szNy+crHnaJKUWP6xPzirYePJMnXEai
         WvHQhSZpHcC0+vWRrjP2K2Mg05U9nnsQcdbhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570697; x=1794175497;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9FalgqvOBxKMHjv7jEesaNhOq3+IVDOmV3JOVqLntg=;
        b=T6ht/btmi+Tww7la1Uz1YxPNmCoxHS4u8O4HaQqdyGFCKVxZi51n4V9ZBEVKnJydeB
         LZ/BCgmrl4E/kWiMBZPmW26KmhekqkqePgyw7Sk5MAru9miLAukvE0wnUlAn2emLPbMq
         sydoTwHPi5t3SGiwRjo3p+MhtaKVNaAyAQhUvoczjhq5QCjB/ySD+ndyyIl6Tp7/j+ok
         cucaluNgBRXMxGpdyJCuvBxCEDlOPAh0C6FApEkC7mwmg0yvNWAUZbG6+KGc4g6r6xl2
         6BO8ZlL4yqgWyjGyOXIPbBUj6bear3S0+FF5MCG5gqExsOBSdVzhCwcJ0YAkKAp3NmWs
         nqXQ==
X-Gm-Message-State: AFq9FYL9ccPSNztoKdKcuLzXFCLle2fpQ1B+mpCtYxEp3953amAreVxf
	2tFR0FnrCNgqX03zT5qYHXoIi/6F1wujsuaxiM02j9JmlCRU2lhxQD/mBf6f2G30fen0iPaeIsp
	rl9tkkceb
X-Gm-Gg: AYBFou3TEf1tepOzJIPGcPpnU0w98SZz3IyoROx+qcJiOqrHlS8Lls2cS9m7AQ5OqXi
	7lJAMosdfz6Pyh8eO7eedEBmCntLfOozAsQKYf5Jvpuw+McGbgsILeWRnqzqhilsIBBy19HNjyH
	5OOzhxvAtTn2naJrkMc0FRCqEv1ZMjI8WsMOD2OgqluCrKSA9fPBatHiCm9DXCWSnfYMIr9Hrmo
	b4LAl4DyO7Heh6gfqT6J2YoJZFJkwzy7/uoLag8bduRGSciCKiM7mzOOSb2g2Z7SiQfI0jZO8Iv
	0JDZQmBkPjPAu+1/KXccJ2VWN0WgsF8cq1/junQPdhKeDHyqWH7FcQ5Tl61SwTcwoaTlDYiDU3D
	PuSoKtuLQ8E7SuODgotoULkSBgEzPgKnv3L0eNMDh3tWDu3KnDS7FrtM59IirRtr0b+Gp2Cwacy
	GOEDAUfBZDphMHytpMYr3cI72cLAzqe5xW2GmnFPAWKrfCT4bm0Uod+LSdAxvQEzMLsd1eRkBUU
	NU9/n0Jj9Q3NESAxQGcfNhTEr9/fy7kZxme+EX7/QBbMbRnAJ+5aXRYLGhzJWn+jf/99LyJS9hn
	nQZ/rY8xuHf0SgGsViOTXthiiAx0LAZrt51vJx6YtNBahdBwnCgwcyu1MGP8mIqlj50=
X-Received: by 2002:a17:907:84a:b0:c2d:c060:160 with SMTP id a640c23a62f3a-c49d14695e6mr905460466b.25.1793570696645;
        Sun, 01 Nov 2026 14:04:56 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4aa27sm314287566b.56.2026.11.01.14.04.55
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:04:55 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so30644905e9.1
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:04:55 -0800 (PST)
X-Received: by 2002:a05:600d:1a:b0:4a1:d49e:9ce with SMTP id
 5b1f17b1804b1-4aa86e16223mr268350705e9.2.1793570694243; Sun, 01 Nov 2026
 14:04:54 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-4-dianders@chromium.org> <CAFLszTh+c8H6Xcz0LXGjO40XA4=y0jdyAFUr6ygc2OkS9GrHYg@mail.gmail.com>
In-Reply-To: <CAFLszTh+c8H6Xcz0LXGjO40XA4=y0jdyAFUr6ygc2OkS9GrHYg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:04:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U2RO=3bnQayb34+PPD+_PHgeQApVaZv8Y5kc0Ot=O88Q@mail.gmail.com>
X-Gm-Features: AclHuK9dhvNlRKCOtArNyGs4fDmcQo0yhLCkGwe8OeUxFLPcZab45mJ1XIw39r8
Message-ID: <CAD=FV=U2RO=3bnQayb34+PPD+_PHgeQApVaZv8Y5kc0Ot=O88Q@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] pylibfdt: Add NodeTree live tree representation
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, Oct 30, 2026 at 5:22=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > @@ -929,14 +929,16 @@ class Property(bytearray):
> >
> >      def as_str(self):
> >          """Unicode is supported by decoding from UTF-8"""
> > -        if self[-1] !=3D 0:
> > +        if not self or self[-1] !=3D 0:
> >              raise ValueError('Property lacks nul termination')
> >          if 0 in self[:-1]:
> >              raise ValueError('Property contains embedded nul character=
s')
> >          return self[:-1].decode('utf-8')
> >
> >      def as_stringlist(self):
> >          """Unicode is supported by decoding from UTF-8"""
> > +        if not self:
> > +            return []
> >          if self[-1] !=3D 0:
> >              raise ValueError('Property lacks nul termination')
> >          parts =3D self[:-1].split(b'\x00')
>
> When you split this out (as David suggests), please can you add tests
> that call Property directly rather than only going through NodeTree?

Done. Split into its own patch ("pylibfdt: Handle empty properties in
as_str() and as_stringlist()") with direct tests on
`libfdt.Property('empty', b'')`.


> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > @@ -1214,6 +1216,261 @@ class NodeAdder():
> > +class NodeTree:
>
> BTW in patch 7, fdtfactor adds 'phandle' and 'fixups' attributes to
> NodeTree objects on the fly, so they carry attributes the class does
> not declare. Since unflatten() uses cls and create_path() uses
> type(self), subclassing already works, so a small subclass in
> fdtfactor declaring these two attributes would be cleaner. What do you
> think?

Good idea! In v3 `fdtfactor` defines a `FactoredTree(devicetree.DeviceTree)=
`
subclass that initializes `self.phandle =3D None` and `self.fixups =3D {}` =
in
`__init__()`.


> > +        node =3D cls()
> > +        for prop in fdt.properties(offset):
> > +            node.props[prop.name] =3D bytes(prop)
> > +        for suboff in fdt.subnodes(offset):
> > +            node.children[fdt.get_name(suboff)] =3D cls.unflatten(fdt,=
 suboff)
> > +        return node
>
> If a blob has two sibling nodes (or two properties) with the same
> name, one is silently dropped. I checked with FdtSw: with two 'a'
> subnodes under the root, only the second survives. libfdt does not
> reject such blobs and fdtfactor reads input it does not control, so I
> think it is better to raise ValueError here than to quietly throw data
> away.

Done. `DeviceTree.unflatten()` now raises `ValueError` if a node has
duplicate property names or duplicate sibling subnode names, with unit test=
s
in `tests/pylibfdt_tests.py`.


> > +        fdt =3D sw.as_fdt()
> > +        fdt_set_boot_cpuid_phys(fdt._fdt, boot_cpuid_phys)
> > +        fdt.pack()
> > +        return bytes(fdt.as_bytearray())
>
> This reaches into fdt._fdt and calls the raw SWIG function. It would
> be worth adding Fdt.set_boot_cpuid_phys() to go with the existing
> FdtRo.boot_cpuid_phys(), and calling that instead.

Done. Added `Fdt.set_boot_cpuid_phys()` in a preparatory patch and updated
`DeviceTree.flatten()` to call it.


-Doug
