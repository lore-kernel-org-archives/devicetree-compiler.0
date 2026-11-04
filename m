Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793805246;
	b=QB9Ynt3vZHx20uCjio3T+r2msuDkItqTY/QlmFGGenYyXCodUGm9cLfO5w5N/JlkcHKj
	 AUBy/jg9n783Lk8jG/DrpLG2TcILkCqvab06Apm5VlbLup8Om5ku/oIMcRzqqhKCVXix/
	 r0+KfRVApCC37Fh4NxGjenQcwOA+6PjQw2BoLul+ITxXecGnLp19hGnUNBW+jiHqi8RlS
	 dIbi6nbXARsMMLPnH4tUdLOgZXkA1qeq3caqfN4HwaU/9s0vdFw88zUu2RUnh9pwnLgNG
	 XWYwsCt8i3IgpfF4/QJpZUadJ+C4F+2DDQ/3RVVXbZEyuTDqrZi5g6Xblr9OBBNRP4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=31BxSQYAW5ZMPCncUBLLTzDH5bfjEUxJIn838ijIhQg=;
	b=zg3EKaNoa7UMz6FOT0+gCwSWH77Q1uvmFAzOmlsKoYpSUv4t6Uc1pk61wtSB3iMIfMYC
	 Rs8fdHtsme+W6af9WnlQ5svaSh4O1dP2AJikqrhyvifgANmeqy3LYBoH3osCNK665Uq8T
	 K94JAp5yAN7ligPYPRJCOi/d0hrCaA0r+IhOH4nsudGhU4Nivu7WmeAf0wJmg4qf6crjQ
	 R+kD88PjyhwU3WcITnU8wiaUGcG8tBKXrNTYQ0hjD0bIAYrkf9kB+YWiHetRQkvlj6EqJ
	 +Xn2cvqRNNTAeJDFq7cn6wkYyzTnDcCYRkXKEK6j0MK2s2zXgBY5O7zkB+L+G+af5/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=L3SsD3xG;
	arc=fail smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3A1606A332
	for <Devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 15:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF3A1606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=L3SsD3xG
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e985106c0cso7138895ad.2
        for <Devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 07:14:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805245; cv=none;
        d=google.com; s=arc-20260327;
        b=h99RXyfzyr8MILO+5oGERsOz0hOaUW7EzcQnbO9dj7wU03ldLJL5rxMT0myCI/uTOu
         C+xOMZ8cO2nK6Sp4C9QH4cj4cGqE1fc9M/mTQx+et+xHT76Dy0NqKTiIGnjeFxmKTr64
         s+cV4AvnI1YuQGEvRe1i1982keStyoilLYN42b0EYIX0GWAd1oTs3r/yvo9QVU2PjbSW
         hNN0Rp1+KeWwrSKIYdxrusJtudzh53iIoKjYlAMVVI420ZdkrRgzrugoUICdurnONjIr
         GkcHVPnPIeM06qXYqQcZdOFokh5TTX2tCmc+Ie8qka7E6jyf7j2sz2gJNntyI27d5ox4
         9lnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=31BxSQYAW5ZMPCncUBLLTzDH5bfjEUxJIn838ijIhQg=;
        fh=a3BzQNqFtg1VcrVkZ5TqQCAuJLyXu+y9XIpvO3RCR4A=;
        b=Oe5CLaMWW8AAzC5J45FUSlOaeTUQ1FkR2LlcIrNj5iBhBAwKCsIfDwtOLZEtXeaFdK
         hmIdqw1+xCWOFriygNFKd0Qnh8DzXfhywmQe7uip4Ebn1IzYdENxn4jYP1BRfqmgmz4k
         3VALe+8KWoKk++iKrC1YwVrGbZmCOPB1rOslFNJ/GVbRtmScnZzu0x9/rqGrNGU9QCzs
         xeYr11Nw3h99Dd4LlOqWp4caBi4FZZfwciiT5TgXXCH07FjkmRqvCVe6VEYUNLC9t5Vh
         x3aOQItITDqz2ssdhqS9UYf51zoTyJYasjzBFWDr2ecJb8KI02yi9f9+5s2r+PnYnpKM
         0pKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805245; x=1794410045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=31BxSQYAW5ZMPCncUBLLTzDH5bfjEUxJIn838ijIhQg=;
        b=L3SsD3xG5SOidLmQYqEWQcwn5xhv0P2KXGVdZg+G8sH1N2teaQP1fxLlOqtZN8X/mM
         hfJNZ4wgXN+fe8NuGmZhZSzvTbzlvaoWiX1aBqoOuIFxdCuf/ggirMCBjJfJh9fJ2HK3
         sIY0Otq/orLQVX+ZSilpbVJa+TBrn9zEUAX8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805245; x=1794410045;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31BxSQYAW5ZMPCncUBLLTzDH5bfjEUxJIn838ijIhQg=;
        b=M9EoyWvKjsGUixLj9fhSLQHOjPI5V5hzemh9y1GrTKGbh/j2sda2pJeu+aFpTd+Q/F
         49MTLggL7kC5maUkpgeDBbJX4lY98fP7bQjHUj3rRXwyHVhvgXnpzAkL+wZ/r5JU7GIA
         kt0X85y5r0I6Naqhb48tBEl4aqj7XvENmGIsamKkGCXnPkzbcQUcwHcTp4WHYkOvdkEa
         TpEK34gl4craQMgmKv3fL+9+fX2AYUL+2I40Bli4Fiuir0a4j1nizLeB2CfH2ekgrT7D
         Q9GE81WVWO3k73K84zk7qT6MrQX3Bmo4JxULYCGco56vEwSRGbzWQZ6sTaok71H/gOVT
         UPqg==
