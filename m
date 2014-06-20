From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/4] Microsoft Visual C patches
Date: Fri, 20 Jun 2014 07:32:41 -0600
Message-ID: <CAPnjgZ1db_U9Y5cq0xOEkY+1ZmVR2od01s4D67GL_merVK=bsA@mail.gmail.com>
References: <539DBFC8.4050204@errapartengineering.com>
	<20140616104628.GB29264@voom.redhat.com>
	<53A1C5FC.9040105@errapartengineering.com>
	<20140619111459.GM29264@voom.redhat.com>
	<53A2F104.90701@errapartengineering.com>
	<20140620125528.GB16801@voom.redhat.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=4GRIfstWIrPKfwRStMvWi98uEpaP4BcvkgPi/Y3ShsU=;
        b=RIbKcgd8f+t4zuwzJ6ymApxID5hU1k1Jej49kdOYQNsFSmOYaUxHXvxnRV+GH1BZHT
         TaN3mbOWXKjfr/RX1smcEfzZfZ2lTAqtpVHB06Ew/sc2x5gieDsZkaTAWAX5+ctLN1fj
         uGvApfpVEsPYVN3RZzKOKTfYk3ElqlQkTAhJk7a2rBLf15CkCNoPVPNeUquyusyHblud
         A5AJwm58HZAYcLAJtZ1sR9ObzcVTJcaJsTWp1zimJbD9NowqVC+yuP5UueKXycTeAixC
         OPWR/OEpiUrhLtAxpjK8KRrJkuE8xNbcI1BadskqwOdFI+as0ocv8zXze12AwUGVwLlb
         0LVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=4GRIfstWIrPKfwRStMvWi98uEpaP4BcvkgPi/Y3ShsU=;
        b=GDzmmi67SbxP66NI27tsDxg0+68cwMjnxBQHeJ3IWMBAoTiRLsV3TLohx/rJHDkMHP
         7gHpqM69PCk/PJA+WFoCLlcRrBU6etBLxaW/6oWwZdx8d9XzCc49ibzFH7GnaXjAc1Ff
         /VwaB4fhQ5sb7Tu/F7g5RbLimcmYe0qDZFPMc=
In-Reply-To: <20140620125528.GB16801-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Andrei Errapart <andrei-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi,

On 20 June 2014 06:55, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Jun 19, 2014 at 05:17:40PM +0300, Andrei Errapart wrote:
>> Is there an automated command to format the commit message per the
>> requirements?
>
> git format-patch should do it, or git send-email will format and send
> out the emails for you too.
>

Try patman:

http://code.metager.de/source/xref/denx/u-boot/tools/patman/README

Regards,
Simon
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
