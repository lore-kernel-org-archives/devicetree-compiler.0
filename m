From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [U-Boot,v4,07/13] libfdt: Fix separator spelling
Date: Sun, 21 Aug 2016 11:07:23 -0400
Message-ID: <20160821150723.GZ5342@bill-the-cat>
References: <20160705082646.25044-8-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Swav0nNPrA3tWuBp"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JZwBCBrUZKI6/nN4mKMt2FNSsl+xTvTKVPrphEe22PI=;
        b=efs8P/lTU1fhQMQPDcupxuoZVKDHazdkDK8uN+RxmAGLpehtcILvEQ8I8AyyW8QXbD
         11MkARYrMD10mH7VFf5M23F5qHJNwR0ez1TMcJ+h+Un6f5ICI3knwN5Gndnxqa4L+TgH
         t+kNLiBlEeGnJlKE80YhCElA7Hr0fUHSBtXrw=
Content-Disposition: inline
In-Reply-To: <20160705082646.25044-8-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


--Swav0nNPrA3tWuBp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2016 at 10:26:40AM +0200, Maxime Ripard wrote:

> The function fdt_path_next_seperator had an obvious mispell. Fix it.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Applied to u-boot/master, thanks!

--=20
Tom

--Swav0nNPrA3tWuBp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXucOrAAoJEIf59jXTHXZSiwYP+QEVVLw7EswIhXBvqwNQj6tU
LMgHJtPB8hYo8Gqr8r5O7mPDOm/2bncnaG/c+N90Kn2AJS3XuasDtTu7dOMg7RVK
Lax35SCKtqTz0VUeQyglGDpXmZ/7nUPJb2IJnHVSxKEt4Ee0A52dje/scKFpdHc9
GjvCmcE87PVeLuVSJaxl0bBSEc8s9eQ4/pbdbkGYF21lXinG3BJOvQRpl8AvxpwJ
FyDz0eW70qYjL9ydB4cb8pwvG/u+HlzM++m4Q8FKHifa7IduMTG5HbZ3kmHaWlfj
/tdotOE6qvYToBcV0xPBik7WCy5cYLiBoOWRr3zOZgSCrhhGbkGWYzgkRohFHTDX
m7E0jq3r0eJWcQEvcsnbxfW+GoX/YWOICobYkHs4oN6nm3tOQflJZGZzFRsVOW/r
1BB3tJyYI5caFdmnZyasJpxxFStQCjpXU0S946WSZ8KuIk73F5XdRSPn1S2IDzQa
037KPPJcbnFvKpc5ifLikZ2Gx3CDRiayemzYWTszN3L5xPLT66429lPb67mqknpc
mzLvvwt2n7ZkstqXl2NUaiyThSHCIIcBVRR0RbLf3sU9mJe3xEvjCbRfhxfn7y4x
SM0XgY5XzToFdIP51B6gls2R8WFW0hDTXoOmJXFVgdIKscrJv5/SrqQDt/slGm7O
vkTvqcSpxtPXG4yYoi3w
=D7o8
-----END PGP SIGNATURE-----

--Swav0nNPrA3tWuBp--
