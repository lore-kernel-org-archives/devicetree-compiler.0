Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793595006;
	b=j5XnMZ2130bDXPQQX5pA1gzysERn4j7oP8cl+3GrbqKwWqRmHGmr3uC8/ri08O23X9gD
	 Dn2iaRvYO5Hz2kfEbfrvCeq7LKHZ/cCbb6paow6S6bWfr0OTMUVoRmB/H7bH2P+5cS5P6
	 1BkJ+s4pOGZVQ99WJN6wEChX5DMGt2AiTuPzY9iRDiT9oU8d4skhr5TN1Q4QGAbqwIMG6
	 lf68Uhlhz5OcVW4pBk+sYQugtoHRv36LYpTmcKT8ACNR2cnWob70ojoKvJxX0Fw+Y9i4i
	 WXQZ2VHlJOX9W64+JjDt5bs8wGueXGIUW8YVLfQGWPkhmMKIbZEHH+jQhm/ddgiIatg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793595006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:In-Reply-To:References:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type;
	bh=dxNQekZFEU1OJuzzurEmcS0nyYSVoImy3I5qmm94xpo=;
	b=v0lk3kF3M9T+iPibNqkbbuJ/RHCe02iRRMXAH3l8oJp8UWQi2/xrbbkLlMG/5yfmLeVq
	 BOh6aUAncN8Glh0toNPAchZkmpozd8wXAbdCJ//CIm2QjQ61uaCDBwv0K+/LNXC5RZfDb
	 kXZMMugZJmKLnC0xUOc1V7yQRuS4m1aduZ1st4HLNQWXny957cp2b7k1Eq6vwCf4ajUDP
	 FaLUH7JbLi7uL63Jgpki2+E8+NbQq0+OEX9UhrikzfHTosTgTtp6cjdCjUiUA5wXjYukp
	 /jq9HY9hI7+r5MFfYFsWSPyq1Sc0uEo6vMMtWjZ6lFhNcanRzWGXzVuIRxJ66MTOY3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VOjyz6C4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37233606A324
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 04:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37233606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VOjyz6C4
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1931ff67a29so4529534c88.1
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 20:50:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793595005; cv=none;
        d=google.com; s=arc-20260327;
        b=qp6yKbjtev+UTU7HHfB8OeJmWN6PdLdI4x6uBCrQV45u2rQKEoKVK1Ev6mXO8NKFlL
         QRO2iO0VkQzfV9tKHAp+lNdTB941GddJwv8WiJ4l6qoSmiLnmB7lN6MLwhyIlj2VbZba
         5eTTvECsJQG2aiSrGIB53l5pyvMFx1OOaY7/tZ6dSvQSVygGgR1HXBdDBk4cxfOghr+8
         ZuDAAwMhQtSXjQMN2KGd0JjEPAJ1y8qVgvjSiQEvpFcWk60LxCZy29MUUxKMP1OeKxUX
         6UPHZ2qFKjrqPkE4pfchjVKNE3dhQvkQ3SRuVsJ+tnBbUBl0REqLmNgbuTr9Cs/nu/wy
         S1fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:references:in-reply-to
         :dkim-signature;
        bh=dxNQekZFEU1OJuzzurEmcS0nyYSVoImy3I5qmm94xpo=;
        fh=L4Y+weLqdJ9n/7zBZ0D0vAugJ4mt5vQezJYIsYndnAk=;
        b=Ao4fKJLmidVjoG57j+N0SBvpIlt8BBsevS5nLJka9E5UmcAvaYVOf11netP3kO9td/
         z7CIXMsfaytQU4/CqBltVa5/l7EKvTaPEVtaUL1cXxS5uy22BMx42TTirDhpjtPLPLH1
         ILGooib3gTP73JmqgZ2Yg6Zq050L+oU9plmlLU79/UDMPv9/wyXzvzEfQp60ZrpRsD5U
         EF4uuYw7sX0Ja7f2WwE9p5grInHdL8ChV+bijhRmQWuTXwTfbw1p7P2le7iKrVRhA/Fk
         FRAO0mwXHZWtZEu4hLI+8lhf+2JI+0PuiPeU96Bny9+GtvoRX7728RWLD1/GPvnkQUHa
         Nx3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793595005; x=1794199805; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxNQekZFEU1OJuzzurEmcS0nyYSVoImy3I5qmm94xpo=;
        b=VOjyz6C45mF+PRXZXNwfOFUMFXSLv9Pb7WJpj5algx5Q+Ag8xi3TZDbarqVJziV99j
         w4IpB3LhMKKfI9rLtARF1YYpSE6mvywGfO0n2jxBv8TNGH1YIWP24X5RkhdhmI1P55XO
         vNrXwACubPyURUU521Y2k1NQK0ooYEpuUUxX0Q0nSw5Sl1JuGOBklu4RcgNqEop8AkXX
         8w0fDXnO2MpCazJYQGXm/CwlCbphvaBuPZiDaPTkwToPwFL45d5fLGlU256vcxjW0sBi
         yqzElubUmjfZun7wOm98s/8vSTsxIES74uomM/eHK4UDfSfBt1qjsDZHc24GxfD8VftU
         bi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793595005; x=1794199805;
        h=content-type:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dxNQekZFEU1OJuzzurEmcS0nyYSVoImy3I5qmm94xpo=;
        b=fdSoxdNsauQDEr9BQ4f3/g0uj84WTV/RhP9DhRm5KEJJLyb+IPr9ZSGAKAl/LRUwh8
         pihJ7QWsls9WLL08HxAEc3BofTaRswuRTmbLvVA/XGFb4/aEi0ulE5Mj/Xuxow2TQB26
         Z2mVOaZPAovOvkUcVe4eruV2PNzuZ9ZN7JPal6ldW86BWFNXrWx1rPw0E6WbP+5iIFhC
         ivTqk2qaD4BftqFbBPUtfiEKzAr0xqiq4MqsEW8440J/nopqCD+MaNkjYi5q4Rc+N8ow
         Y19jLe1mFlecJYInGb2LAFVotEuoz9V2ztpdhfkk8Fz9GYNu00s1qGxK/gBuC57L9PlX
         LHIw==
