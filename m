From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] fdt: Add a function to get the index of a string
Date: Tue, 29 Sep 2015 10:32:41 +0200
Message-ID: <20150929083241.GA9460@ulmo.nvidia.com>
References: <1437045021-4549-1-git-send-email-thierry.reding@gmail.com>
 <1437045021-4549-3-git-send-email-thierry.reding@gmail.com>
 <20150929055446.GQ19428@voom.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=BU1ugIOk0ffAZ4iH8SIK2QtA0RvERUO7NiTVf6oWFlA=;
        b=K4niB5/vvXaj4YRjvlaBGX+/YFEcYVC/CcByCl08OnrCjd5mSKzlot0AArAL+DGI/y
         /V96Itk7biA/QV5AfB9VZMsSjLVNpudLe4oiTiy7nfSkU7YD4i7GQW9a4gb52u7JpeaR
         wGmQUGuvMGw5TzyNvAPiov1z6zxer+U9yBdmU9Lnuho4yJoJKpjQ5xGh6rAG323xwAOE
         CzeSDI3pMBj+mB00L8r2LtRlZa8ZVKVE3WRXc6Mz/VeV12Dp5LTpo5wklR8/rQDvqgLz
         gAn27zon5oAqlWV2sr/mwTb9RZDfdQJX+WbTE2y0PwMH7ZBFaQ4HR9mF1Lf7DCQNIJvL
         dRqg==
Content-Disposition: inline
In-Reply-To: <20150929055446.GQ19428-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2015 at 03:54:46PM +1000, David Gibson wrote:
> On Thu, Jul 16, 2015 at 01:10:20PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Given a device tree node and a property name, the new fdt_find_string()
> > function will look up a given string in the string list contained in the
> > property's value and return its index.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> This also looks good, except for the name.  I'd prefer
> 'fdt_stringlist_search()' again to match the existing
> 'fdt_stringlist_contains()'.

Done.

> Speaking of which, fdt_stringlist_contains() could be reimplemented in
> terms of this function.

Unfortunately it can't. fdt_stringlist_contains() doesn't operate on the
device tree node and property but rather on the raw stringlist itself.

Thierry

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWCkynAAoJEN0jrNd/PrOhSnYP/AzitJMa8lYpKnr2RGsPD5s4
VPzE489DYYrJxATHimhoKWU/ozpaiT07HmTa8B0j6VSEHejjLy+3qm1kMhr/yPU1
otfC2ro7Vq44BKFqjjcS9yLn0/oJ1G9qr7epHYo3O7J7oo3U0pJbc0ikkO7cjDTS
rFziAJF5abDaQGKOyOuPFCy4db3AR3hSN5nFsVEbH+elDs3JJpkCrdT5BzHZ6fBn
5Oj36DhANK1EvTgx20F53si+n2bs6iuZ4FM2yQozLcxRsahnebvHBHm8K9ReXMAL
1tjpwjgg9W62Hi3SvHzHBSyCyeVcoURORD4nuxcsgq0QN2/b3g0ZZ/h3pXcOC+TT
Wvss265L9Y3LZse86awtrAGKmIfj1JfOBULCZRG2LYDeidJqx48XytGQtGNf7OIi
VhVCOx9pBHysttW+Yu9F/ybegnD8o0uKaEi8Z7yUmFWSALx6lwFjszst/RPn/jgX
jEgu7oVZ9OmjM42gvV/i7T5CHZug+ijPdZoaZy4wA+ID2FVSZB1pMWxLMV2MbkSv
jESlVrbr8zNgnaTKnkS4W16V2Px/cl9I3YeyZZoe9XfYBAnLYgtLhRyw35CSAz75
nEEc67YJUboOvOnEa+x5/4p4gYUwKsrqagFYWOclC8r1NA5nI4PQlmL1IgStmJh9
xxEmvuuyznYxs0nSP9ib
=dYqF
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
