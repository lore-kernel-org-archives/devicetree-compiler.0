Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D689A2F28
	for <devicetree-compiler@vger.kernel.org>; Mon, 10 Mar 2025 05:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741583907; cv=none; b=NsEws3otzjcIlkS2wHIIzwnUUqbAAbuLV73dw0EiIqmkOYBytaIXeFz5iG6atcjNQcnCdKKPb8skF8VTitKCP6Rbag3pmMuuSxCJM14tfTT/l+482WYXWl55rvYM1Mq//C0KADx8l40IbBcMq3U5ZaiWSeK8oDGRUjy83NnMzBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741583907; c=relaxed/simple;
	bh=vZC20NFVRf9aXEJuJyjQEFm0r98BJz9r6lv8eIqTKo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dk6w31L45c3eiPCPpvxRijxZvxC0/vu08WUkd022+jE6cI5oB6bAyGmY9JYUN/oVejfM5kMKVy6KQ1bOBQVQhvLX78SSfdr8XYsdBtCgJO9UFcIL8vk2Abqxe46RQ27iBsYnVbhwQSaljBAfZk+Gi1ewFT67TvDhpnPZsHsK5hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=kq7AkqYG; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="kq7AkqYG"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so7155966a91.0
        for <devicetree-compiler@vger.kernel.org>; Sun, 09 Mar 2025 22:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1741583905; x=1742188705; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jDrq21xVnwfiWpmKF4MOz2t4j9x8q6c1zvWU9Y4jz5k=;
        b=kq7AkqYGedJk0O/aMDf+gEkRuh2kPUyjnyFr4nopiqC/P1N5MBZ5C5PCBSoetm2Tbs
         NvGb0oDSsVBOmZnK5MZk6lMvY4imkdkmnbDeHpOA466bxokusJyFR5BC8vzem0SzdHNU
         yel6uFwGMMJ1zPNVNpExt3mH4R//mJ55Z5UtBgW5zOL79nLEbTi/iMEzcVlp3OSYQ0gO
         arDXPyW5hnK2V1h8G3zqwTv7u+dT8nVYFL/SyHI8Z+2fUCelNf5XRGo+sEI20rHbPHWJ
         05V6zKJz8ZAkUfatf/J4bk8ug90jrgXit+NnXON+m0XQlsH82OR0yORWg7ihvDfImtJx
         wu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741583905; x=1742188705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jDrq21xVnwfiWpmKF4MOz2t4j9x8q6c1zvWU9Y4jz5k=;
        b=ppSVqqz2fGQNEUKCqly3l1vYp+HpybBB4UHdMEVxk7mBxhMZPUDU/qztXZltd49me6
         WRp24KwMqN23ah7Qq43n1CyJXesPkQd1QSC8Mp94q+upuB9h47ctfYz5kuDvl4BUmklg
         x1ladb2eevLxNf2lCdGrxPgUovBpJpy6KgLHc0uCRduVb1HshQjlD4/xnH/vpyimCcbf
         HK42X63298srTKino0+mUwL3PWBAOTwTsaf0gjL+TxbFeN54nue5j8R9FIjm0ATi1xpE
         Xo8yusoCYIlPIzmT3mb7iQR8AmVebiTjHsx/140b4w8Zseb/RHPiR2WP6/c25YJrmAYp
         YJ8w==
X-Forwarded-Encrypted: i=1; AJvYcCXJBxcu7NhoQ7K4L/rUeXp55dSH3GPI7uydN8W0JafD5AAQzXr3TgyCk0gPaw2MuyihqXN5IdH0vxkWMSwVfi9dapyv@vger.kernel.org
X-Gm-Message-State: AOJu0YwvYv16lHohuvhDGA4mXiusgm+B42UKdVRLjVkpLQ/elayKD3Ad
	0WVDFTd3njf1P1LTQfmYc/7VzcjB+hAp51/Jx/oE6+z+cELaqX/mVvbS7RFjwQ==
