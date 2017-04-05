From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 5/7] pylibfdt: Enable installation of Python module
Date: Tue, 4 Apr 2017 21:27:15 -0600
Message-ID: <CAPnjgZ1ScL9Z-3W8SyzpVzPk55-f6kRsaHcXDUiT5r_HJrN98g@mail.gmail.com>
References: <20170326190623.27518-1-sjg@chromium.org> <20170326190623.27518-6-sjg@chromium.org>
 <20170403184318.GZ24205@vapier>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=aBm0W9+O+/Tbsjx2saFAQ/+eJjV/0p4Y8KSuQcPt3Ds=;
        b=iLoNOs5i8udDv6QoorDk6m8XkDIcPGFobyUanvHiFxwVv77ybyIsmfB0J4QsLH3KS3
         Iszp1kFzz5TbGMttHlXAWu+vUj/BWxegdqAQ2REabnG66/Qx/VQvkiPpiTwJEoPQiZKk
         hHmC7kiT4KXOVOWRzwjtxwrFhCxbThTmDjtfXtNRBF5sBqCp3I0xPk92gFFcpg8yxrGk
         xs+OuLSBTK7P9A+OY54q6/VYqMQ3S/FXi2GJa0JY6FSle/k2yBSVHvEmD1HstETHesjn
         WdDb8C7jcprKoqpCByJXycvKlDO0PtOfq9W7HHli1AeP4JNTwro23Te2db4bOzDVbBqo
         HMSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=aBm0W9+O+/Tbsjx2saFAQ/+eJjV/0p4Y8KSuQcPt3Ds=;
        b=dCKi1yNSE9f6NYI72KRom3swyEWNZuGfGmYLuCLrhkiCxGVaR7q//KOVKEhzQHs0nu
         5pih3tcM4wmhkNbWf4SOW7T8pQmPgrnOz4mKEVuLqO3CTR36ixf8pJM5LRRESY9pPbkl
         GJQ+PxYFsZJs1TZeydjQZDCoSKJlDLpIsbhaI=
In-Reply-To: <20170403184318.GZ24205@vapier>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>

Hi Mike,

On 3 April 2017 at 12:43, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On 26 Mar 2017 13:06, Simon Glass wrote:
>> --- a/README
>> +++ b/README
>> @@ -50,6 +50,13 @@ If you add new features, please check code coverage:
>>      # Open 'htmlcov/index.html' in your browser
>>
>>
>> +To install the library use:
>> +
>> +    make install_pylibfdt SETUP_PREFIX=/path/to/install_dir
>
> seems like you should just tell people to run `./setup.py` like normal ?
> then you don't have to invent all this project-specific wrappers.
> -mike

OK I will make that the default approach. The SETUP_PREFIX is optional.

Regards,
Simon
