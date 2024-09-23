Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F133F193422
	for <devicetree-compiler@vger.kernel.org>; Mon, 23 Sep 2024 08:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727079740; cv=none; b=VYxZ2rRV4lB77Kv0t2xUte0N3bQ028b5EIXGAEb3oB1w6vcdawl4fAzFWx3P2tGoQkgAzGI9m2CjuKojefgo3DToGqayOJsLu4+4UIhiv9UhbSMS2d9OMb8K5F42WsuD+LnS8wEKAfXOs8MW0UtqpUGauiXg8kJy/yWXtY9hvog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727079740; c=relaxed/simple;
	bh=Ha4O/U/K8L2P8ndIMgcNVI4a7z9EVnlcaet3VALNWQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZH0ANjw9FzJi6nXF0+bLGi2YRX2qiw4o7eY53QODZBoSWL0w5sTdvKa8TQFHI447xkN51Ay/BVT48ILukDjilqrTpzHp8jK6Q6kYtJ9AlNxjuBb1R2XnykFOBU2jcOmNfyDIJ4hgRUbXl/FcLjUU2UuR3YQ4aneumsM/sdq835o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ddccc408e1so28662057b3.3
        for <devicetree-compiler@vger.kernel.org>; Mon, 23 Sep 2024 01:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727079736; x=1727684536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mpDCm8HrL2TBWlC/LtMVSNIqQLsjvkGsX6pwj1miBKA=;
        b=u0UP9jLTQLUGomNZkXeaL2GECchGNJSFGc+PKJX5+7D0Z6r/aqFfJZ8VI6pJ8ro3KD
         HW+hdbfCDDvJbuAuS/QvWzhituvyYgdQhr+i/5QEIqQDCVhQz45oDAZ40LRBwQTn15si
         J3Rqh1ttRtWF4Uxt8EA1wmPLTO5jkcMlTBYyZSXIuimhUG+ru8Xv9hwdSBYrVcYpUa3Y
         chWAmHJV/+IHBgoKezAsZeFo1kiCqWh+g9rmTvxRsaZUHIMsS5Nf60X5qlDXsKq/4MmR
         CQQK6qTAHSAJlcSXBvrDhkosQW/7ZcmQHFiQZHdbmKO29EASZOCJ20DXqUD4AkxbLJIn
         8Wvg==
X-Forwarded-Encrypted: i=1; AJvYcCUAynb7FuTLf0phWH7xH64v/F0daX3IENsMnKpoYfVfuZDEdGEUauDd+TY6Tgdj1poIsQLUJk9Vy39CTsRK9L8yangi@vger.kernel.org
X-Gm-Message-State: AOJu0Ywaj679MPGViaBgKjLxbNLMlfGPw2v80pU1m2TlL+OafG1UUlT0
	j1BgGW2OA3X0fYAMGOcKkzDvm0W7Z8AqFGEb+h04lqE3pywSJxuqA0qJ+eT6
X-Google-Smtp-Source: AGHT+IFKlWrVKICp3XsYSe4U2mD8byM2Y6GpOJBshVEk2JyCgc+5Fz25xK0EwKBF6a6mG0FE/Cp41w==
X-Received: by 2002:a05:690c:85:b0:64a:7040:2d8e with SMTP id 00721157ae682-6dfeeed0d73mr79946647b3.33.1727079736522;
        Mon, 23 Sep 2024 01:22:16 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbe2e25833sm34019437b3.59.2024.09.23.01.22.15
        for <devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 01:22:16 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e129c01b04so4312867b3.1
        for <devicetree-compiler@vger.kernel.org>; Mon, 23 Sep 2024 01:22:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUlSH6XOgw+OfZ38Rboadrt7gYd9AEr1WoD2jmxAJEKmTTqNOFvyRo3tdBynsJU5gjDA0gKzRqXVx+BIxj6cIwJhcJW@vger.kernel.org
X-Received: by 2002:a05:690c:6712:b0:6b2:6cd4:7f95 with SMTP id
 00721157ae682-6dfeefe5389mr81340567b3.38.1727079735728; Mon, 23 Sep 2024
 01:22:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-symbol-phandle-v1-0-683efb2a944b@beagleboard.org>
 <20240902-symbol-phandle-v1-1-683efb2a944b@beagleboard.org>
 <Zt6Bog4Fqcb89ivO@zatzit.fritz.box> <3f062731-5819-4fb3-bf97-5748be63eb17@beagleboard.org>
 <ZuJiRfTWm8f8YfZ7@zatzit.fritz.box> <71d8be80-8dd0-470b-9881-414c13746eb1@beagleboard.org>
 <Zuo8yWrRPGcqnEwN@zatzit.fritz.box> <705b181e-2242-431f-bb6f-c00e178aa602@beagleboard.org>
 <ZvDjW7W1096FW8XL@zatzit.fritz.box>
In-Reply-To: <ZvDjW7W1096FW8XL@zatzit.fritz.box>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Sep 2024 10:22:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXG32pj=nO9iGTD69QSLY7p9BoASqnMi87LBmBuQg0GAA@mail.gmail.com>
Message-ID: <CAMuHMdXG32pj=nO9iGTD69QSLY7p9BoASqnMi87LBmBuQg0GAA@mail.gmail.com>
Subject: Re: [PATCH 1/2] libfdt: overlay: Allow resolving phandle symbols
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Ayush Singh <ayush@beagleboard.org>, d-gole@ti.com, lorforlinux@beagleboard.org, 
	jkridner@beagleboard.org, robertcnelson@beagleboard.org, 
	nenad.marinkovic@mikroe.com, Andrew Davis <afd@ti.com>, 
	Robert Nelson <robertcnelson@gmail.com>, devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, Sep 23, 2024 at 5:41=E2=80=AFAM David Gibson
<david@gibson.dropbear.id.au> wrote:
> So, essentially you're just adding new labels as aliases to existing
> labels?
>
> Ok, I can see at least two ways of doing that which I think are a more
> natural fit than allowing symbols to be phandles.

[...]

> # Method 2: /aliases

Does the (Linux) DT overlay code support updating aliases?
Last time I needed that (almost a decade ago), it did not.

"[PATCH/RFC 0/3] of/overlay: Update aliases when added or removed"[1]
was never applied, due to me never getting to all of the requested changes.

[1] https://lore.kernel.org/all/1435675876-2159-1-git-send-email-geert+rene=
sas@glider.be/

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
