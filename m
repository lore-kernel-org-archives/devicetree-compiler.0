From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RESEND PATCH v3 1/3] libfdt: Add function to find regions in an
 FDT
Date: Fri, 6 Jun 2014 00:12:36 +1000
Message-ID: <20140605141236.GA25412@voom.fritz.box>
References: <1395500836-12735-1-git-send-email-sjg@chromium.org>
 <1395500836-12735-2-git-send-email-sjg@chromium.org>
 <CAPnjgZ0ehgSd1WprpMd1ZY=LaZaKkBG3MaNPV5ja27Q2p12WvA@mail.gmail.com>
 <20140502054014.GF6035@voom.redhat.com>
 <CAPnjgZ2OHco3GjH_rPC+7Fu36QqBK2_sWvcaF1WOWFpBNkZTcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ2OHco3GjH_rPC+7Fu36QqBK2_sWvcaF1WOWFpBNkZTcQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 02, 2014 at 09:12:55PM -0600, Simon Glass wrote:
> Hi David,
>=20
> On 1 May 2014 23:40, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Thu, May 01, 2014 at 09:13:51AM -0700, Simon Glass wrote:
> >> Hi,
> >>
> >> On 22 March 2014 08:07, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> >> > Given a set of nodes and properties, find the regions of the device =
tree
> >> > which describe those parts.
> >> >
> >> > A test is provided which builds a tree while tracking where the regi=
ons
> >> > should be, then calls fdt_first/next_region() to make sure that it a=
grees.
> >> >
> >> > Further tests will come as part of fdtgrep.
> >> >
> >> > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >>
> >> Have I sent this to the right place? Any comments?
> >
> > Sorry.  I know you've resent this several times, and I've been
> > procrastinating about it since forever.
> >
> > Basically, I'm just not convinced.  For all your efforts to explain
> > the rationale, it just seems like a really ad-hoc set of flags and
> > conditions that doesn't seem to form a coherent whole.
>=20
> Are you referring to fdtgrep or the new library function? I'd be happy
> enough getting the library function to start with in if there isn't
> much need for the grep utility.

The library function primarily.

> > From the lack of other responses, I'm assuming there's not really
> > anyone else who sees it as a compelling feature either.
>=20
> Is there normally a lot of mailing list traffic for new libfdt
> features? This is used for verified boot in U-Boot for example.

Hm, that's true I guess.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTkHrTAAoJEGw4ysog2bOSId8QALAVUZrK6DQ7wAhtqf5IXfxq
4cpSqdyK6nYyBOWxNqCJB27lYXA5bZ9m3zyPKFpQCIFzA3RsuNnYMqrSRTctpLpf
5t/vh8n1wDTdcubyBXrSTRWAtwtnzXNNHbHP4waTTuIKm/mo4JjonLDl4hWID7aK
TgJaUSerbSH9/m/ZlECLlOu0822bHirATW2tBnKcfyqk+QvmjkDJZl81sISsCEJk
Dlt98XFyyXWdHGfuxq0uU135ZgYeE7Jdba/GMxVdBpqYgj6KbLe1k18XW6q/e/fa
fv4W9TsrjS9amNX1zDHErrsC/vuJ0AiEYAndFlDdEy2vuvYEk5irf6g0JRn5SumP
h5E1Q06eeHs9xwse2lAK1FJ9fDR0GYZSO1d7A5w2tukbDkqtmC5ogueBhVQ1fMn5
7xSZETc7ehinV7tcJL6T0vETRz8XEfIwCItOxHxwVssc3TR/51IiVT09QlvXBA88
Su/M9o79iUI71Y+7YOVDy7KaqthiyqCZYtPeaXOyXGL91ScigGRboqwLTqBo65F8
FZRPmRq76lPJhbNizv2I+0j+4rhX+5rRdOm+//iELQmJAknr6RQMINI61StXjM80
exA2JyryDMwBzPif3gpHAwY9loyea9O2OgqCr1iyppBPUiakNIV57bcCI1Ox5vKq
OEl/vBjo3yguTIBBXyy8
=1tmd
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
