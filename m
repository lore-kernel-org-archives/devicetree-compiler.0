From: Radha Mohan Chintakuntla <radhamohan.cta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: fdt_setprop comma-separated cells
Date: Wed, 21 Sep 2022 17:35:19 -0700
Message-ID: <CA+Nonppng=cKrpwqz6YxiVLikvgZGeuYBfdEn3jH8fW49070Xw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=Lupk7ynnW8n8NVQtDnPwsw/EMZwFpUEJUO9I4d1ev7k=;
        b=QelZNlGAZxjsq8wHqdnsaPQIhALFbOSidVuzuY4+E6tNoYj59mraIG5WlLlSHbXsm3
         3QFarF035Dk6X8BT9OUWQL2uJafErSv0jS4dqpFluEvBt053cijYq6fykX8269Q/uUat
         9zysPzKzUlWrOSjl2VUJSHRSkys5vsWfwa7V7fLL6Z3HnPIG3OpiRAJaj+3bWsKAmjes
         O6v+ZaHdbq/jVJXL6FI/UBpD456v1jkqMap9ORZUwrEPIXCe6JsQC0UHfTUPh/P0M8i3
         cHZJXseepYnd/rUrA/3EXw8Qt7nW5xWPxr96gI9TAOSyVHSmFo9hsd2jGQIim3XJwWj0
         67Uw==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi,
Not sure if this right forum to discuss this issue.
I have a requirement where I have to update the device tree property
with comma-separated values. If I use fdt_setprop() and pass a
2-dimensional array then it is not creating the property with comma
separation. Instead I get all the values in same cell separated by
space.

Is there any other way this should be done?
I have referred to some uboot code that used libfdt and does same way
as me but even that has the same problem.

Any suggestions please?

regards,
RC
