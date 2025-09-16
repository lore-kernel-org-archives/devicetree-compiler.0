Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1077A2FA0F5
	for <devicetree-compiler@vger.kernel.org>; Tue, 16 Sep 2025 10:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017712; cv=none; b=CIreWORkeIF8lCpGoHA74xzQA6h5dH6e721HQdovAWybxX7dmvxcjLRvKRdxoI1dLOzYdFo4dLixFdMAJ/zi5O3+ZMGZ1DqLj4XPlvJUCNoopg0I7jtm/dYQE0A0IMYdk4L6+fzrzOBYm9Efbgme235Biuqdaq5rjJBpgyBpdZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017712; c=relaxed/simple;
	bh=HROZpllWSaMccM/VLWuB0kpy0TJhHwHU9kTqwzxCWc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jIUA/AzCTl+tf6jrLX+Lm1zrLX1I5c3XBBl+FhZiARD+crYHhfpuDNmnjbMIP0MSomCcrEqQXf6cKbNX5ic/V4JirRclp67pWoBqhlUyT/WViA/58Qswe8Lq0mpUiO1SnzTxP8RZOKB9lVbI5Cc0hKDOa/FzNBEayIusMewH4A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5449432a854so2428415e0c.3
        for <devicetree-compiler@vger.kernel.org>; Tue, 16 Sep 2025 03:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758017709; x=1758622509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yxShZZXYgWMyGx047XJbFO5W2W4XcJcCx4gW4jVWvk=;
        b=rk0/Oj5dEABEMCTtgOkasTtTWWzeJuwip4+cVRXMCDYcByqNvXLEWS6wCSCLE9WIR9
         FpXjCM8hm/cvAK2kEzjJTErdgLjFWvDF2JEFeioRBSUzLp1g/Sg6zBO0v7+UmRI4l072
         DOKjwW/qhbxuKzlubQ9zMframOtmKEe9/AxiksojhYISAWzD0zOyVtd5IqylZur1YVH+
         fxwZDpuHfvm5TBE8XCcvomBHq+QTxHIQYHOTvyXhMs09WwXi0LxDzp8V9Ykkn/22yneD
         RkHyDR1t1ni7yq5RTwCPJx2W6YGvHHM2uWz9wJz273EZ+JlxIpBgPyCBk/GJMZNZFp1J
         +/Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXBv4VhPXqwjE63cJSEc3tZqiqHCHCRP+OPDGSdyeJm6eMsR8AeEiLRVs6MlgaYmTKY6IeR42q73Y9Xy1uAUgC4jS+3@vger.kernel.org
X-Gm-Message-State: AOJu0YxcQ3t70jAeGEjTK4Wmj6gf+H9s5+O9dTMrWY1IW1iSJWaiMwh7
	4dGLk53cZvD1QxlkMJIXu6PnJTHglMa830a3JlzUeeuu9PvSZJgJb30K7KuPHNQY
X-Gm-Gg: ASbGncvZLRPxIr6h5+UYDU12c1Afb/1pxzIwIj8R+yi+q3oD3+1uXFNtHRaBbVDhlfw
	3hSnKbNpx/E2yQTMbB7qQGSsJ8IOFQeQGa+Ep3StdQsetQYtHEQ8OlsYK9mY7o67N+hAK66Zj4S
	pYIwXs9Pr0K1qUejDdIAkj+JaPbmMhfSNhlQ3GYV9p2rSxB9o4ClQST8j1u+Kl1rJuOkKB7kA1o
	0AAk7zcDMR4WTRYwyoehrL+0Otz/IPWzXaEXVWJLRnCDn/gemHxY12gKC13LUJ7WpyoH5NbH58A
	ucgHMA+nM1N9xVv6SAgnZK6ix2dHyiXouxPyKOq9AP9ynoU+N3VjlY/ecNfttATRbsSbDIox2HG
	LJG/aYobgdkHzQFTtUwSmQFSXG2a+o9w8RlXxtU4BsKR94EqTnEppsUGwM+Tw
