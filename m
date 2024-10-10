Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280473D6B
	for <devicetree-compiler@vger.kernel.org>; Thu, 10 Oct 2024 06:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728541920; cv=none; b=tm2kmEfdBt+SzFZBeGocmRwJFglZZY71dCEw1yQ8QEUNZ/ezcAeR1FD3jTXJg0aPdeJ0idGa8LKGmO/ksmiAVGU28jkNGLsOyHuqdJEdimGpb9zu8qpXArkUsX0VSUSWCxFcPiy985c7v2KycRRNJEWzIwGMj9vFglmlUYHu5cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728541920; c=relaxed/simple;
	bh=bM4Il0DTWvf4FzW+02bWnQ18HDTXy0XDkpXauq2bL/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n7v0S1hRct9J0uEQGQAxNxn0tBG7m+t2L+/0CGhke8iIfaVR7AquvSLrwEWNH2ldxoRz0pRXAK+/FNrm9St0BP4CgXT8UVsILnhO62nu1we3JOdT+Cflm6/HP1th2FCxLCDrUHPNmKNoyQplZxEldWIGx4sowVpjzXoSGSinQbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=B1m/4sw/; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="B1m/4sw/"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e1ea994edso443421b3a.0
        for <devicetree-compiler@vger.kernel.org>; Wed, 09 Oct 2024 23:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1728541918; x=1729146718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2pDdwL7TfQ9GjMwmhPqt8RvGCCDHufRSDtAc+HRMKME=;
        b=B1m/4sw/5X2NqLcg23OWdsRYKGsK4HFTLubW9DywUySgz0jZWPRJ1dy+gsZoV7IkFg
         hItntwYrY943qaADEjw8gwSrkDSS2Z0WO2EiVQqSapWAV4KRrUhOZG+elypeNXdktUzf
         lgvTzPQoJwrEIJqIAX7I5PKDufOkv5qSD79l78Af9A8o1Wrh73nhxrZ+qTDlbthkUCnS
         Ok9HJcs99sHS5Fu//6VYGYINffRELNJDomPeDC8gFiCLHCGreysGidx/+9P0qnd8+7tt
         Y7YrYOk6jueNNXbDT8e6E5RKa3/60iLch+j9Z8lpYeip6TUykIpeKEGU0dnOnk3K7rIK
         OGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728541918; x=1729146718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2pDdwL7TfQ9GjMwmhPqt8RvGCCDHufRSDtAc+HRMKME=;
        b=EOd4VM+qna1v7YOWI9AOsrQPe2KYcbBwqCNUgfm0vl54FXhgHj43BD/8tYEx8VIRIH
         HV6PCn3ij+QbWZFGXZMeqtzHlSSOXlJTFvTpKxWx2s1Msvj3WjQlqiocOxmsGscXYMvW
         mlldoXfDUz+2ZxRKhrkCMhR3onVeH0l/YLedmq8HxZvSH7RfjB1VOeb4Wyiyn4EFQVFO
         xWyLzI8Yd8oF69JLCTa89oBiSNzeOYcRVueEgXY67otOsN2akoDj9jt2SQyeeG8hZafQ
         4nC5//56N0R+5jjy4q5ffabeIsJkxmUmFjHESkO20ZIWw3nSKdPoruwb73CUts+9CTnz
         C+BA==
X-Forwarded-Encrypted: i=1; AJvYcCUmsRu0+ZGGT3b0OaAYg1CegFV+uyHY20coqEmN0zUUo9IbliNscLcmAwHuDZv7iXXAnl5v9l+w6nPNyQJdUprHttTZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd2CZue64/AgZfhMq2LivD8HqP34I7ENmFexlJkHrfFlKbA3wQ
	+8QDdph/R2CBHJpvuoxmA/WXSoA84aReYq2fUtZTsH8ZbC6Y1OreSjq3//yInw==
X-Google-Smtp-Source: AGHT+IENB7c0r2Rm8ULmMh8jrXkmBnN1Jmt6buEf3H4K5NYZb+sO9aLsuHfSjltUB07fsxq/QJWUpQ==
X-Received: by 2002:a05:6a20:43a7:b0:1cf:ff65:22f4 with SMTP id adf61e73a8af0-1d8a3c68758mr6947133637.41.1728541918333;
        Wed, 09 Oct 2024 23:31:58 -0700 (PDT)