X-Forwarded-Encrypted: i=1; AKwUvByDQgn49UeVO0pxWBgJm+iLT6OEAECtmuZQwx2dWEJXk9ETQ0AHrz9RUX9zf3g8rJBmyzSf8aVaXo4KORXDqFuS3TVN@vger.kernel.org
X-Gm-Message-State: APuU4Z9b0aG6ZOESvrFi2nLlxWJ9u3FEGrbJtHXkN4wpb8zh/PeELbmn
	sQvLB/gmVO0Ggg6DvloZ+tUHaRlEE0sW6ruzav/HUXms7uOhtq+g2uYjEWBu0nV1QxDRjDGmYB8
	uQeYhDJwlRVY9Mcs3yLE7FtQNWUVzDeXB8HV6rECk
X-Gm-Gg: AYBFou11Yjj1Qj/gAfw5fTCZxmBWphwnFk6Ers+y5v22QejVfliCLIoLE3/LgRwVYZe
	7ZRYZX0xvLvEJyTLxh4n8tiJuupXegCV3Edbcs7UKZ+lufWmHVgU+Z+ncfzraOsC85YyRUtmrLB
	VtA+FsAPtKAOVe65vYpVtq82ogHD6RsTDa6D3tgmgCNm/XA/K7P45/NDkTChVhvBV6c/RHw4dLj
	ECpfWxtiZZWjzTRSaryGXlxwg9t90gD5Te62qCjpPiaBRPcS0jUV2CddtdaFpw82Yne42bogWEq
	nli0AGRDYic6ppC6vyFqEKa9Hd6rc9kvjL9ol7uoi19tI8PzjVwLylKPQh7/XLQ6r2BVIM+Y4nU
	T5vv2s6AbuZntzHpUhlHz+QzdLzrVeaVq0OaTfjYsOB8Deo6s4bjKiHab/YQo776FWmliTgS1mh
	BXDtpr7f1jI0Sqdovm
X-Received: by 2002:a17:903:3247:b0:2ea:1b9b:b946 with SMTP id
 d9443c01a7336-2eb3649bbf6mr162205955ad.14.1793805244873; Wed, 04 Nov 2026
 07:14:04 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-8-dianders@chromium.org> <auhYb6FV2dPrbVxB@gractus.seuss>
 <CAD=FV=Vzyu7Jfg43yZQmThc5O007h2Ch5J3cnc4FG3eJUj8pNQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Vzyu7Jfg43yZQmThc5O007h2Ch5J3cnc4FG3eJUj8pNQ@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 08:13:47 -0700
