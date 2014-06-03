From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RESEND PATCH v3 1/3] libfdt: Add function to find regions in an FDT
Date: Mon, 2 Jun 2014 21:12:55 -0600
Message-ID: <CAPnjgZ2OHco3GjH_rPC+7Fu36QqBK2_sWvcaF1WOWFpBNkZTcQ@mail.gmail.com>
References: <1395500836-12735-1-git-send-email-sjg@chromium.org>
	<1395500836-12735-2-git-send-email-sjg@chromium.org>
	<CAPnjgZ0ehgSd1WprpMd1ZY=LaZaKkBG3MaNPV5ja27Q2p12WvA@mail.gmail.com>
	<20140502054014.GF6035@voom.redhat.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=xRn3xcn7MSjRecXXBNUN1TfF7nsM4Z356ZB202AAlJ8=;
        b=Ggd9ZnAuCiqNa3l/KVZTMFUv2ex1453Q913IP2cN9nFz7/TOQCCv4GTsvVyDpTtpoS
         e982nZlMtM72PHKdMkBOGel5L+o6od7bGD7QVlnitARskMtvODOQyZ3ncz/QJjA94MyX
         wt4QLuy8kxWvF6sEq44ng5NzvxyFxlPEPxHpB2+QdiCOF2nef2vRiHkw/c9eaPa/yAbf
         ho9V2bwXFuQnTGMgkGgXHFBSbbhOUMGyahm4w5T0Lou0A+oEzSv29HWcJ3oHBq49B8yA
         9F8tpEyOXxBC4KBV8Yr1N0ujNiF7tYeo0VfnZgwxmzkMlWiguEbUsochkoxXn0BT8d8P
         I6kQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=xRn3xcn7MSjRecXXBNUN1TfF7nsM4Z356ZB202AAlJ8=;
        b=HKH3DHPu+0WKGbYO/ixM/8cTfjewUq68GAcOkYuHxwckZBuf+abzs/33mSF5zm8byM
         jEpDOZeISAqpvOpjzhFCwxdUnwjEf/OVP2hXXYUUYbRdrKfd3RJOlfYTWKVaPc9L4l+v
         OU3MSAaMEB+RmJv18PQRoLbyts82aeHpFlTTo=
In-Reply-To: <20140502054014.GF6035-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>

Hi David,

On 1 May 2014 23:40, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, May 01, 2014 at 09:13:51AM -0700, Simon Glass wrote:
>> Hi,
>>
>> On 22 March 2014 08:07, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> > Given a set of nodes and properties, find the regions of the device tree
>> > which describe those parts.
>> >
>> > A test is provided which builds a tree while tracking where the regions
>> > should be, then calls fdt_first/next_region() to make sure that it agrees.
>> >
>> > Further tests will come as part of fdtgrep.
>> >
>> > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>
>> Have I sent this to the right place? Any comments?
>
> Sorry.  I know you've resent this several times, and I've been
> procrastinating about it since forever.
>
> Basically, I'm just not convinced.  For all your efforts to explain
> the rationale, it just seems like a really ad-hoc set of flags and
> conditions that doesn't seem to form a coherent whole.

Are you referring to fdtgrep or the new library function? I'd be happy
enough getting the library function to start with in if there isn't
much need for the grep utility.

>
> From the lack of other responses, I'm assuming there's not really
> anyone else who sees it as a compelling feature either.

Is there normally a lot of mailing list traffic for new libfdt
features? This is used for verified boot in U-Boot for example.

>
> So, sorry.  For the forseeable future, you'll need to leave this
> implemented in your own code, using but outside of libfdt itself.

Regards,
Simon
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
