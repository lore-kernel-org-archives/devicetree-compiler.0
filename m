From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 08/12] libfdt: Add fdt_path_offset_namelen
Date: Tue, 28 Jun 2016 20:27:44 -0700
Message-ID: <CAPnjgZ1GVaO=64oMj9Xpks35GdSfzcCzeo9eJ5YdXGnRKZrkyw@mail.gmail.com>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160624142757.32735-9-maxime.ripard@free-electrons.com> <CAPnjgZ1ErVW+kN_Jypaf88BUDfBPW9pScgbtqufeDpatPO5oHg@mail.gmail.com>
 <20160626081000.GI4000@lukather>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=Sny8TyH/ElXqnSBf38DfYf3GweWzQ773eToIuXyCAYc=;
        b=laOkU6+mFq3S1Ev3WKxHr8V89B0SxW8iZ/fH+2htDp1DT/fAUX4cClr9/cShQAuzGM
         WwWWIn3s5PkSpCMPrK6eLqJM+7SHHG0V0d2zC92CKzQLMgiSS4UhgCh355G492d22BWV
         EyEpZM3Iswoyr2ztqZNlse7UwLjtyoxU4eQ+mQFK9iBaDP1b/1hKtUeQ9xLgZoxp4PkL
         bSQQURYBUAjmu2DHVBdOd0A20HNsS4AhpxgH5Um6vPYBghf82TwaaN0w42BxjKp4ELAZ
         CDP4QyJ/xKazYGdvr6853kflSlwmbI+wgUfmB4joigPeYA5UQOwRlr7PwlL4K9WPDdJN
         cjBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=Sny8TyH/ElXqnSBf38DfYf3GweWzQ773eToIuXyCAYc=;
        b=H/hp3amgjfhOQkgqrzKF+IuJfiEsqDHp3Fg0Gy6gIonQh2pZ6F2OF0wKyV4FYbLq7k
         Zg5gF3l1DUqXbaJMRWpHZft1fmZ+dw7CsEmn5r48jCz0RnrW3Z/G/G9t2arf53MSl9+Z
         HQG6l18AQ804Usxf9PBbXiL3a8XR5XkvwokwY=
In-Reply-To: <20160626081000.GI4000@lukather>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

On 26 June 2016 at 01:10, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi,
>
> On Sat, Jun 25, 2016 at 08:53:53PM -0600, Simon Glass wrote:
>> On 24 June 2016 at 08:27, Maxime Ripard
>> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> > Add a namelen variant of fdt_path_offset to retrieve the node offset using
>> > only a fixed number of characters.
>> >
>> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> > ---
>> >  include/libfdt.h    | 16 +++++++++++++++-
>> >  lib/libfdt/fdt_ro.c | 18 ++++++++++--------
>> >  2 files changed, 25 insertions(+), 9 deletions(-)
>>
>> fdt_setprop_inplace
>
> What do you mean?

That was a mistake. I meant:

Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
