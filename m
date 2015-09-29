From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/3] fdt: Add functions to retrieve strings
Date: Tue, 29 Sep 2015 11:10:16 +0200
Message-ID: <20150929091016.GC9460@ulmo.nvidia.com>
References: <1437045021-4549-1-git-send-email-thierry.reding@gmail.com>
 <1437045021-4549-4-git-send-email-thierry.reding@gmail.com>
 <20150929060041.GR19428@voom.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qbvjkv9qwOGw/5Fx"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=V92qr/95ix0Z259YGcFZnEDMPO3/nSqWpp+z33kHU+0=;
        b=BghpclGFNKwgfOLAIR/L5vI1+q8Uazp+2i4bmzORX4HUUDf3eU+wnKWpa8PJTU7v8s
         zMjR6eLvh9CK3LgAP8gccZpufLpOH/3C3k02ud4eMRFPpYDHIu+nnv9gkzVcYiqsl1C+
         9lbvqLGCyN/gVtSIEeBi42w8YFdchdafXcvKvcbx4YLb1f6GqAybR2kvupyWeyiiSnCt
         Y2HiqLA1XmUOCkfGEvaACaDBmb/2YppUhaEKlrCqEoMEhYWNsuPdkCR3L0IlIXfcwbSm
         syWNAO3GqDCuwk7fFwUuOIcqT1Jn66UCh8BBeMcUa0QV+iappbyoeP25yPlftVaXRWKt
         TFYw==
Content-Disposition: inline
In-Reply-To: <20150929060041.GR19428-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>


--Qbvjkv9qwOGw/5Fx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2015 at 04:00:41PM +1000, David Gibson wrote:
> On Thu, Jul 16, 2015 at 01:10:21PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Given a device tree node, a property name and an index, the new function
> > fdt_get_string_index() will return in an output argument a pointer to
> > the index'th string in the property's value.
> >=20
> > The fdt_get_string() is a shortcut for the above with the index being 0.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Changes in v2:
> > - handle non-NUL-terminated properties more gracefully
> > - improve documentation
> >=20
> >  libfdt/fdt_ro.c | 37 +++++++++++++++++++++++++++++++++++++
> >  libfdt/libfdt.h | 41 +++++++++++++++++++++++++++++++++++++++++
> >  tests/strings.c | 32 ++++++++++++++++++++++++++++++++
> >  3 files changed, 110 insertions(+)
> >=20
> > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > index 39b84b1cea60..4315815969b6 100644
> > --- a/libfdt/fdt_ro.c
> > +++ b/libfdt/fdt_ro.c
> > @@ -593,6 +593,43 @@ int fdt_find_string(const void *fdt, int nodeoffse=
t, const char *property,
> >  	return -FDT_ERR_NOTFOUND;
> >  }
> > =20
> > +int fdt_get_string_index(const void *fdt, int nodeoffset, const char *=
property,
> > +			 int index, const char **output)
>=20
> So, once again, I don't like the name.  I'd prefer
> 'fdt_stringlist_get()'.
>=20
> I'm also not 100% behind the interface.  In libfdt so far, we've
> mostly avoided the pattern of returning just an error code, with
> actual data returned via a pointer parameter.
>=20
> It's still a bit ugly, but to closer match the signature of existing
> functions like fdt_getprop_by_offset(), I'd prefer to see this return
> the output string directly (or NULL on error).  Then add a *lenp
> parameter which will return either the string's length or an error
> code.
>=20
> The function is already determining the string's length, and there's a
> fair chance it could be useful to the caller.

Sounds like a better interface. I've implemented these changes and sent
out a v3.

Thanks,
Thierry

--Qbvjkv9qwOGw/5Fx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWClV1AAoJEN0jrNd/PrOhVk0P/1+QFXVdGnlQkv5Tb/Ouzoz0
Kjx59CrcsOCF2QJn7uaP7Flo7OyVk84m83RSnSMkSe1nJNnSkqHH+kI9vHPvtcy2
TmXL07JO2GQMWotw1wdaX+LKmyOhiD4wVNwF8AZPjHwnz4wXhHkU9zcW9YGtaYnf
qzlxdTptXKHvOMkSJ1wfTPaPYo0UDuNPvMEpWvHKWXyImx98eZ87PMEQVihTkebR
hGOghw+ppg4sTYTgw7mQL8g8lqKWxWvrgsabU/+uxWw5ULc+ZJWYHmyC58aFvRsx
ArMQTehlxhV/MCdbgvuGDqnxaXrI3IcF0p/ocLHycI1CM2l+6eHT0GCTTE0u/L9u
HKbA2x0MaBZWT6q8KLZD0uyqhTzlx58Ljo4i+A668Eq/A5GHdMgZT/Lcl82+uD03
abV4DiV22xTC+rMW0/4a1YDh44d/fSxReBqSp3xypTjzOXhAGIrtplXbJFploHxE
Wn1JK6Gvag7pRI/SpY9zbi6mMSNVeQE30he+WPYwRAmFAiOAiyH5OtRra7vofW3A
v7VyPut4B+q2FCTybSwReMFS1Arjc24FIgONBF66mtzBnHso17yfOLdRAZL8MPRF
2Sw/qKhSm3qTQ0Qv1hlBla7bS519CV7XrI3es3ZLg5TAPNGKl0NEeltz0okse9x1
oTsC6WU7kMZ5/K9NpCtQ
=kdk8
-----END PGP SIGNATURE-----

--Qbvjkv9qwOGw/5Fx--