X-Gm-Gg: ASbGncuX0TsPts6kIANscLzUrq912zI+vqvR4mT69AkfOdUmquY6gjzlNqaPfvQm9jN
	QwjdLboUdo50H6nYVKNAwe5+LHocD61Y5XJo5mVAStU1jpsf5X1LfG9QkMfZPpr9BDTJuBpNLOu
	4J+eIqXioObuPdQ/oe/mGE8AzKj/ICzCuSkXXBDt8sr2NUEkVwc7pDaXlmR6QFEN/qyJcFOhRNk
	ZN4gDg7EiNfxdOcCq+NODBQ9sAKxQQPWzQeytZe8Y8x53/BggMs0pRF9X38S3b/KRhfDBizRT9k
	eGWqWZsyUd9rlQ+cieoB4PXImRwpShOWwNYivNkft9khXsXXous=
X-Google-Smtp-Source: AGHT+IFISg3hKkmnsInO+mKYP9ITxNB2tJPdWAT62Det/NIKQySytyLiUMhzYU6ztiOYn2znnCre5g==
X-Received: by 2002:a05:6a21:a45:b0:1f5:6a1a:3284 with SMTP id adf61e73a8af0-1f56a1a37cfmr9872041637.40.1741583904944;
        Sun, 09 Mar 2025 22:18:24 -0700 (PDT)