X-Forwarded-Encrypted: i=1; AKwUvBwb8iW4vEiumjpcpaajcSYxWRU03qqldyFxzUXX3rfT0K4T4DRAP3bUa2h39kb8A6HD9RfWyesWH/7LTowKdJjHHG9t@vger.kernel.org
X-Gm-Message-State: AFq9FYKIzv8ILEtO2cK6NWjKTyq/0tdninQ/4AfDNUqX3168YT6xN+zN
	O5UT0Z3GFi4U0wBG75wqybBYpSpWE+HnVFHMMEA4UJY+hb+NazGBUpzh9+oIgiQyl9P6babPBt4
	nMOxmlXcKYVxaPr50XysMjDzn/Z5pUT/71udAbgH/
X-Gm-Gg: AYBFou21ABqnu2aS0dKlsquXh61y5RpFBfgBS5Bh5AVq5kFCstP6i2B7DE+Zt2YWAAG
	/EI3QMt3L5S3rQskiNMMqFwnTSnt8m0n22MAXDEKIIvJj1STk40U3bYSSFjVUTvGiHdJRie14l+
	PvhAcAIDWnsgYjhLKSSW5c9EMQJ70iKsbZH1eicH06SoKvo/fLwcyJxxp840AZroeLjq3my6FR1
	44OtFHLwIo3hEOYFDa6ulDRrp73o3peG5gHHo5sAKoHCvqCfQf+BB5yzIHkeMgH/8aoMlkkV+Ls
	sIQ5pqxzIiKe32pE7sPuKWFzFOyasGB/pzR+aAMPMGrsqfBma5lUeD4JQ/kMmxSqgwk2Z/bA+nx
	zWQ4I17QRSRITxvoNeSPF4OjLFx2k8yafNaFoo7m+u/vaBaOG6qUghoDk7k7Yvs/OlmhUFUsj+0
	hQz3SCKkNz1V/kTg==
X-Received: by 2002:a05:701b:42d2:20b0:1aa:6c3f:2f7b with SMTP id
 a92af1059eb24-1ac5b3fdef6mr14736074c88.24.1793595004414; Sun, 01 Nov 2026
 20:50:04 -0800 (PST)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 20:50:02 -0800
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 20:50:02 -0800
In-Reply-To: <augMPBqX8W6FGNH6@gractus.seuss>
References: <CAOSmRziU2Nw2kMVN9VCseiwcuCa0SxBe=d+33=nVnCZxFXkKnw@mail.gmail.com>
 <augI1QfvUaWHR1ZC@gractus.seuss> <augMPBqX8W6FGNH6@gractus.seuss>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Kelvin Zhang <zhangkelvin@google.com>
Date: Sun, 1 Nov 2026 20:50:02 -0800
X-Gm-Features: AclHuK8tgobYSu7cj-Xo5jJeJmWXmH95G0qH9tptxZnfDbnDOhb1I8jI7twc2cM
Message-ID: <CAOSmRzhPML=s4j2R2uaz6gotKTiwi+eSn41t4W2Q38yTwBqScg@mail.gmail.com>
Subject: Re: [PATCH] libfdt: Don't search for the terminator in fdt_get_string()
To: David Gibson <david@gibson.dropbear.id.au>, Kelvin Zhang <zhangkelvin@google.com>, 
	devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

Thanks for the review and suggestion!

> Oh... one thought as I look at this again.  AFAICT this will only
> really save time the !lenp case, since the strlen() would have close
> to equal cost to the memchr().  So, it might make sense to marginally
> simplify this as:
>
> 	if (!lenp && len && s[len - 1] == '\0')
> 		return s;

Agreed, when lenp is non-NULL the memchr() path already computes the
length in one scan. Updated to that in v2 (along with your Reviewed-by
and shorter @@ hunk headers so the outbound mail gateway doesn't wrap
them).

Best regards,
Kelvin