X-Gm-Features: AclHuK_RYDf1j3dx8AHaIWkRXR_-cIM7g_DbJzBvHkjrBLyz2M8C5fF_K3GaKhk
Message-ID: <CAFLszTjdx2YB+ingEx7HnmNabLBE1Japjg8kjwWwvm7DuZFqSQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree representation
To: Doug Anderson <dianders@chromium.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, Devicetree-compiler@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Doug,

On Tue, 3 Nov 2026 at 21:30, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi David,
>
> On Mon, Nov 2, 2026 at 1:31=E2=80=AFAM David Gibson <david@gibson.dropbea=
r.id.au> wrote:
> >
> > On Sun, Nov 01, 2026 at 02:01:14PM -0800, Douglas Anderson wrote:
> > > diff --git a/devicetree.py b/devicetree.py
> > > new file mode 100644
> > > index 000000000000..198ab73eda88
> > > --- /dev/null
> > > +++ b/devicetree.py
> >
> > This should probably go in a subdir, since it's not part of dtc
> > proper.  I think putting it in pylibfdt is ok, even though it's not
> > technically part of pylibfdt either.
>
> Sounds good. For v4 I'll move `devicetree.py` to `pylibfdt/devicetree.py`
> and update `pylibfdt/meson.build` and `tests/meson.build` accordingly.
>
>
> > > +        node =3D cls()
> > > +        for prop in fdt.properties(offset):
> > > +            if prop.name in node.props:
> > > +                raise ValueError(f'Duplicate property {prop.name!r}'=
)
> > > +            node.props[prop.name] =3D prop
> >
> > This is, technically aliasing the Property returned directly from the
> > flattened tree, which seems a little risky.  Or at least it does if
> > Property is mutable, which it appears to be as a subclass of
> > bytearray.
> >
> > On consideration, that kind of seems like a pre-existing mistake - the
> > way we use it, I think it makes more sense for Property to be
> > immutable (a subclass of 'bytes' instead).  I wonder if making that
> > change would break things.
>
> Note that `fdt.properties(offset)` (via `get_property_by_offset()`)
> already allocates a fresh `Property` object with copied bytes on each
> call rather than aliasing the underlying `Fdt` buffer. Even so, having
> `Property` be mutable is definitely footgun-prone when `Property`
> instances are stored in `DeviceTree` or shared across nodes, and making
> `Property` subclass `bytes` instead of `bytearray` has some nice extra
> benefits:
> - `Property` becomes hashable (can be used in sets/dict keys) and its
>   byte value is immutable.
> - `fdt.setprop()` and `sw.property()` C SWIG typemaps require
>   `PyBytes_Check()`, so previously passing a `Property` directly to
>   `fdt.setprop()` raised a `TypeError` unless wrapped in `bytes(prop)`.
>   With `Property(bytes)`, a `Property` can be passed directly.
>
> Looking into compatibility for external `pylibfdt` callers if we switch
> `Property` from `bytearray` to `bytes`:
> - All existing tests in `dtc` pass without modification, and U-Boot's
>   `dtoc` (`tools/dtoc/fdt.py`) immediately converts the `Property` from
>   `get_property_by_offset()` to `bytes(p)` anyway.
> - Indexing, slicing, `len()`, iteration, `struct.unpack()`, the buffer
>   protocol, and all read-only bytes/string methods work identically.
> - Equality comparisons (`=3D=3D`) against `bytearray` still work, since
>   `b'abc' =3D=3D bytearray(b'abc')` is `True` in Python.
> - One subtle difference is that `bytearray` has a `.copy()` method
>   (`prop.copy()`) whereas `bytes` does not (`b''.copy()` raises
>   `AttributeError`), though we could easily keep `prop.copy()` working
>   by aliasing `copy =3D __copy__` on `Property` if needed.
> - The only things that would break in external callers (and can't be
>   shimmed on a `bytes` subclass in CPython) are:
>   1. Mutating a `Property` in place (`prop[0] =3D x`, `prop.extend(...)`)=
,
>      which seems unlikely since `Property` is a disconnected snapshot and
>      mutating it never updated the `Fdt` blob anyway.
>   2. Explicit `isinstance(prop, bytearray)` checks.
>
> In my draft v4 branch I've queued up a preparatory patch ("pylibfdt:
> Make Property a subclass of bytes instead of bytearray") that changes
> `Property` to subclass `bytes` via `__new__(cls, name, value)`, updates
> the `fdt_get_property_by_offset` SWIG typemap to return
> `PyBytes_FromStringAndSize()`, and drops the redundant `bytearray()`
> wrapper in `FdtRo.getprop()`. Let me know if that sounds good to you or
> if you're worried enough about compatibility with external callers that
> we should keep `Property(bytearray)`.