Received: from [172.22.56.54] ([117.250.76.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736ade82020sm5653042b3a.17.2025.03.09.22.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Mar 2025 22:18:24 -0700 (PDT)
Message-ID: <a730a8b4-b253-4c22-b232-d396c6f12b58@beagleboard.org>
Date: Mon, 10 Mar 2025 10:48:11 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] checks: Add support for export-symbols
To: David Gibson <david@gibson.dropbear.id.au>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>,
 Herve Codina <herve.codina@bootlin.com>, devicetree-compiler@vger.kernel.org
References: <20250110-export-symbols-v1-1-b6213fcd6c82@beagleboard.org>
 <Z8k0VeNXbuJ3kFj3@zatzit>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <Z8k0VeNXbuJ3kFj3@zatzit>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/6/25 11:06, David Gibson wrote:

> On Fri, Jan 10, 2025 at 11:18:55PM +0530, Ayush Singh wrote:
>> The export symbols node adds some additional symbols that can be used
>> in the symbols resolution. The resolver tries to match unresolved
>> symbols first using the export symbols node and, if a match is not
>> found, it tries the normal route and walks the tree.
>>
>> Contrary to symbols available in the global __symbols__ node, symbols
>> listed in the export symbols node can be considered as local symbols.
>> Indeed, they can be changed depending on the node the overlay is going
>> to be applied to and are only visible from the current node properties.
>>
>> export-symbols are phandle based as opposed to global __symbols__. This
>> allows for much simpler use with overlays as opposed to __symbols__
>> where paths require resizing of overlays as show in [0].
>>
>> [0]:
>> https://lore.kernel.org/devicetree-compiler/6b2dba90-3c52-4933-88f3-b47f96dc7710@beagleboard.org/T/#m8259c8754f680b9da7b91f7b7dd89f10da91d8ed
> I'm not sold on the concept of export-symbols in the first place.  But
> at the very least this commit message needs to explain what actually
> needs to be done within dtc to handle them.  It's not obvious to me
> why it needs to do anything here, as opposed to in dtc consumers.

It would be great if we can take the discussion regarding export-symbols 
here [0].

What do you mean my consumers? The kernel should do it at runtime or 
something?

>> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
>> ---
>> As discussed in the export-symbols kernel patch series [0], the
>> following patch series adds support for export-symbols in the base
>> devicetree compiler.
>>
>> This patch series is mostly a prototype for the functionality. Depending
>> on the direction, next revision of the patch will add tests.
>>
>> Support for export-symbols in overlays will be part of a seperate patch
>> series.
>>
>> [0]: https://lore.kernel.org/all/20241209151830.95723-1-herve.codina@bootlin.com/
>> ---
>>   checks.c | 42 ++++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 40 insertions(+), 2 deletions(-)
>>
>> diff --git a/checks.c b/checks.c
>> index 123f2eb425f4a2f8ac22bfe10a842bf08e296ba1..e577f30a3ed9b762aee073fa1ff9d866f5de60b6 100644
>> --- a/checks.c
>> +++ b/checks.c
>> @@ -600,11 +600,37 @@ ERROR(name_properties, check_name_properties, NULL, &name_is_string);
>>    * Reference fixup functions
>>    */
>>   
>> +static const char *fixup_export_symbol(struct node *export_symbols,
>> +				       struct marker *m)
>> +{
>> +	struct property *prop;
>> +	struct marker *em;
>> +
>> +	for_each_property(export_symbols, prop) {
>> +		if (streq(m->ref, prop->name)) {
>> +			em = prop->val.markers;
>> +			for_each_marker_of_type(em, REF_PHANDLE) {
>> +				return em->ref;
> This requires the contents of the symbol to be defined as a reference
> to work.  Yes, that's the obvious way to do it, but in existing things
> if you really want to hand code a phandle value, you can do that.
>
> This makes it so that trees that would otherwise have byte-for-byte
> identical dtb output don't work the same way.

I see, I did not consider hardcoding phandle value.

>> +			}
>> +		}
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>>   static void fixup_phandle_references(struct check *c, struct dt_info *dti,
>>   				     struct node *node)
>>   {
>>   	struct node *dt = dti->dt;
>>   	struct property *prop;
>> +	struct node *child, *export_symbols = NULL;
>> +
>> +	for_each_child(node, child) {
>> +		if (streq(child->name, "export-symbols")) {
>> +			export_symbols = child;
>> +			break;
>> +		}
>> +	}
>>   
>>   	for_each_property(node, prop) {
>>   		struct marker *m = prop->val.markers;
>> @@ -612,13 +638,25 @@ static void fixup_phandle_references(struct check *c, struct dt_info *dti,
>>   		cell_t phandle;
>>   
>>   		for_each_marker_of_type(m, REF_PHANDLE) {
>> +			const char *ref = NULL;
>> +
>>   			assert(m->offset + sizeof(cell_t) <= prop->val.len);
>>   
>> -			refnode = get_node_by_ref(dt, m->ref);
>> +			/* Check export-symbols if present */
>> +			if (export_symbols)
>> +				ref = fixup_export_symbol(export_symbols, m);
>> +
>> +			/* If entry not found in export-symbols (or export-symbols not present),
>> +			 * search the normal way.
>> +			 */
>> +			if (!ref)
>> +				ref = m->ref;
> This muddles semantic layers together.  In dtc, the *contents* of
> nodes and properties doesn't affect the output other than that node or
> property (though it might affect warnings).  Only actual dts syntax
> affects output non-locally.  This changes that, which I think is a
> very bad idea for understandability.

Don't __symbols__ and aliases already do this in a way, just globally I 
guess?

>> +
>> +			refnode = get_node_by_ref(dt, ref);
>>   			if (! refnode) {
>>   				if (!(dti->dtsflags & DTSF_PLUGIN))
>>   					FAIL(c, dti, node, "Reference to non-existent node or "
>> -							"label \"%s\"\n", m->ref);
>> +							"label \"%s\"\n", ref);
>>   				else /* mark the entry as unresolved */
>>   					*((fdt32_t *)(prop->val.val + m->offset)) =
>>   						cpu_to_fdt32(0xffffffff);
>>
>> ---
>> base-commit: 18f4f305fdd7e14c8941658a29c7b85c27d41de4
>> change-id: 20250110-export-symbols-e2ea3df01ea9
>>
>> Best regards,


[0]: 
https://lore.kernel.org/all/20250225-export-symbols-v1-1-693049e3e187@beagleboard.org/

Ayush Singh

