From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [U-Boot, v2, 07/27] libfdt: Add a function to write a property
 placeholder
Date: Tue, 15 Mar 2016 07:53:49 -0400
Message-ID: <20160315115349.GA23166@bill-the-cat>
References: <1456206959-29115-8-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Zqzz6AX+Wx2CzFqI"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Xm3IHKgHKlj/12RZZSDqP4y+NgIOEH2RaP407i9hTSw=;
        b=Wa/Reprj/CALAGxs7fDqXWUd2LuXvsjy3C3rU0jA7VAtVLL82GdocUrj3Hn7Mf6WmQ
         WqgXQ2xZnd1Rvuw6hvMCMuTuBhXcuJDf9iq2eJqlrSLYv3qJC2kDzzK+9I6E9agzLaJy
         Ueoh8CFV1V3nluZkfUpO4RKfPbQUQlxVltC9o=
Content-Disposition: inline
In-Reply-To: <1456206959-29115-8-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--Zqzz6AX+Wx2CzFqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2016 at 10:55:39PM -0700, Simon Glass wrote:

> The existing function to add a new property to a tree being built requires
> that the entire contents of the new property be passed in. For some
> applications it is more convenient to be able to add the property contents
> later, perhaps by reading from a file. This avoids double-buffering of the
> contents.
>=20
> Add a new function to support this and adust the existing fdt_property() =
to
> use it.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Applied to u-boot/master, thanks!

--=20
Tom

--Zqzz6AX+Wx2CzFqI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJW5/fMAAoJEIf59jXTHXZStEYP+wQf3PAalF8lrFSo1/OayEmo
b3w6pvdZs/4InKR/8uCQiLFGAbD13FI8IKaSFS+8E04GlNZLsBwe1lpoVheVpt0c
KKr/O0IN2JkbA/UpNbMzkHZbPOZZgy7t5ht7js5RiiXdPdgyQO23ucNIyLWI4ZNC
9V1dSwua4b1kNkDuzqhq2L8w8X7vankK+9Wl1w919Brc+u4/LKvRr6RY/9YcYJkg
ELUuR8rJ9dm2M6qFCQYI/9DVooWsSaN7y0+YGwYv7LkPhHPbmx0QUXIXAPcgduVu
WZXSeuvvq2Hd/6o+fwFbJ0j75KS6OVnC7tJyvQFF9QmEJVJmKM80zOuWe2X+0HLC
guqOrehCHV8nVFiHIGzJSBIynVBpVI6pNE740lWxL3i7kite5c2cPEYawTSb7xBc
3AnLWdamavJ8fycB29E518ZWTnajul+pf+SIb4qr3j2XK6G1OlVGy+KJjuq9U3VI
iykLya6jblmejjngUCDMwODQP91Mp0RMaW/62thD7YmOY2gslLVEHwGeiNiqZjd9
YhdIQ7IsuvzcYGHdS1qAl/P1iBrKloXLYBOiiXYaiwW1HEgIrIYNjK6XORtsrQ8P
82cSROczd3Nae0COOHYmvB5F7sqSGu3fnjuPUhbP1xBLr8AgANrMVj3rRHf5unZg
VHR4Qx8XCMiadNscdy7k
=UwRE
-----END PGP SIGNATURE-----

--Zqzz6AX+Wx2CzFqI--
