From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RESEND PATCH v3 1/3] libfdt: Add function to find regions in an
 FDT
Date: Fri, 2 May 2014 15:40:14 +1000
Message-ID: <20140502054014.GF6035@voom.redhat.com>
References: <1395500836-12735-1-git-send-email-sjg@chromium.org>
 <1395500836-12735-2-git-send-email-sjg@chromium.org>
 <CAPnjgZ0ehgSd1WprpMd1ZY=LaZaKkBG3MaNPV5ja27Q2p12WvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iBwuxWUsK/REspAd"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ0ehgSd1WprpMd1ZY=LaZaKkBG3MaNPV5ja27Q2p12WvA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>


--iBwuxWUsK/REspAd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 01, 2014 at 09:13:51AM -0700, Simon Glass wrote:
> Hi,
>=20
> On 22 March 2014 08:07, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > Given a set of nodes and properties, find the regions of the device tree
> > which describe those parts.
> >
> > A test is provided which builds a tree while tracking where the regions
> > should be, then calls fdt_first/next_region() to make sure that it agre=
es.
> >
> > Further tests will come as part of fdtgrep.
> >
> > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> Have I sent this to the right place? Any comments?

Sorry.  I know you've resent this several times, and I've been
procrastinating about it since forever.

Basically, I'm just not convinced.  For all your efforts to explain
the rationale, it just seems like a really ad-hoc set of flags and
conditions that doesn't seem to form a coherent whole.

=46rom the lack of other responses, I'm assuming there's not really
anyone else who sees it as a compelling feature either.

So, sorry.  For the forseeable future, you'll need to leave this
implemented in your own code, using but outside of libfdt itself.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--iBwuxWUsK/REspAd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTYy++AAoJEGw4ysog2bOSmxcQANqLQP3R9RnkjONNlBy3XEWO
ZbxY/OVfOe1SWSa5KIaSJ2hO6dRrKQW2jLFWaCCeQZxGs41oVuqp9/4opU0i4b6V
5GaHEDwZC0O3YIMpG+KDEWEXxzMCLy1KZ8tdxcSvBbEhMCL6FQfdzQ3y4Yg8Lwsw
RqiDzErsWt43XWr49TO/t2Y9kMkpGsiw2wNqyljLUgobakvgq9W43h6y+05d15wi
lg82XO+yxXcW/xlDdg4eeBqsKLlSacQp5HOCDFH1NRv02KbrKWvA33GcXG3zCarX
+w9O3Aik5/veayH6voEpQY6cvaRcD8VweeNOSPXReAvcwoeNYBzr65JTXOhK3B4g
TJHNPZi86uJySRsQlH0zmR1+YAIKye+V5TVXYtVa1XgFa6jMi2OBIMk57Ub3+qPY
z4jrxCLWHISxk9sTWHYQlB/oMVsHPjL9nAbUq21R7wyN5OFqef8+cWV0m3mvRhFG
B8tO8dXx1aYGxm+AOEBGSfNpVnWjV45x4BZAGtNsMbyv++NNKNu+nW9Y6mnZwGzq
oq+JfU1gDfxKXoPTmIEWGLgW1mw0tTOtr4g2hBu8Pyc7ry+I59FgiR5wiWaX+/Wa
VlaNe6iV8M5bqYgkH8KJ++K8a+5263PolfPsfNR6FolVmGwV58KAEqtIOHq7rFrK
NHjA/FtWXkSNQMay1OEY
=/0Be
-----END PGP SIGNATURE-----

--iBwuxWUsK/REspAd--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
