Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC412931FB
	for <devicetree-compiler@vger.kernel.org>; Wed, 14 Oct 2026 05:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791955359; cv=none; b=RrL9g7/if1Av9HlLGedaZT+SGXbdNao0XE1DMSm871AJKxeUCwt/oOcaS5ZD6WgOe5PvoQACR5j7AnqpbczwJ1ECOXIZdq6y5ihZjzj8CvWuzkc1JOlcLuE1TIYtsTWWQPW6048Z+CWbUbMq0kOg3HdW0z6YYyhflqghcjuRM90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791955359; c=relaxed/simple;
	bh=zpScEIrIC4m9uKqYCeupcU8C+NS4At16LHzqQtiXDwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQUJJKhWBOt3ylAFPRuN2bBGufkfXNpK90utEE26oWul4wNr8PFHcwGUrSLEHR+PTqpc60iw1PN28GWPsA7qUPu8sJ2EDS96wbrKSSEwq2IvsUs4NsNqMtV93BU0wixkER3m5xgiTb/eBSnUjkd3/6p+zkiM9b4nxrT4rmoOHVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=PEnor4vq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="PEnor4vq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1791955352;
	bh=HhDiBF/O1nIiVJyl5gP+TgO4VTSBr2tzJJTkLoWF8+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PEnor4vqiKxaEe10a7Vbwn8H1JRmWz1ewn7bFdJQDLXcZsZXQ0nRWBT4Mb790k9R0
	 NA43DbFSIK8Rz2L3IX7cTlSzc0ZUHIJSon25KodTXlpNn3wVMWAKVfQ74uvFNk9xXW
	 aqVlWVZbPDg5YzsZySGTBbCZ7aMpd1ypSNwtHSFNuVyLLk7jAt9lMd+6XhF3Iudp2w
	 vjKP9mCTJPNTOAQ9cchPy+hdZgcn55ZtTao6Gh61jBaCgKB7QYVY9+mhhruyF5JhF9
	 DQpEcxJnzIfPOmuTAiwOGYdTM6lOzsdbPXnh2kFjHobrxAKg/Wz9+rhp0M6cAsUsjw
	 R/JB18loV3iPg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4j4KMr5PQ9z4wHM; Wed, 14 Oct 2026 16:22:32 +1100 (AEDT)
Date: Wed, 14 Oct 2026 16:21:52 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?utf-8?B?6IOh5pmv5rWp?= <jinghaohu33@163.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: dtc: 5 memory-safety =?utf-8?Q?defect?= =?utf-8?B?KHMpIOKAlA==?=
 reports, PoCs and patches attached
Message-ID: <as8RYmIp0pDCplpu@gractus.seuss>
References: <65dc9b31.9048.1a134c2fb58.Coremail.jinghaohu33@163.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/9VvrPOme0BWRPeF"
Content-Disposition: inline
In-Reply-To: <65dc9b31.9048.1a134c2fb58.Coremail.jinghaohu33@163.com>

--/9VvrPOme0BWRPeF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 06:15:55PM +0800, =E8=83=A1=E6=99=AF=E6=B5=A9  wrot=
e:
> Hello,
>=20
>=20
> I found 5 defect(s) in dtc.

Well, your LLM did.  Which is fine, but *you* are responsible for
checking that the output is not nonsense.  From my initial examination
these look like real defects, but their severity is wildly overstated
to the point that describing them as "vulnerabilities" at all is
dubious.

Maintaining dtc is entirely done in my volunteered, uncompensated
spare time, so I don't much appreciate spending longer on analysing
the impact of these defects than it looks like you spent validating
LLM output before sending them.

You may be interested in:
    https://stuart-thomas.com/research/calculator-discipline/
Another security researcher's reflection on the caution required when
reporting LLM discovered defects.

> Each has a minimal PoC, a reproduction command and a proposed patch.

Thank you for providing this detail, although.  The proposed patches
would be much more useful accompanied with DCO Signed-off-by
assertions.  As it is, they're small enough (at least arguably below a
copyrightable threshold) that I can use it, but I do have to make that
assessment for each one.

The biggest reason all of these defects are only dubiously
vulnerabilities is that dtc is just a local userspace program.  It has
no special privilege it can escalate to.  Now, there are real
scenarios where this could be a vulnerability, such as when dtc is run
in an automated pipeline with untrusted input.  However a CVSS
calculation doesn't make sense without *describing* the specific
attack scenario that's in mind.

> 1. Negative size passed to memcpy while reading a flattened device tree p=
roperty
>    CWE-787 / CWE-190 =E2=80=94 Medium | CVSS:3.1/AV:L/AC:L/PR:N/UI:R/S:U/=
C:H/I:H/A:H (7.8 High)

This CVSS score is wildly inflated.  AV:L, AC:L, UI:R and S:U are
accurate, or at least close enough.  The remainder is not.

PR:N is at minimum misleading

