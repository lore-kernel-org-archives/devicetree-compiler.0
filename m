Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793256276;
	b=GWBC6GRQRRed6LNcZr+1DpE+KMndQifHI961/FwQHkoGMKouP8x7BLztnioOcmCD6M8d
	 Kn6IXzUbKdXyvhixZUrsfB2W33+xr1AwPMrPOmmCEVJygaKkGPeVulVs2m9FAdyyT8IzX
	 0AK91Z/GN/xQX4/+AqD8k9xLU9RxCZdBHEWfrc6Cwlp7Fotexj8ghuzD5UGK49FKzQMux
	 U3+l3tcDQ73NwdQ7pYjOG7D9KDgw5Lgly/xWvaL0iPP4wwNf1Z9a3S9KUZ1IvyepkyRvC
	 Rx2PBBiv4fLX+ATK+0naQJd4n3MOQF+nY/PejYfLB6qo/Yy2TZDU2YfFnJO1ST+XOYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793256276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=E5q5GbjnzNeJca2k+ps4k45zFBbkB2aTb6nCq5G4cfA=;
	b=hb9agbjoCEIO9853LMJVgBG3zhnEvWOL7Qe8ejayfQCGSk9GmYbpZX7MprCfgh1bnMvg
	 SzDxbdB0+PowkFJmt2EYYuASj17A0Woxq7N0a9h6m9aUAlZItNhC2UbKEpNTSDuFjj1gp
	 +zQWU9cXT1Xm1dul+nmgyCl5jhMDmqFk3qrQwe+qNi272qZf65YuHVHUEjImDJKtVsmjd
	 mdqhJJ77vB33OJosgSpQ9SWkDRRIlUBLqO2xArLWuKdP+Q2Hr1i13I9pSd7dFIyFYjg57
	 J6m/xPjOqCyaWgD7Be+lnDHviNL0WvBkE2fUBzEY61iIBgzBmz7kLbKtdsm7L1tOYhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nGY5WFgT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687AB606A31A
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 06:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 687AB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nGY5WFgT
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b488586facso2298486a12.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 23:44:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793256274; cv=none;
        d=google.com; s=arc-20260327;
        b=pib/L6+3c5kvND+5z0EAp6o9JkAgrI1RACtNkxtJWKZuJ37XV3AuLyxK8ZzKaXV7Zq
         XcNeo17b3v0zrGFL0gUljKPObUoS5enHrwH8jaB8eZnsezZYOKEOtqQ/LHa8piM2iSSJ
         sn0lVdTKVU3icX2vgmMpdrDwt000p6Gkhs8KqMiOYSeVdTw9p4Gl83m3SjKQsReM7AEB
         hhuKyrxkXLPCdZmUDNKy+8HBNkW8W3YwgA/rE6hzCk39x5Ygk3lSR5uSngbCoXXUbOmq
         P88nppdKQJ3ENuftXI5lTwc0+1EtEy/jHVaq5XuDCHpxy0eTA5+XEL2iTqDLOo7J3d3X
         fj0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E5q5GbjnzNeJca2k+ps4k45zFBbkB2aTb6nCq5G4cfA=;
        fh=gCkX0DFO0uPG2nDY4Gx2aY8hcTnR/3hPeKFQT4zo7q0=;
        b=dt62zJ8KY7Fl9nFfR7KEHmlPmRUK5zFgaU2eb02J0x5U1858leYLaeKq2x5V2g+lAU
         5p9IOVadTVsQnqJDE6Iy5jCoYRI2eDnLsarjR9ECJvn1+rwKkGIu+kY4NQRe/RVU6yOa
         0+600lBUGHH9dR2xwjX1TfQeHT+d0IvwrDXUS9Wkln4Qk6BSgiKfusmbcOOp9h1nCaoB
         rPwPK12d9atL16zdvHM6v0YQyba8Urk9mfH5RwLkrKt2e842AAIZYGju70YORmVK8qRc
         +eou8Ri9Qaw0ndzbpsPbNnbiqw8x+f1kETMVk0icrPokg326csQgB2WJZV5jHx5+d9s6
         USug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793256274; x=1793861074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E5q5GbjnzNeJca2k+ps4k45zFBbkB2aTb6nCq5G4cfA=;
        b=nGY5WFgTldQde3x8sFQlzC1yJvqJhVFJzvgWhTGfbgTrKhn5pzzxUhL23UzuLZQsRS
         q4rT8nMwJlcvZ9bXdqXmN/WbY5R6w48YckWjuKUZFY7lCalLQg738gW+1NDeTfl4dAwk
         cM3XNtBiscNNMoov7LaZLdtt9ZwKoyWG5uQ+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793256274; x=1793861074;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E5q5GbjnzNeJca2k+ps4k45zFBbkB2aTb6nCq5G4cfA=;
        b=HeT0LSiLkps2GQigl4c15N3gZK7He4PNX5PkMffV1dl6hMXltk7upCthWBamSCSL6c
         KplSP/bngEVnjKfQ290JQZaaxaiZd1DrmWgEvH3fOICBLMj+vOnga0ROfjVGvKvoEyrW
         4IsmpFgCVUFykxMnPQISxcvw07udkXDGy0npvFRuXDUP0zq9UD3qtBeHcZaEdHLjgSIT
         B6dSpxZttH/WyxfqZzgqBWY98fOpquQpa4/mtWHt33ceW1oSnnWsfqb8cDy3+vRpeqSa
         rg1HGolvnvFoEuE3sPNtnbuW2jKxpHoZ1ZK49mxy3URGhROXiU4ut3Hmn95KqPbZEps+
         nmTg==
