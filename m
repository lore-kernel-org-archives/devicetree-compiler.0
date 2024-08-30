Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EBF153511
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 Aug 2024 08:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725005414; cv=none; b=R6W+x8dHRew3d76QPJDKQMNHrzuySJklm+VVo4X5L8ehyEWA9R3KoxegjQe4Q9XrqFSoAGzXwpfexORI/ovWHd5c3XkWtT41p1w9j9iRxp0v82djArpi/NcODBx/LcXfwrZhsSopYzfmSSiwJNWawaUOq6yx0lId9MBSpGdALvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725005414; c=relaxed/simple;
	bh=eCNUfMVN0tSHi9VPm+aJqDc6ouTsCRXiaeeU9xfA7YE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B82hYX1w1L7VKFC6EnRyEiLNN69gXN2HD9AYTa8Pn4B34Ns5mot9hRA4qZw/r1+cSZNzi3a0VRW5FZMZtWNfzlNXLtM5j9O8zUmgs4V+x4g39ZxMziBwciYzlensom+E3tuITMHiquFWduBknnH8iuWjtRidCISfQmHZv9m5OZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6c91f9fb0acso14398017b3.2
        for <devicetree-compiler@vger.kernel.org>; Fri, 30 Aug 2024 01:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725005411; x=1725610211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJl6z3m1pOFfEyw4Q1vi5Aq4ZQqpgUgI08Q//756Tgs=;
        b=OTf7bgO7gZLoh7dXgWjOJcGg31t1RN7600C2t6+1hiGnWIOBhoLN0DuMWS55zBDqq4
         VnMWkczpSn9UhpBmMsRtDLV2V6PnNG8ULaWJ8qKlCAX2udlitWlJqkXr5nGR+M+kN8s9
         GggtZ8cYQgmny1TNb9t7a7op5bfwFKEmFhEx1W1jDqGKNkNNfW8ifHkNDijqau8+sEUW
         KPXhWYSKOYmAS6nS+MOZB7FUkDqO+08USEOm6BN3qLc4G8TL4bcRFesme3oV9x3Efart
         w2AY8rGw6H/yQ0SkeNMbKb8TdPtL40xO6oNuCwbGspcEDhQbyKpUudfcFr61I45CrgYM
         Ttkw==
X-Forwarded-Encrypted: i=1; AJvYcCWMPkDhaT+2i3rGfIaQTYL5KeqKOUQ7nAK6pbFsjmaLfNIqDi7vl39qqXgxQ0cDQIxNqjDjh+FORQMCmAiJ5GcY7tbj@vger.kernel.org
X-Gm-Message-State: AOJu0YzDQqqjOE+H5XX7ZHrZxV+Vrp2liKi2rsHkIu2hp+K+6Ofncrfi
	TOaeZKXGOifvHaRHKtdyKCRSzCTj5d0F72x6hwGnHoj04rxalzwbloN/QK52
X-Google-Smtp-Source: AGHT+IEbXqFfHjC8tJ96Fsd9MDnbycdR0R+BzePOA6SzCTXbb3IskfJUDDuVsK8cFCbAIp7+59n+LQ==
X-Received: by 2002:a05:690c:60c7:b0:64a:90fe:9108 with SMTP id 00721157ae682-6d40f928468mr12385517b3.30.1725005410989;
        Fri, 30 Aug 2024 01:10:10 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d5daf53csm5378597b3.107.2024.08.30.01.10.10
        for <devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 01:10:10 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6c0e22218d0so17027917b3.0
        for <devicetree-compiler@vger.kernel.org>; Fri, 30 Aug 2024 01:10:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX5/VjE1cB4vdrcc9WVT0KlLPLb12ROl3ifg/AXmHkZV8sJ4ROn4pvdyQKfi8xgI0+Y0fvtkJJi84/j4GA87xk1ncZ8@vger.kernel.org
X-Received: by 2002:a05:690c:3001:b0:65f:8209:3ede with SMTP id
 00721157ae682-6d4102fbdeemr15130127b3.44.1725005410446; Fri, 30 Aug 2024
 01:10:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830-append-v2-0-ec1e03f110ad@beagleboard.org>
In-Reply-To: <20240830-append-v2-0-ec1e03f110ad@beagleboard.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Aug 2024 10:09:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV4oykS9UGdw0xFm45sD6Xkwcz3KPidafqFFsAv6bNKhg@mail.gmail.com>
Message-ID: <CAMuHMdV4oykS9UGdw0xFm45sD6Xkwcz3KPidafqFFsAv6bNKhg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add capability to append to property
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
	Andrew Davis <afd@ti.com>, Robert Nelson <robertcnelson@gmail.com>, 
	devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ayush,

On Thu, Aug 29, 2024 at 10:04=E2=80=AFPM Ayush Singh <ayush@beagleboard.org=
> wrote:
> Allow appending values to a property instead of overriding the previous
> values of property.

Thanks for your series!

> Open items

> - Appending to non-existent property: Currently am just adding a new
>   property if not found. Not sure if this is the desired behaviour.

I think this should raise an error.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
