Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1941A53F69D
	for <devicetree-compiler@vger.kernel.org>; Tue, 13 Oct 2026 19:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791920952; cv=none; b=Dtn0q4QB5U+lS34/mX31fFuAWVx/U1ZZZiBBvCuz7qrUBG+9kUu0lwXGDXdih717LuRJed8ENuRwqEgslrE33+fjk9QcD68VGrzGC9efDkR6n06uR9fXDXNAKDH7/sjjSS8Vwzl1eV95PF79ZfyRvacN8lct0WualBCmQLhFUgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791920952; c=relaxed/simple;
	bh=tiT2F/ECbxiEabWBAP09wZ9MI4I+09GcYjUweKp+W5s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kkkPO1yCFlQ5oCgyvAIl1793coBOyQDItnesuJ2exqNuBrYuGoId9KrB3gmyia8A01N59qSUYTY/PLtqVb4ItSo9/eOsA3UV69hCu+axtsCEX0yIBxHir5ndniSMv398sY2Zs/GHfMJUVd1oGu4yKO3G1x+mDXu4VEXrnV1ooPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b=knc6/tKj; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b="knc6/tKj"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1438d9363fbso81417c88.0
        for <devicetree-compiler@vger.kernel.org>; Tue, 13 Oct 2026 12:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1791920950; x=1792525750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ReAJUuSEnDcRQKK/UhSnvjLFcmpy/PcXbUdjFmS7Wvc=;
        b=knc6/tKjiJMLpuScV6DSTh/RtWFL51d48dGSkGpABiVVjpY1LH2GdWY1an3wuGpiiq
         PEkKeJnXqiN+M36vnktCX3Jhvzp57Br0ypGLKOUtBmNtKKLJFSVWKa+6kPYgmKqZwBfY
         0lrr7T56F3hDdm+k4X0krC2meP3j7lPrM0FvcIIj1f5h9cqPZyyQsBwyolAmU6cUroTb
         yPUuraJhpNX1a2e2G3I7GeZLgEyi5dXlnsNd66qvUfovyZCYkUc74xxOd1q1XA1N8INo
         wJJ1MepuJxIAQTw6pkSZf1ke32McoYokvuzki1nY0o0WfR/bOEMWUyfdcsCKPhRcodfv
         EjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791920950; x=1792525750;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ReAJUuSEnDcRQKK/UhSnvjLFcmpy/PcXbUdjFmS7Wvc=;
        b=AxY1MjFil9MOZeMflcQ4uHAbV3YNm1Ends7pf4cEtJsbhFArXPXimzPWzF/ebZv2MN
         2GUX2LXyDCB/soJFYtGWJg2biEOt7XhRux4EZadrbHDn+xJc14GVc8hNCR1W0w6HoPSt
         WL0GKUL1kv5h+sP3LHKFZp84wJ83YIK97N0U9njvRc1/tZbb9eQw3F7fVGK/SPCZDYuz
         B7gnrT3GCqNkyv6BdMYZaRw/zxqwL5YJYd5VcPducKm1DV4Oz7FkXAIsc1TULMze4tPn
         D45fUAz5IyUWK9Q/LK4IFbVv0JnmoObyCJfqSyFdEa6qThRu6KGnLw/ObSkYSTQBpGrm
         WKqA==
X-Forwarded-Encrypted: i=1; AKwUvBztHKksehl5lkvITsYPza5ej3Rk/EMivR8/yA8yj/c8TU8LfdrGDh6xk6DZPZkPnqJfBfVOx9/QBlTIaFp2AJa2ON4m@vger.kernel.org
X-Gm-Message-State: AFq9FYKbDMDWqhFS9hapg8VAthpwnZF8YzzBCssnq5Ilqw3vNIBU5RrT
	36a/JjE15QayrQz2uOxDBQwFkjbmrlOARqA2yGLzmpcEcTLNQWJBwG+q66qi2pSoM0N+ujfKLbn
	cMzY=
