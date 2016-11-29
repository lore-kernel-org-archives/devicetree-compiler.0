From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: Overlays and boolean properties
Date: Tue, 29 Nov 2016 15:10:40 +0200
Message-ID: <BDABA9C0-FDBE-4B2E-97AE-D3684D2A68BA@konsulko.com>
References: <a02487bb-6f79-fe4d-8180-86375b9413b9@raspberrypi.org>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:mime-version:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=C4pe51WozX5jyassjUpEyeNldKGUtIBOvfO1mZfCnvY=;
        b=XqOO12slJd7Aw2xSmKq1A8fjTi0qvKMLXJYvlq/OsdhAcTx5QfRGYv23MEZvsXgldE
         oTboCWWCwdaHTPwnuaYkg5Iearzc4njaeN7uv3idUsxSB/jyfDFgQFele2tH9ZxCporS
         x4Gtg/zIhqROleamQvLbGCWQXZ4TFPFCpvZVw=
In-Reply-To: <a02487bb-6f79-fe4d-8180-86375b9413b9-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Phil,

> On Nov 29, 2016, at 15:06 , Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org> wrote:
>=20
> Boolean properties are defined as being properties with no content, =
that
> are true if present and false if absent. They pose a problem for DT
> overlays, since the proposed (and widely used) overlay mechanism does
> not allow for properties (or nodes) to be deleted; overlays can only
> make a false property true, so boolean properties are effectively
> monostable - once true they become immutable.
>=20
> The standard DT syntax includes /delete-property/ and /delete-node/
> directives that do what you would expect from their names, but that
> facility is not available to overlays. There is no FDT node that
> represents the deletion - the directives are acted on immediately - so
> we would need some extra markup - say __delete_property__ and
> __delete_node__ - to hold the names of items to be deleted.
>=20
> Before I take this further, does anybody have any thoughts on the =
idea?
>=20

The original patchset did support removing properties (by prefixing them =
with -).

I can revive that if we have consensus about the format/method.

> Phil
>=20

Regards

=E2=80=94 Pantelis=