X-Google-Smtp-Source: AGHT+IEvJqYhTXk3MQO6Bdy7BjCY+Fwe5i90ZQUw2UQGKrDpE+LltCZKSXx4CqAn0D4L8F+HPqRbhQ==
X-Received: by 2002:a05:6122:1d48:b0:545:eca2:1c63 with SMTP id 71dfb90a1353d-54a16c87ba5mr5584450e0c.9.1758017708726;
        Tue, 16 Sep 2025 03:15:08 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a0d40b63bsm2645526e0c.22.2025.09.16.03.15.07
        for <devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 03:15:07 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-557a2ba1e65so3575177137.2
        for <devicetree-compiler@vger.kernel.org>; Tue, 16 Sep 2025 03:15:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDWlaA1PY481PQ/rkZq0KGLpYYnJzf62SN/2pL2yMeLMjJirLx4gsi9QNhpAzZRulalJspnRiZm7qYVN+QfU249+bu@vger.kernel.org
X-Received: by 2002:a67:ff90:0:b0:569:1c73:46c5 with SMTP id
 ada2fe7eead31-5691c735ffbmr267311137.2.1758017707282; Tue, 16 Sep 2025
 03:15:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902105710.00512c6d@booty> <aLkiNdGIXsogC6Rr@zatzit>
 <337281a8-77f9-4158-beef-ae0eda5000e4@beagleboard.org> <aL5dNtzwiinq_geg@zatzit>
 <20250908145155.4f130aec@bootlin.com> <aL-2fmYsbexEtpNp@zatzit>
 <20250909114126.219c57b8@bootlin.com> <aMD_qYx4ZEASD9A1@zatzit>
 <20250911104828.48ef2c0e@bootlin.com> <aMebXe-yJy34kST8@zatzit> <20250916084631.77127e29@bootlin.com>
In-Reply-To: <20250916084631.77127e29@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Sep 2025 12:14:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXXi97HN-G_Ozbs7vc141GmbMTPD6Ew6U_0ERj5wh6gvg@mail.gmail.com>
X-Gm-Features: AS18NWCbl1r2QYO00aPBgisYLqrkmJmQ3Y4JYZGczVS7GzKJm4yKut71Lemfvns
Message-ID: <CAMuHMdXXi97HN-G_Ozbs7vc141GmbMTPD6Ew6U_0ERj5wh6gvg@mail.gmail.com>
Subject: Re: Device tree representation of (hotplug) connectors: discussion at ELCE
To: Herve Codina <herve.codina@bootlin.com>
Cc: David Gibson <david@gibson.dropbear.id.au>, Ayush Singh <ayush@beagleboard.org>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Jason Kridner <jkridner@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree-compiler@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Davis <afd@ti.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Tue, 16 Sept 2025 at 08:46, Herve Codina <herve.codina@bootlin.com> wrot=
e:
> On Mon, 15 Sep 2025 14:51:41 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
> > On Thu, Sep 11, 2025 at 10:48:28AM +0200, Herve Codina wrote:
> > > From the addon board point of view, the only think we can
> > > say is "me, as an addon board, I need a connector of type 'foo' and a
> > > connector of type 'bar'".
> >
> > Agreed.
> >
> > > Also, at base board level, statically defined in the DT
> > > connA is described (type 'foo'), connB and connC are
> > > described (type 'bar').
> > >
> > > The choice to map connA to the type 'foo' connector expected by the a=
ddon
> > > and the choice to map connB or connC to the type 'bar' connector expe=
cted by
> > > the addon can only be done at runtime and probably with the help of a=
 driver
> > > that have the knowledge of the 3 connectors.
> >
> > Agreed.
> >
> > > I have the feeling that the choice of physical connectors to which th=
e addon
> > > board is connected to is a human choice when the board is connected.
> >
> > Yes.  Although if the addons have an EEPROM, or some other sort of ID
> > register, it may be possible for some connector drivers to probe this.
>
> Right, I think we agree that a driver is needed to help in the mapping at
> least when multiple connectors are involved.

I agree you need a driver to read an ID EEPROM.
But why would you need a driver if no ID EEPROM is involved?
If the connector types on base board and add-on match, it should work.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
