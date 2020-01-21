From: Steve McIntyre <steve.mcintyre@linaro.org>
Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
Date: Tue, 21 Jan 2020 17:18:39 +0000
Message-ID: <20200121171833.GG6796@tack.einval.com>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <20200113181625.3130-2-alexandre.torgue@st.com>
 <20200116005741.GB54439@umbus>
 <d2594b79-a45d-dcac-3642-90016a1408b8@st.com>
 <20200117090937.GU54439@umbus>
 <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ@mail.gmail.com>
 <20200119063916.GD54439@umbus>
 <CAL_Jsq+-O0cpw9YtVGAjFWstu-=uXVgK0ccgyRj+bjR93gPriw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=haPd6HRvqtRLXCPbKwJIqyrzbzZjxA8VnTnctWQzHDQ=;
        b=V3RDjf48Ukt0EGvEB2uID5QG+IuQGdlsKsBAVfkHlSYnb1Xv93A92YrzpguYKFALWI
         UwIZfxIyimaFSUW5d1y+/EfTV74zGVbxhVkaqVP5s3Dj/Fp8aGAV14uIUA1uxF1DcH0t
         IKMswMCWnZZAho3mplkrBDA4RWxs+38kvWH7rLKoCuTPmacKNYUmYy8IN5WbvoHEQ4Ne
         vOeM+eEFSyArJLkgVd9mSSrMIDM7q0j/H19ogL07dQcQxb+61IbdnpGi5L5TCbumgBeT
         wVFOsETaP1NSsMRYE1RFOxbzKT+JBGaWUwNML4Qw26nxXiXxeOwzaZCRpHX5g2POwMzA
         Op6Q==
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+-O0cpw9YtVGAjFWstu-=uXVgK0ccgyRj+bjR93gPriw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh+dt@kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, Alexandre Torgue <alexandre.torgue@st.com>, Frank Rowand <frowand.list@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Simon Glass <sjg@chromium.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>

On Tue, Jan 21, 2020 at 09:59:44AM -0600, Rob Herring wrote:
>On Sun, Jan 19, 2020 at 12:41 AM David Gibson
><david@gibson.dropbear.id.au> wrote:
>>
>> It's not really about who consumes it.  It's about defining a
>> namespace for the new property to exist in, since it's not part of a
>> relevant standard (if we wanted to make it such, we should pin down
>> what goes in there with much more precision).
>
>I can't think of any cases of the 'linux' prefix not being about who
>consumes it. And we often end up dropping 'linux' because it turns out
>to not be Linux specific. I don't care to see u-boot,build-info,
>freebsd,build-info, etc. when a given dtb can only have 1 of those.

Yes, exactly. What would happen if somebody (tried to) fill in more
than one of XXXX.build-info? It makes no sense.

>My intent is this property name is added to the DT spec, but I don't
>agree we should define what's in it beyond a string. It is information
>that is useful for humans identifying what the dtb was built from.

Nod - defining this as a free-form string lets people put their own
information in, without us having to try and agree on a full spec
which we'll need to update as ideas change.

-- 
Steve McIntyre                                steve.mcintyre@linaro.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs

