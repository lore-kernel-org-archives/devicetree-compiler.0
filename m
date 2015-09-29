From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] fdt: Add a function to count strings
Date: Tue, 29 Sep 2015 10:32:55 +0200
Message-ID: <20150929083255.GB9460@ulmo.nvidia.com>
References: <1437045021-4549-1-git-send-email-thierry.reding@gmail.com>
 <1437045021-4549-2-git-send-email-thierry.reding@gmail.com>
 <20150929055313.GP19428@voom.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=ifpqYFXaBQhuSM7MYtk4mt0DcfpfNYUfAx4jT5H55AU=;
        b=sYi0Z76m09qYUnS0dpWnx0/4Husucl58zsUoRfiflhwr/0Y7qsnQ7xOzJpI1ZmJOhR
         3B8dqK1zZde1op+gZC3pOVNZtt+qwWhRbZAcTXIyC2gob+P1pKZ6OTQzALwon6J91Eha
         BAVwsNZmrnknSuavPp/HXIp+MO1RPPES50gen3i8+6eKa3jMf5IEg6PkuDbB20j8jO3O
         xVxZdHStMveqtIhmGC6igdO9x16ouPB9CtBDIIVW0aCnu6JlzifXlxqmtURSiC3aSNsS
         XpQqfgydlNGeZdos9Ws/JYhzpIBCx2ec2cMtkdXW2l380xJZOA55dlWIpxYtgOILOp6l
         Ar+g==
Content-Disposition: inline
In-Reply-To: <20150929055313.GP19428-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>


--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2015 at 03:53:13PM +1000, David Gibson wrote:
> On Thu, Jul 16, 2015 at 01:10:19PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Given a device tree node and a property name, the fdt_count_strings()
> > function counts the number of strings found in the property value.
> >=20
> > This also adds a new error code, FDT_ERR_BADVALUE, that the function
> > returns when it encounters a non-NUL-terminated string list.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Changes in v2:
> > - return FDT_ERR_BADVALUE error code for non-NUL-terminated properties
> > - add tests to cover non-NUL-terminated properties
>=20
> This looks good, except for the function name.  I'd prefer to see it
> called 'fdt_stringlist_count()' to match the existing
> 'fdt_stringlist_contains()'.

Done.

Thierry

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWCky3AAoJEN0jrNd/PrOhbKcP/1/p2LWgu+TDf1VSTd9VCBTY
6nxVL/aB8zdExT6PSs+cPY5q3fcum0ZyWcRlxTBPtMVG5pRe7suagaxBlKfMaw3h
D1ZdguJ8HySO25T+irk8bbIqngnbQ5nW9/KAlMUHeYZRrFCaqZk3o/OcLyZzbFuy
B4p+o83kLH+ItiA0f1lQ9lncAWVYxC4qwZ1flUty6hzN2wOLCpaUJJEEIDjjeJdW
1AMEXvU6mmX4odWOOC4BhnNd8yZy7Pk9UCGUT7xSH24+V1wrotMnOKNDLv06XNTw
1gy49ys3NOSYZVVBBR5HNwiiwivHNfcE0/Vm3DvnphxR5DdNjIPCjG+dfTDSoQBd
h4O9TAFSsTpe+sHDqWinQFU0vYQ5z3uuEwYnjTWbNG9ytcvciSSuEPcQcvCm1kcF
0DSw854EUS83wpNp5cLmp4qbDZ9gl/P6w0IDasw+08NfLQa3z7uelUZQRn5PLgBv
BN1iQHTNn6/iE8Tm+7iaOCAgqR5JnSUCv0eqtyp+aQhdR9rlf9e7BkQW3kRr+j8P
3cJT4UkWg2y6WKSYtRB6ZKlzHy2JR8WqjdlqD5ZrEM/dzqJRsWcpi6ST9D9lZrxd
zMbTjVp4g2tT1OPBC4iq3I6TUeRjUElnAcAa/oTQ4AmdQXk/7TD/9Svb5gzfiHt6
utSlOstIaZtSMw5rOzLk
=uVT5
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--
