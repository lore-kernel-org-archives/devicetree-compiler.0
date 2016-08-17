From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [U-Boot,v4,01/13] cmd: fdt: Narrow the check for fdt addr
Date: Wed, 17 Aug 2016 08:48:53 -0400
Message-ID: <20160817124853.GX5342@bill-the-cat>
References: <20160705082646.25044-2-maxime.ripard@free-electrons.com>
 <cf8fe411-8503-78d3-1603-05f1bacd0eb1@samsung.com>
 <CGME20160816015450epcas1p1fc8924fd02ed0e17ad0d68685e28d327@epcas1p1.samsung.com>
 <20160816015518.GT5342@bill-the-cat>
 <3d40964a-47ce-c9cf-302a-c5f960245928@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U7NLafZe7Bh9OCap"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Wp+xJewLCf3GhafByRLjcF13MyplpSYtGUjOlAxSuUI=;
        b=GOrsiDh0GQWxM6gp/MxCpfr5zB3XmCfR59K/Wkb/z6EyQ5jVo3fBHke6kIMzL0Z+9H
         7ziaYrdHTB1X/NdPtScFMzZMjMJkybzGbazXCiqa/2os3WwNuviGCDB2wj9ttAU0Rbp0
         5E8xnY59YWKWIOO/oBYrufxkiuttCNdlV1pO0=
Content-Disposition: inline
In-Reply-To: <3d40964a-47ce-c9cf-302a-c5f960245928-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


--U7NLafZe7Bh9OCap
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2016 at 11:31:18AM +0900, Jaehoon Chung wrote:
> On 08/16/2016 10:55 AM, Tom Rini wrote:
> > On Tue, Aug 16, 2016 at 10:52:04AM +0900, Jaehoon Chung wrote:
> >> Hi,
> >>
> >> On 07/05/2016 05:26 PM, Maxime Ripard wrote:
> >>> The current code only checks if the fdt subcommand is fdt addr by che=
cking
> >>> whether it starts with 'a'.
> >>>
> >>> Since this is a pretty widely used letter, narrow down that check a b=
it.
> >>>
> >>> Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >>> Acked-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> >>> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >>
> >> I don't know what these patchset were delegated to me..I think it's no=
t my scope.
> >> Simon is FDT maintainer..Could you check these patch-set?
> >=20
> > Ah whoops, that would be me.  I assigned Pantelis some FDT stuff in
> > patchwork too, but I bulk changed it all over to you, sorry!
>=20
> Thanks! :)  Then I will delegate to you, is it ok?

Sure.

--=20
Tom

--U7NLafZe7Bh9OCap
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXtF01AAoJEIf59jXTHXZSzYMQAJ3FnoXeySgzarXVC8tiwuNM
N0erJS7EKtULtzmAe//g5XVwhBbfaTlrwNp0QRGkaHFPbbJbXkVW6Kja/jKuPvWr
NCVMw3KhWZhCa6ktucILrXebposp5MMygJq23NcvJ+A8mdjGUKYNaCINTAT2rNq7
nwhZUWaVOXwxeqyo00Hfp1ZFSqa8GwPBwFtw7gO6eCgacZZ+eETibaLEXobWpCR9
KIvG3RAIIT8Qa+brz6/9OiAUaoeUSRd4Qje9xaHF7Y5cWfxo5ua3m/C/1YOwXw5m
Y+JHAxmQijy9u/2V18fy+V1EbqV2fXw81lMa4ZYPvb8bCwVbGTCiIXj1fuHrZ9MC
Wal0U2ERLrRgFjrizTPJP52bWl06YdX+3BupMkC9IIWKHI16z0X8tzJ0HEYEsN5U
NcoaTAW3J4Efrv/+r9xRVPeIJUEtpW5tIw3wnmh5DaRsjWvatRkcNkDocudeVY31
ddJuBE/A2tESBhV75xYf2geT9NUTMZjP7cvE2kqr6kRPHobUbbc7bayAIZs1i6ZM
pDXdlPX3U2fCKV/aY4abfs+HE72f5AdLt/srkHiIwjxIEaJN5HmT0LsQPJaC5Bx5
VyfcQIJsaiIs2I8g4EdzpDWOqPgeTniLBJu29La9gVbIuwjhLOtkyuHXWIvx+xgw
x9rOLYOf8qzSG0CMMVzh
=LBe1
-----END PGP SIGNATURE-----

--U7NLafZe7Bh9OCap--