To my mind it is more important that we have enough tests to cover the
cases we care about and other tests to fail for unsupported cases.

Immutable seems safer and I can't think of cases where we want to
fiddle around in the middle of a large property, so that the
efficiency might suffer.

>
>
> > > +        for suboff in fdt.subnodes(offset):
> >
> > So, this can be a later improvement, it doesn't need a respin, but
> > this is a pretty inefficient way of unflattening the tree.  To get
> > from one subnode to the next subnodes() needs to traverse everything
> > in between in the flattened format - which is also what the child
> > unflatten()s do.   So on at every level making this roughly O(d * n)
> > where n is the number of nodes, and d is the depth of the tree.  You
> > can unflatten in a single O(n) pass over the tree.
>
> Since I'll be spinning v4 anyway, I've updated `DeviceTree.unflatten()`
> in my draft v4 to unflatten in a single O(n) pass using
> `fdt.next_node(offset, depth)` and a node stack.
>
>
> > > +        fdt =3D sw.as_fdt()
> > > +        fdt.set_boot_cpuid_phys(boot_cpuid_phys)
> > > +        fdt.pack()
> >
> > The pack() is harmless, but probably unnecessary - fdt_finish(),
> > called from as_fdt() leaves an already packed tree.  Unless something
> > resized after that point, which set_boot_cpuid_phys() shouldn't do, it
> > should still be packed.
>
> Good catch. Looking at `FdtSw.as_fdt()`, while `fdt_finish()` packs the
> FDT header's `totalsize`, `FdtSw.as_fdt()` currently doesn't trim the
> backing Python `bytearray` to `fdt_totalsize()` (unlike `Fdt.pack()`,
> which runs `del self._fdt[self.totalsize():]`), leaving trailing buffer
> slack in `fdt.as_bytearray()`. For v4 I plan to add a small preparatory
> patch ("pylibfdt: Trim Fdt bytearray to totalsize() in FdtSw.as_fdt()")
> so `FdtSw.as_fdt()` trims the `bytearray` to `fdt_totalsize()`, and drop
> `fdt.pack()` from `DeviceTree.flatten()`.
>
>
> > > +    def get_str(self, name):
> > > +        """Return property `name` decoded as a NUL-terminated UTF-8 =
string.
> > > +
> > > +        Args:
> > > +            name: Property name to look up in `self.props`.
> > > +
> > > +        Returns:
> > > +            Decoded string value (without the trailing NUL byte).
> > > +
> > > +        Raises:
> > > +            KeyError: If `name` is not in `self.props`.
> > > +            ValueError: If the property value is not a single NUL-te=
rminated
> > > +                UTF-8 string.
> > > +        """
> > > +        return self.props[name].as_str()
> >
> > Rather than having wrappers around all the class Property acccessors,
> > would it be simpler (and only slightly more verbose) to just have a
> > property() method, returning a Property instance and use its accessors
> > in the caller?  Looking up properties with __getitem__ could also
> > work, although maybe the fact that doesn't get subnodes would be
> > confusing?
> >
> > I guess that would also require a bunch of new class methods on
> > Property for the set* side.
>
> Yeah, that works out nicely. For v4 I've queued up a preparatory patch
> ("pylibfdt: Add Property.from_*() creation methods") adding
> `from_cell()`, `from_uint32()`, `from_int32()`, `from_uint64()`,
> `from_int64()`, `from_list()`, `from_uint32_list()`, `from_int32_list()`,
> `from_uint64_list()`, `from_int64_list()`, `from_str()`, and
> `from_stringlist()` classmethods to `libfdt.Property` as the
> counterparts to `Property.as_*()`. Then in `DeviceTree` I've dropped all
> the `get_*()` and `set_*()` wrapper methods and replaced them with a
> single `DeviceTree.set_prop(prop)` helper (which stores
> `self.props[prop.name] =3D prop` so callers don't have to repeat the
> property name when setting a `Property`).
>