Received: from ?IPV6:2401:4900:1c80:6579:394e:d0e0:8330:8d70? ([2401:4900:1c80:6579:394e:d0e0:8330:8d70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2a9eb274sm408435b3a.32.2024.10.09.23.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 23:31:57 -0700 (PDT)
Message-ID: <24ccf376-2815-4980-b0b1-4ebb78ca23ba@beagleboard.org>
Date: Thu, 10 Oct 2024 12:01:52 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add capability to append to property
To: David Gibson <david@gibson.dropbear.id.au>, Andrew Davis <afd@ti.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, d-gole@ti.com,
 lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
 Robert Nelson <robertcnelson@gmail.com>,
 devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
References: <20240830-append-v2-0-ec1e03f110ad@beagleboard.org>
 <CAMuHMdV4oykS9UGdw0xFm45sD6Xkwcz3KPidafqFFsAv6bNKhg@mail.gmail.com>
 <5a9dc053-d826-4168-a626-8d7f4ee72de1@ti.com>
 <ZuJnIraA3lSBX0l8@zatzit.fritz.box>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <ZuJnIraA3lSBX0l8@zatzit.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

So, I would like to push append support forward since it is useful even 
outside of connector overlays. I already have patches that handle the 
annotations properly as pointed out by CVS, so let me try to answer some 
stuff here to revive the discussion. Personally, I do not really have 
much preference in the syntax or the non-existent property thing, so I 
would be okay with whatever the kernel wants.


> On Fri, Aug 30, 2024 at 10:43:11AM -0500, Andrew Davis wrote:
>> On 8/30/24 3:09 AM, Geert Uytterhoeven wrote:
>>> Hi Ayush,
>>>
>>> On Thu, Aug 29, 2024 at 10:04 PM Ayush Singh <ayush@beagleboard.org> wrote:
>>>> Allow appending values to a property instead of overriding the previous
>>>> values of property.
> I can see how this would be useful for certain cases.  I don't love
> implementing it just as a specific ad-hoc new keyword thuogh.  I did
> long ago have a more comprehensive plan that would allow for this,
> amongst other things.  Currently we allow integer expressions in dts
> files, but I had been hoping to add string-valued and
> bytestring-valued expressions as well.  That would allow appends as
> something like:
>
> 	prop = /previous-value/, "extra stuff";
>
> ',' being the bytestring append operator.  It would also allow
> prepend, and - with the addition of other bytestring operations -
> various other manipulations.
>
> However, the chances of me ever actually getting around to
> implementing this are basically zero at this point.  I guess based on
> that design we could allow appends with the syntax:
> 	prop ,= "additional data";
>
> Which is, I think, theoretically more elegant, but also risks being
> pretty unreadable.

Well, both of these kind of introduce a completely new style. Meanwhile 
`/delete-node/` already exists, so I think unless there are more plans 
regarding this new syntax, sticking with something familiar might be better.


>
>>> Thanks for your series!
>>>
>>>> Open items
>>>> - Appending to non-existent property: Currently am just adding a new
>>>>     property if not found. Not sure if this is the desired behaviour.
>>> I think this should raise an error.
>>>
>> I was thinking this at first too, but if we want to be consistent we
>> may want to instead go with adding the new property without error for
>> the following reasons.
>>
>> High level, nodes and properties should behave the similarly.
> I'm not sure I buy that premise.  dtb is not like (say) json, where
> "node" and "property" are just different types an entry could have.
> Properties are structurally distinct from nodes (the subnodes and
> properties and a node even occupy different namespaces).
>
> The other important distinction is that dtc necessarily understands
> the internal structure of nodes, but it doesn't necessarily know
> anything about the internal structure of properties (beyond that
> they're bytestrings).

Isn't this a dtc implementation detail and not a limitation of spec. As 
far as I understand it, this whole notion of bytestrings comes from 
IEEE1275 days.


>
>> When
>> we run into an already defined node we take the content and append
>> to the existing node. But for properties we replace the content,
>> not append. This is the fundamental asymmetry that causes us to
>> need /append-property/ but not need /append-node/, nodes append
>> by default.
>>
>> When we want to replace a node we do /delete-node/ first, followed
>> by the defining the new node content. If properties were default
>> append, we would do the same with /delete-property/ followed by
>> the new content. If we could do all this over that would have made
>> the semantics much cleaner and only required /delete-node/ and
>> /delete-property/, but little late for that now..
>>
>> So when we label a property with /append-property/, we want it to
>> have the same semantics as nodes. Which is to append if it exists,
>> and to add new if not, without error.
> Hrm.  I'm pretty dubious about this approach because a property being
> absent is different from a property being present, but containing an
> empty bytestring as value ("boolean" properties rely on this).
> Appending in this matter erases that distinction in the base tree.
>
Well, I think the dt bindings check is supposed to catch stuff like 
this. Since all property values are bytestrings, it is possible to 
append any data type to well, anything.


I think it might be better to think about cases where one default 
behavior is preferable over other. It is important to note that there is 
no support for conditionals in devicetree. This means that if we go with 
an approach to throw error if a property does not exist, we will not 
have any way to express the following case: "append if property exits, 
else create new one". If there are any situations where that case comes 
into play, we probably should stick with the current approach.


Ayush Singh

