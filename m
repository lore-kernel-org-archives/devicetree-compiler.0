Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4D644E676;
	Thu, 17 Sep 2026 07:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628708; cv=none; b=YvGjJUKOoRWj3e++UwoJxkAVURDSk/G8l/26hDXLj7QTWTtPpqJkExnVfK//F4mcuzchxiWsWsHoSlpgLv8SrsERB2n5nt1ppEenui1ij40QIDNoJO+jagqMvu8/QUM+C5Xm/7K1wHGo0TLt9ZjU2EBu1VAtt62CTn23/eGNGnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628708; c=relaxed/simple;
	bh=MNnmu76hPgGWj1Vt27yFxuabcyAjQ2ANFyMTfQshGqU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QG7s1sGWIN6obYJOG8EgHgr9iAQi4IzDZtUGtpOPOfh8BpkyR/vPab8/jyJlV/MK2Vao5i+l5mQC3xHGaSPswL3lJAh7yrmzGS1Z+TukewfVFnZ26PVsCESLX+Z2wJun2YFYo+iVBZQK9NTTydYri8RV5EoXtCBWKNkwF8C9iBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KJTlULcf; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KJTlULcf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C751EC63440;
	Thu, 17 Sep 2026 07:05:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 680D45FAA3;
	Thu, 17 Sep 2026 07:04:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 65A3311C79EF2;
	Thu, 17 Sep 2026 09:04:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789628698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E8iXZTQ0Z85lT35CKG6qwvlJKAl7XnP76vVQ48pKXAs=;
	b=KJTlULcftlmHVGX4Os7GN4Vk+UriSVnXzUw90uaa3P7qK6jec83GB2imdNx0g6vW1Ng7gH
	i+zOTP/dCBwmxnbAQHNNE3l4m74tyUJhdw/0lFj7h1eFDghsJBkPuFhTL0Q0s/deRCS4N4
	Vz20BEH7Sf4ZlKFEYNmoRNq9X55j4UJv1HthcTGbo+/+M8JqREKH1bXxO6wQOJzcIM1rft
	fjU1aQefmAnWUF2CGe8PIinQMiESGXR6mC0JrJdZRNG8qbSoJIsrdM7eZ7tTtTjxgIhle5
	wi5wnOBhx5z8DWYvbRjDt7XuuElqDY6l9Ew69PdSShhyUk8q6I6NRX9uHpuFHA==
Date: Thu, 17 Sep 2026 09:04:50 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, David Lechner <dlechner@baylibre.com>,
 Ayush Singh <ayush@beagleboard.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, devicetree-compiler@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree-spec@vger.kernel.org, Hui Pu <hui.pu@gehealthcare.com>, Ian Ray
 <ian.ray@gehealthcare.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Frank Li
 <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 06/15] Introduce structured tag value definition
Message-ID: <20260917090450.770c107a@bootlin.com>
In-Reply-To: <aqonNkbVqW9tf6Bg@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-7-herve.codina@bootlin.com>
	<aqI3KnnQnUytqkEc@gractus.seuss>
	<20260910094126.4bf4cae6@bootlin.com>
	<aqJ5OhJcv4k-ZAj8@gractus.seuss>
	<20260911091653.37b22b0f@bootlin.com>
	<aqS6HmkaVYbrePtN@gractus.seuss>
	<20260914121937.5b7fa2bb@bootlin.com>
	<aqonNkbVqW9tf6Bg@gractus.seuss>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi David,