You at least need to be able to run dtc, so AFAICT that's at least
PR:L (indeed it's not clear to me what AV:L/PR:N would even mean).
More importantly dtc does not run as a daemon or network service, so
while, yes, you can run it with no particular system privilege, it
doesn't gain any privileges you didn't already have.

C:H
I:H are just plain incorrect

Again, dtc - buggy or not - has no privileges that the user didn't
have to start with.  Even if it did, the bug in question is causing a
crash, so it's not how where a confidentiality or integrity problem
appears.  It's possible this crash might be chained into an arbitrary
code execution, but that involves a bunch more steps and is no longer
AC:L.

A:H is certainly misleading and IMO also incorrect

It's true that dtc crashes, but dtc is not a daemon or long-running
process.  Only a single instance loses availability.

>    A negative length (derived from the property header) bypasses the boun=
ds check and is passed to memcpy, producing a huge copy.
>=20
>=20
> 2. strchr over-read on a non-terminated property value (alias path checki=
ng)
>    CWE-125 =E2=80=94 Low | CVSS:3.1/AV:L/AC:L/PR:N/UI:R/S:U/C:H/I:N/A:N (=
5.5
>    Medium)

This CVSS is again greatly inflated.  How this comes up as C:H but I:N
and A:N I have no idea.

>    A property value that is not NUL-terminated is passed to strchr() whil=
e checking alias paths, reading past the property buffer.


The remaining three bugs affect fdtdump which is a quick and dirty
debug tool making no pretensions to particular robustness or security.

> 3. fdtdump reads the memory-reserve map at an unvalidated offset
>    CWE-125 =E2=80=94 heap-buffer-overflow read -> crash | CVSS:3.1/AV:L/A=
C:L/PR:N/UI:R/S:U/C:H/I:N/A:N (5.5 Medium)
>    fdtdump computes the reserve-map pointer straight from the header fiel=
d off_mem_rsvmap and then walks it without ever comparing against totalsize.
>=20
>=20
> 4. fdtdump passes an unvalidated nameoff to printf("%s")
>    CWE-125 =E2=80=94 heap-buffer-overflow read via printf %s -> informati=
on leak and crash | CVSS:3.1/AV:L/AC:L/PR:N/UI:R/S:U/C:H/I:N/A:N (5.5 Mediu=
m)
>    The property-name offset nameoff from the structure block is added to =
the string-block pointer without any validation against size_dt_strings or =
totalsize, and the result is handed to printf("%s").
>=20
>=20
> 5. fdtdump walks the structure block without a totalsize bound
>    CWE-125 =E2=80=94 heap-buffer-overflow read | CVSS:3.1/AV:L/AC:L/PR:N/=
UI:R/S:U/C:H/I:N/A:N (5.5 Medium)
>    dump_blob() starts at p_struct and follows tags without bounding the c=
ursor by totalsize / size_dt_struct; strlen() on a node name is likewise un=
bounded.
>=20
>=20
> PoC files, harness sources and patches are in the attached archive, one d=
irectory per item.
>=20
>=20
> On the CVE side: no CNA covers these projects upstream, so the ID
> would come from MITRE (CNA of last resort). MITRE's preferred route
> is for the upstream project to submit the request; if you would
> rather do that I can hand you the completed request fields ready to
> paste. Otherwise I will file with MITRE myself once we agree the
> defects are real. No CVE ID has been assigned yet.

The entire CVE process is wild overkill for these defects.  Not to
mention that interacting with it as a single-person project is pretty
impractical.

I will fix these when I get the chance.  You could expedite this by
supplying patches with actual commit messages and Signed-off-by from a
human.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--/9VvrPOme0BWRPeF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrPEWIACgkQzQJF27ox
2GdCig//dZAoDlxszf5fb0d5xaKpT5D7c21P+JodncICE4jwmENdbeA5L9F1Qzx2
MWfq3MI2ndvgDi1db8LOAES33hSbCp34rHIcg9TR815FcfQj2GHnrFSr8evdNl8/
9F73J6F66wh8kJeNq2ZGkWU+5djKyt7VQNddZmC+I79io63eU/je4+R/MMRXe2J1
69Vpl6LbmqOll3We3tqd+ymSYxeIbPdl+T9xZwBh61JYzkWdHgrA3Zu5PEaQUPq9
Eutc/c3uf17LGn/m4XgREsSpUgDeAoamfSBCOA/65m9ltC++rP6fOGysrNyueCbG
ZoOJc4xNNV40mNyIcDCdIC9VtUg6uj3tC9zoqj2ooXp3ldiZkzEwF8Q1CBN5fNoK
3A3bNbb9VFLkixbH5+ibVeEg2mzQoQTklmzZ0nLgbLHzHq3gVY1ophuTgOEwyLtw
3QEsff2o8QqReGtcBpXG0gvGXhvXDjRHnyYzBpSNlGf2iTtTcY3heddlIxBLuPZP
MZGgFv+8PK7wiI/+m7433WboWxxOUIHsYQltyO4cgWg7Uu/UmhDg3DhC7T7xAcEb
RxTFlzcgdQ+Bev+ULBLlzkBidm8cnqoaw71A4iESEjdXnWU3fC21Erj9U+4AFKM4
7an+PRI1r/TFFgx8RERhjBzLME63o1y1nbHrOMJ+FFLWJZ4KB1o=
=Kqbs
-----END PGP SIGNATURE-----

--/9VvrPOme0BWRPeF--
