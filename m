Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A801C687
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 Aug 2024 15:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725032607; cv=none; b=YA6oulibcQWzdXQrHqNDxzeu1K7D7+fRn3ibOxts9c/4s+Cnn0qTL7TlaZyQGrKOu+i1iwYLfpE4pHZWeDej3s7YYKR8++hcuvIbSNGupG3y1CvoVKoNNzOwfy+WOLnZwfaIMaQ3JimAZF1RfVY1jYo1SGHYY0p/sNjzIevUIr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725032607; c=relaxed/simple;
	bh=gjiloX/8yA2ziOdz0QzSlwh8ntXalNRbkRjCqWkNBdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Aa4F3puiiLQYBwfBEWqw8Lk0Nb7/z/Lb9CRZ75uvv7lkeRFaXFb35+2aOTvMnhvrLpk2EjWnNQumt5HOoiSlozbuMLZ3KrT0Kvi5PJjdTaRZ8EBui3I20EnQ5jcFxM6+qQmOFtSuaaeFOaDLLxC0xFL8xp7Ec2WLyQEL3TSMjuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XzZRfTo1; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XzZRfTo1"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47UFhC0m049318;
	Fri, 30 Aug 2024 10:43:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725032592;
	bh=ixWkyFWqRUcqLLHjbk4qad7v4Kfs121Mnf5xs4S7JqA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XzZRfTo1lldf8B3PA0woUXQfGwqH04pzya8crP3kVoynycNUcZWX40Nc2WI06Xo4y
	 8RMkHkAUwSef+v6Y9sbOM3HBG2y2zAtS+kpNAsxs19599xM4IgWX6vyxlj8RUrb4Ws
	 GyoHY7xcaUY4tordqneuRpZ9eCsNiohgSOw9LVUE=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47UFhCfD002279
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 30 Aug 2024 10:43:12 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 30
 Aug 2024 10:43:12 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 30 Aug 2024 10:43:12 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47UFhB19066381;
	Fri, 30 Aug 2024 10:43:11 -0500
Message-ID: <5a9dc053-d826-4168-a626-8d7f4ee72de1@ti.com>
Date: Fri, 30 Aug 2024 10:43:11 -0500
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add capability to append to property
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Ayush Singh
	<ayush@beagleboard.org>
CC: <d-gole@ti.com>, <lorforlinux@beagleboard.org>, <jkridner@beagleboard.org>,
        <robertcnelson@beagleboard.org>, <nenad.marinkovic@mikroe.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        <devicetree-compiler@vger.kernel.org>, Simon Glass <sjg@chromium.org>
References: <20240830-append-v2-0-ec1e03f110ad@beagleboard.org>
 <CAMuHMdV4oykS9UGdw0xFm45sD6Xkwcz3KPidafqFFsAv6bNKhg@mail.gmail.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CAMuHMdV4oykS9UGdw0xFm45sD6Xkwcz3KPidafqFFsAv6bNKhg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 8/30/24 3:09 AM, Geert Uytterhoeven wrote:
> Hi Ayush,
> 
> On Thu, Aug 29, 2024 at 10:04 PM Ayush Singh <ayush@beagleboard.org> wrote:
>> Allow appending values to a property instead of overriding the previous
>> values of property.
> 
> Thanks for your series!
> 
>> Open items
> 
>> - Appending to non-existent property: Currently am just adding a new
>>    property if not found. Not sure if this is the desired behaviour.
> 
> I think this should raise an error.
> 

I was thinking this at first too, but if we want to be consistent we
may want to instead go with adding the new property without error for
the following reasons.

High level, nodes and properties should behave the similarly. When
we run into an already defined node we take the content and append
to the existing node. But for properties we replace the content,
not append. This is the fundamental asymmetry that causes us to
need /append-property/ but not need /append-node/, nodes append
by default.

When we want to replace a node we do /delete-node/ first, followed
by the defining the new node content. If properties were default
append, we would do the same with /delete-property/ followed by
the new content. If we could do all this over that would have made
the semantics much cleaner and only required /delete-node/ and
/delete-property/, but little late for that now..

So when we label a property with /append-property/, we want it to
have the same semantics as nodes. Which is to append if it exists,
and to add new if not, without error.

Andrew