On Wed, 16 Sep 2026 15:21:15 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Sep 14, 2026 at 12:19:37PM +0200, Herve Codina wrote:
> > Hi David,
> > 
> > On Sat, 12 Sep 2026 12:34:24 +1000
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> > 
> > ...
> >   
> > > > Do you mean that we should avoid the DATA_LEN_ENCODING and always have the
> > > > 32-bit value right after the tag to give the size for all "skippable" tags?    
> > > 
> > > Yes.
> > >   
> > 
> > I did a test using a dts file available in kernel sources. I used (arbitrary
> > choice) juno.dts [0].
> > 
> > Without any new tags, the size of the compiled dtb is 27067 bytes.
> > 
> > With new metadata tags identifying phandles in properties (FDT_PROPDATA_PHANDLE),
> > the size of the dtb becomes 29027 bytes and so 29027 - 27067 = 1960 bytes for
> > those FDT_PROPDATA_PHANDLE tags (+7.2%).
> > 
> > The tags used are composed of:
> > 32-bit: FDT_PROPDATA_PHANDLE value encoding 1 x 32-bit for data
> > 32-bit: offset in the property where a phandle is present.
> > 
> > Removing the '1 x 32-bit' information from the tag value and adding a 32-bit
> > 'length' in all cases will lead 3 x 32-bit values for a FDT_PROPDATA_PHANDLE
> > tag (tag + length + offset) instead of the 2 x 32-bit (tag + offset).
> > 
> > Back to juno.dts instead of 1960 bytes, the FDT_PROPDATA_PHANDLE will need
> > 1960 * 3 / 2 = 2640 bytes (+9.7%). This leads to around +2.5% of the whole
> > dtb just to have the 32-bit for length. This +2.5% can be easily avoided.
> > 
> > Also, I will not be surprised to see more tags in the future adding some more
> > metadata information and so increasing dtb sizes.
> > 
> > Quite often you have mentioned memory constraints system where libfdt should
> > be as small as possible. On those system, the dtb itself is embedded in the
> > binary close to libfdt. The size of dtb should be taken into account.  
> 
> Yeah, those proportions are high enough that I think it's worth it.
> 
> > If the SAFE_SKIP bit is removed, I even plan to use this now free bit in the
> > length encoding part:
> >   0b000: No data
> >   0b001: 1 fdt32
> >   0b010: 2 fdt32
> >   ...
> >   0b110: 6 fdt32
> >   0b111: On additional fdt32 to encode the length of data.
> > 
> > IHMO, length encoding bits in tag value definition should be kept and used
> > for all tags where the length is fixed and can be encoded using
> > these bits.  
> 
> Well, I'm convinced we want some sort of compact encoding of the
> length, but I think we can do better than the current proposal.  It
> seems implausible to me that we'll need 2^29 different metadata tags,
> so I think we can spend some more of the tag bits on the length.  How about:
> 
>    0x80000000		structured tag bit
>    0x7fff0000		tag type
>    0x0000ffff		tag length
> 
> So we have up to 2^15 (32k) different structured tags each with a
> length of [0..65534] bytes (length==65535 reserved for those that need
> a full 32-bit length word).
> 
> I believe that will avoid the extra length word for everything you
> have currently drafted.
> 

Yes, this will avoid the extra length field. The drawback is the that the
tag value is no more a well fixed value. Each time we have to check the tag
value we have to filter out the tag length.

For instance:
- FDT_PROPDATA_PHANDLE
  fixed data size 4 bytes for offset
  tag value: 0x80010004

- FDT_PROPDATA_PHANDLE_REF
  data: 4 bytes for offset + N bytes for a string
  tag value 0x8002ssss with ssss for the size

This will lead to code like this:
  tag = fdt_next_tag();
  if (tag == FDT_PROPDATA_PHANDLE)
    /* Do something */
     
  if (TAG_GET_ID(tag) == FDT_PROPDATA_PHANDLE_REF)
    /* Do something */

Further more, in the code you will both a mix of both construction:
  while (tag == FDT_NOP || tag == FDT_BEGIN_NODE ||
         TAG_GET_ID(tag) == FDT_BEGIN_NODE_REF);
 
with #define TAG_GET_ID(tag) ((tag) & 0xffff0000)

Also when we write dtbs either in libfdt or dtc, tags value
have to be built with the length when needed.
#define TAG_VALUE(tag_id, length) (((tag_id) & 0xffff0000) || \
                                   ((length) & 0x0000ffff))

I am totally fine with that but we need to have it in mind.

Of course, I can encode FDT_PROPDATA_PHANDLE_REF with 0x8002ffff + length
field but we lose all the benefits

Ready to see TAG_GET_ID(tag) and TAG_VALUE(tag_id, length) when needed in
the code?

Best regards,
Hervé