X-Forwarded-Encrypted: i=1; AKwUvBxnquEHToo32DYmzYTkkiiX9bjqjgfZwYZQwM0tbNl3Ybu0E3UVS1v9YBKGbJvTvuotWt69ACUzk+AJ0kBQxUuon8NX@vger.kernel.org
X-Gm-Message-State: AFq9FYJFsgmUNXVnKx4W7Uc0u5HyPZ3D/JSOcrnHS2IKz+QpROBlZTGJ
	WNq3mZOnU3U75lv5F1hpWw1ccqCWXPHRMWLgyD1sM3BiHzVu9sZ7kn6TGqM5eYhK1gchGdHCHMO
	VqpHrfKw5BN8Y9Lkl1qBP1VUk3If9vN3Nyi0cd/0tvMsYq850f/qO2xAV
X-Gm-Gg: AYBFou1X15HmMgyZ9MF/smXv+RATJez8bVe1H9Yb27tn3HVHDpg5D9owAojjapRcy1z
	+tUpzpbaAKvQpl6tHdiPst7EblnOa0Qo/Fq6LFqUfqxehJk3MmKz9lcsv+oSxCXNc1PT7TCsVnO
	iJDp60AshEUpKCgBydFWWhtl8VI3/WWNhJz8J1sjDkVy41ctOW/vo1BEK4Yw8gob/AOiFXIIBne
	aHmUakUbpcy9N3HEHgFnZ+fMeroKtqB4XBySyvyenChmvAdh5GnkpFESxQDMUhFEoWXWThzksMo
	36OG2P8uHS2p+tnpw3QjGArleNVN0BMbKedErgPwpj9AWTngLol8e5y4xMzrQSwUxjzl+1Ld75f
	mwIZMTiGBtUAZ09siS71gOsz4Y7/wDNWkp3k=
X-Received: by 2002:aa7:d48d:0:b0:6b2:4dc:8348 with SMTP id
 4fb4d7f45d1cf-6b49cbceb09mr2324773a12.15.1793256273702; Wed, 28 Oct 2026
 23:44:33 -0700 (PDT)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028073440.3327687-1-sjg@chromium.org> <20261028073440.3327687-2-sjg@chromium.org>
 <20261028211449.261fadb5@bootlin.com> <auKqW836NgeMQu9L@gractus.seuss>
In-Reply-To: <auKqW836NgeMQu9L@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 29 Oct 2026 06:44:20 +0000
X-Gm-Features: AclHuK83-YzLF0Gcb6aAxLPk92CpYhVrPPPvh-I240axokEvQEk0aGwJ0snnfHA
Message-ID: <CAFLszTiZyCQbUPzv6hxo4VdTG=xtwbOjOYt0nhLtZFfOUdOPTA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] fdtput: Require a leading '/' with -p
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Herve Codina <herve.codina@bootlin.com>, 
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David, Herve,

On Thu, 29 Oct 2026 at 02:07, David Gibson <david@gibson.dropbear.id.au> wr=
ote:
>
> On Wed, Oct 28, 2026 at 09:14:49PM +0100, Herve Codina wrote:
> > On Wed, 28 Oct 2026 01:34:17 -0600
> > Simon Glass <sjg@chromium.org> wrote:
> >
> > > With -p, a path which does not start with '/' is created from the roo=
t,
> > > so a mistyped path silently adds nodes at the top level:
> > >
> > >    $ fdtput -cp test.dtb foo/bar
> > >
> > > This creates /foo/bar. The same happens for a path which starts with =
an
> > > alias, such as serial0/sub, which creates /serial0/sub rather than
> > > adding to the node which the alias points to.
> > >
> > > Without -p, fdtput rejects such a path, since fdt_path_offset() treat=
s a
> > > path without a leading '/' as starting with an alias:
> > >
> > >    $ fdtput -c test.dtb foo/bar
> > >    Error at 'foo': FDT_ERR_BADPATH
> > >
> > > Report an error with -p too. The next patch allows such a path to sta=
rt
> > > with an alias.
> >
> > I would reword "The next patch allows" using "A future patch could allo=
w" or
> > I would simply remove the whole sentence ("The next patch ...");
>
> As a rule, that is a better way of phrasing a commit message, so that
> it doesn't become inaccurate if this are reordered.  In this case it's
> not worth a respin, though.
>
> >
> > Indeed, this current patch can be applied without the next one.
> >
> > Other than that:
> > Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Thanks both, yes that was better left out.

> >
> > Best regards,
> > Herv=C3=A9
> >
> > >
> > > This changes the behaviour of -p, so a script which relies on creatin=
g
> > > nodes this way must add a leading '/'. Do this for the existing test
> > > which relies on it, and add a test for the error.
> > >
> > > Fixes: f807af192828 ("fdtput: Add -p option to create subnodes along =
entire path")
> > > Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> > > Assisted-by: Claude:claude-opus-5-5
> > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > ---
> >
[..]

Regards,
Simon