Looks good. The 'from' indicates immutability IMO.

>
> > > diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> > > index ae46b29a8f5c..cfdb8f5749b6 100644
> > > --- a/tests/pylibfdt_tests.py
> > > +++ b/tests/pylibfdt_tests.py
> > > @@ -11,6 +11,8 @@ import types
> > >  import unittest
> > >
> > >  sys.path.insert(0, '../pylibfdt')
> > > +sys.path.insert(0, '..')
> >
> > See above about location of devicetree.py.  But.. for that matter,
> > with the code in a separate module, it probably makes sense to have
> > its tests in a separate file, too.
>
> Makes sense. For v4 I'll move the `DeviceTree` unit tests into a new
> `tests/devicetree_tests.py` file and run it alongside `pylibfdt_tests.py`
> in `tests/run_tests.sh`.
>
>
> > > +    def testDeviceTreeRoundTrip(self):
> > > +        """Test unflattening and flattening a tree via DeviceTree"""
> > > +        tree =3D copy.deepcopy(devicetree.DeviceTree.unflatten(self.=
fdt))
> >
> > What's the deepcopy for?  You're not retaining the original
> > unflattened copy.
>
> I'll drop that in v4. (It was a leftover from testing
> `Property.__deepcopy__()` before that was split out into its own test in
> `pylibfdt_tests.py`.)
>
>
> > > +        self.assertIsInstance(tree.props['compatible'], libfdt.Prope=
rty)
> >
> > I don't know if directly accessing the tree's internal dictionary from
> > outside is a good idea.
>
> My intent was for `props` and `children` to be the primary public `dict`
> attributes of `DeviceTree` (rather than internal/private state), which
> keeps property and child-node lookups, iteration, and deletion
> (e.g. `node.props['compatible'].as_stringlist()`, `node.props.get(...)`,
> `del node.props[...]`) idiomatic in Python without needing a parallel
> set of dict-wrapper methods. Dropping the competing `get_*()`/`set_*()`
> wrappers on `DeviceTree` and adding `node.set_prop(prop)` makes that
> model much more consistent; for v4 I'll also update the `DeviceTree`
> class docstring to explicitly document `props` and `children` as public
> attributes for callers.
>
>
> > > +        tree2 =3D devicetree.DeviceTree.unflatten(fdt2)
> > > +        nodes1 =3D [(path, n.props, list(n.children.keys()))
> > > +                  for path, n in tree.walk()]
> > > +        nodes2 =3D [(path, n.props, list(n.children.keys()))
> > > +                  for path, n in tree2.walk()]
> > > +        self.assertEqual(nodes1, nodes2)
> >
> > I don't think it's guaranteed that walk() will get the nodes in the
> > same order each time, so you probably want sets instead of lists here.
>
> Will fix in v4 by comparing
> `{path: (n.props, set(n.children.keys())) for path, n in tree.walk()}`
> (and using sets of paths in the other `walk()` test assertions).
>
>
> For now I'll hold these draft v4 changes in my local tree. If you have
> any feedback on the responses above (or any other patches in the
> series) I can make further changes before actually sending out a v4.
> If you'd prefer me to send out what I have now so you can review the
> latest-and-greatest, I'm happy to do that too. If nothing else, some
> of the changes we've made to how DeviceTree works here bleed into the
> other patches a little, so sending a v4 before you review further
> could be nice. ...but I also don't want to churn the series faster
> than you're ready for it. ;-)

Regards,
Simon
