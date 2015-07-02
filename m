From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: fdt_path_offset_*(): Fix handling of paths with
 options in them
Date: Thu, 2 Jul 2015 17:16:56 +1000
Message-ID: <20150702071656.GC12246@voom.redhat.com>
References: <1432213252-30292-1-git-send-email-hdegoede@redhat.com>
 <20150529122605.GC3664@voom.fritz.box>
 <55696C37.6090806@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tqI+Z3u+9OQ7kwn0"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55696C37.6090806-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--tqI+Z3u+9OQ7kwn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2015 at 09:52:23AM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 29-05-15 14:26, David Gibson wrote:
> >On Thu, May 21, 2015 at 03:00:52PM +0200, Hans de Goede wrote:
> >>This is another approach at fixing the issues with paths with have opti=
ons
> >>appended seperated by a ':' character.
> >>
> >>commit b4150b59ae ("libfdt: Add fdt_path_offset_namelen()")
> >>
> >>Is related to this, it allows the caller to specify to only look at part
> >>of the passed in path. But as experience with using this in the kernel =
has
> >>shown using this properly is quite hard since the options itself may ha=
ve
> >>a '/' in them, also see the comment above the new fdt_path_next_seperat=
or
> >>helper this commit adds.
> >>
> >>So this commit, which currently is being used by u-boot, instead simply
> >>teaches fdt_path_offset() to just do the right thing when it encounters
> >>paths with a ':' in them.
> >
> >I dislike this - it's building into the core path handling something
> >related to how external things happen to glue extra options on there.
> >
> >I also don't see why it's necessary.  ':' shouldn't appear in paths,
> >so why can't you just strchr() for the first ':', pass the first path
> >to path_offset_namelen, and the last part to your option parsing code?
>=20
> When I wrote this (I was a bit slow in submitting it upstream)
> path_offset_namelen did not exist yet.
>=20
> But more importantly the Linux kernel is also doing the handling of ':'
> at the same low level, see __of_find_node_by_path in drivers/of/base.c
> in the kernel, which is the kernel equivalent of fdt_path_offset.
>=20
> So to me it seems best to also handle this at the same level in libfdt
> rather then expecting callers to deal with this, as that will lead to
> more and more callers needing to be fixed when the same construct gets
> used in more places.

No, sorry.  It might be used in several places, but it's still a long
way from being universal enough that I'm willing to fold it into the
core handling.

A helper function to handle this case, I'd be happy to apply.  Folding
it into the core semantics, no.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tqI+Z3u+9OQ7kwn0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVlOVoAAoJEGw4ysog2bOS3iEQAK9eSTvzMCER+trodeH/KFq7
ni8/Mxyxeq7oJ+nGcZ8RrBAQK/+3Hww8RX5fR+EYv7CRjv+HPMhKZ+WbDDXTrd7G
tItYRSJAHFoJMzyOePe767GuYnuGq/9TCw9YY1HlfsA7NOFYA8yEjtlZ+RAiY2vZ
0BFPKAJi1duWN/6xhxnHILVrxnb+R1d5qf4qDt9Y6ujho0nHb9iuHtyi/YAylXwl
gZi0ds9cdcNRaikYzt9hKGzo6VmG3W8gJuEGAv6h8NW0u80fQcfNawb1er6MQHut
J74gCSSdJXOaS3vo2rt5R2Hh1rtQQJ9SNCwJ9gMsqCdZb7Y72Uc/d1cLsujkMCv6
d114e3CNKMlXzJ9iPq4rV2yC1zKDVMFYNUxo17wlKxusD6R5G0hTmy7F16xOEGTC
lt47aNdjP56sV2kpBJlCZF1OD23ZpaCCAKCMgC73p37a7REDiec2ZgfmNkKfLbV1
N/M3rZoWKhJrAOtNETqMRAEdIIBVwmnDcnQcUag5M9g5BbSjEPAiiH72pTli4cZn
zwSrGkJ8Kbcuzom1Udta8Umg/FPbD1NuRtF2Xf20yxDs0YGTafG+tMvTWTPeJ5S8
8vE3Ejj3QC7ZiCC1tbPcKNMBW3nSypqSUXDLEF39OD/PCfePFu+VJaDWvDCDDlV/
fr4gzBd5fbuxsaBUuMf/
=XG+a
-----END PGP SIGNATURE-----

--tqI+Z3u+9OQ7kwn0--