X-Gm-Gg: AYBFou09503ktEw9J1sLmB7SufIFbzVMOvtE/nrm+6QyLQ8Xxeppmk4PMaeZ1kghdl2
	f943Zr5iuUQe5j2I21f4Iv8y6Q9OuJofv3DpzOrV/vNi5vOerpy41MwUWpESWyY1fU2BQojSYwN
	RFDLoxcetVgqGIZ4bW37KtMaV6x/+u1w4FDvsdZEezKsW8wPMR8xf4KIocCF/O61lMZJlG35svJ
	LHJ6iVWJAvTcl/dgr+3InppnaybVMZIt4t4i+FmWrw/IzIW1SEZcD24W2lj8nzMSpTY0WQp8Vqz
	AtZxiX17J9KRuFk2GRwv/YM1yAkIMe1vbNyKr4w/CZy6DSSL2igF7Cpw5U1iyiEk9rOem19xtfH
	82iqjfk/sxpivSkY0+4/zh74lKQgL7396k0OgdIOOkHslAnbGcwqwl45mA2nfhQ5ZZftKdwqNuy
	QKTtQY0+cushU8PfVE8PAzc4CXVVIZuBbpr4lC9wvqw9v1IkEVKscNtpMUwG5bjduutBovIL/S
X-Received: by 2002:a05:7022:170c:b0:145:5c7:7185 with SMTP id a92af1059eb24-16a10f299a3mr17694738c88.5.1791920949453;
        Tue, 13 Oct 2026 12:49:09 -0700 (PDT)
Received: from fedorapc ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm40620145c88.15.2026.10.13.12.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:49:09 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Ayush Singh <ayush@beagleboard.org>,  David Gibson
 <david@gibson.dropbear.id.au>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>,  David Lechner
 <dlechner@baylibre.com>,  Geert Uytterhoeven <geert@linux-m68k.org>,
  devicetree-compiler@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  devicetree-spec@vger.kernel.org,  Hui Pu
 <hui.pu@gehealthcare.com>,  Ian Ray <ian.ray@gehealthcare.com>,  Luca
 Ceresoli <luca.ceresoli@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 15/15] Introduce v18 dtb version
In-Reply-To: <20261013192342.149768ed@bootlin.com> (Herve Codina's message of
	"Tue, 13 Oct 2026 19:23:42 +0200")
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-16-herve.codina@bootlin.com>
	<arDMhoNNXcPi81sR@gractus.seuss> <20260925152157.511dc65c@bootlin.com>
	<as3ZWBr3wRonkxXF@gractus.seuss> <87pkxd4jly.fsf@beagleboard.org>
	<20261013192342.149768ed@bootlin.com>
Date: Wed, 14 Oct 2026 01:19:02 +0530
Message-ID: <87ld814c0h.fsf@beagleboard.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Herve Codina <herve.codina@bootlin.com> writes:

> Hi Ajush,
>
> On Tue, 13 Oct 2026 22:34:57 +0530
> Ayush Singh <ayush@beagleboard.org> wrote:
>
>> David Gibson <david@gibson.dropbear.id.au> writes:
>>=20
>> > On Fri, Sep 25, 2026 at 03:21:57PM +0200, Herve Codina wrote:=20=20
>> >> Hi David,
>> >>=20
>> >> On Mon, 21 Sep 2026 16:20:02 +1000
>> >> David Gibson <david@gibson.dropbear.id.au> wrote:
>> >>=20=20=20
>> >> > On Wed, Aug 26, 2026 at 10:31:46AM +0200, Herve Codina wrote:=20=20
>> >> > > This v18 version will add support for
>> >> > >   - Structured tags.
>> >> > >     Those tags value definition will allow "old" libfdt, dtc and =
other
>> >> > >     tools to skip unknown tags if encountered in future dtb versi=
on.
>> >> > >=20
>> >> > >     libfdt, dtc and other tools implementing version v18 will be =
able to
>> >> > >     skip unknown tags available in dtbd generated with later vers=
ion of
>> >> > >     dtc.
>> >> > >=20
>> >> > >   - dt_flags header field.
>> >> > >     For now this flag field is set to 0. It is a placeholder for =
future
>> >> > >     dtb version and could be used to store some dtb related infor=
mation
>> >> > >     such as the kind of dtb. For instance, the future addons form=
at will
>> >> > >     use this field to clearly identify that the dtb is an addon d=
tb.
>> >> > >=20
>> >> > >   - last_comp_version_w header field.
>> >> > >     This field is similar to last_comp_version but for writing.
>> >> > >     It contains the lowest version of the devicetree data structu=
re with
>> >> > >     which the version used can safely perform modifications (taki=
ng into
>> >> > >     account following rules related to unknown tags).
>> >> > >     If this lowest version is greater than the last known support=
ed
>> >> > >     version, modification are simply forbidden and lead to a
>> >> > >     FDT_ERR_BADVERSION error.
>> >> > >=20
>> >> > > For modification, when an unknown tag that can be skipped is invo=
lved
>> >> > > and last_comp_version_w allows modifications, the following rules
>> >> > > apply:=20=20=20=20
>> >> >=20
>> >> > "last_comp_version_w allows modifications" is a bit hard to
>> >> > understand.  What exactly is the version number against which we're
>> >> > comparing that value?=20=20
>> >>=20
>> >> We had one last_comp_version.
>> >>=20
>> >> Now we have two last_comp_version, one for reading and one for writin=
g.
>> >> We compare again the dtb version supported by our libfdt version.
>> >>=20
>> >> This comes from the discussion [1]
>> >>=20
>> >> [1] https://lore.kernel.org/all/CAL_JsqLRrbZje_gGZPBDni6StFa+6rdiECtk=
49on8VfkP7CDvw@mail.gmail.com/=20=20
>> >
>> > Ok, I now see that the logic is you simply fail to proceed with writes
>> > if the library's latest understood version is < last_comp_version_w.
>> >
>> > As I said elsewhere, this approach doesn't particularly make sense to
>> > me.  If lib_version >=3D last_comp_version you *can* write, even if it
>> > means stripping everything that's not understood at lib_version.
>> >
>> > So the real question here is how do we know, for any given structured
>> > tag, what write operations require the version to be downgraded (which
>> > might in turn require this and/or other structured tags to be stripped
>> > entirely).
>> >
>> > This is related to (though not the same as) the question of whether
>> > introducing a new structured tags requires a bump to the dtb version
>> > (though not to last_comp_version, of course).
>> >
>> > Here's the simplest model I can think of.  It's what I'd suggest,
>> > unless one of it's limitations is a showstopper for what you have in m=
ind:
>> >
>> >  - version and last_comp_version retain their meanings.  No new header
>> >    version.
>> >  - New structured tags *do* require a new version.  If a dtb wants to
>> >    include a specific tag, it must label itself with a version that
>> >    defines that tag.  To enforce that:
>> >     - For read operations, if we encounter a (known) tag that
>> >       doesn't belong in the header version, we throw an error (either
>> >       BADSTRUCTURE, or a new error for the purpose).
>> >        - If version <=3D FDT_LAST_SUPPORTED_VERSION and we encounter an
>> >          unknown tag that also trips the error (since if it was
>> > 	 defined in this version, we should know about it).
>> >     - For write operations (including in-place), we always error if
>> >       version > FDT_LAST_SUPPORTED_VERSION (done in fdt_rw_probe_()).
>> >     - fdt_open_into() _is_ permitted if version > FDT_LAST_SUPPORTED_V=
ERSION.
>> >       It will strip all unknown structured tags from the entire tree
>> >       and downgrade the version to FDT_LAST_SUPPORTED_VERSION.
>> >
>> > This does mean that every new tag does require a new version, which
>> > may make experimenting with new tags more awkward.  More
>> > significantly, it also means that any change requires a version
>> > downgrade, even if it's just updating a handful of properties.
>> >
>> > On the plus side, it's fairly simple, retains as much as possible
>> > current version semantics.  Most especially there's no tricky
>> > questions about what sorts of writes might invalidate an unknown tag
>> > (they'll all be stripped by the time we permit a write operation).
>> >
>> > If those limitations really are a showstopper, I do have a few other
>> > models that might work, though.=20=20
>>=20
>> The limitations do not sound too bad. And it feels easier to implement t=
han
>> keeping track of read and write versions separately for each new tag.
>
> But it doesn't handle the use case I mentioned in a previous reply :(
>
> bootloader knows about version 2.0
> kernel knowns about version 3.0
>
> dtb 3.0 we want the bootloader to skip tags it doesn't know about but thi=
s same
> bootloader has to handle 'unknown' tags on some modification. We want to =
have=20
> possibilities to let this bootloader perform those modifications (under p=
recise
> known rules) and pass this dtb to the kernel.
>
> Best regards,
> Herv=C3=A9

Apologies, I guess your email with the bootloader case came while I was
composing, hence missed it.

Anyway, that is an interesting case, and well, it does happen rather
frequently in embedded devices. I just did not consider it in the earlier
reply. If I remember correctly, U-boot does some dt fixups after detecting
things like GPU in case of TI AM62 (used in BeaglePlay and PocketBeagle 2).

Best Regards,
Ayush Singh

--=20
BeagleBoard.org Foundation
https://www.beagleboard.org
