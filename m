From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Home Page of dtc is gone?
Date: Tue, 27 Sep 2016 13:07:59 -0700
Message-ID: <57EAD19F.2060404@gmail.com>
References: <1f25b3eb-efbb-561c-1eff-f3daebdaa80a@redhat.com>
 <20160927052513.GA5956@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=KFB4vo0uWJXVChNTXhC+vuK+obfuRO88xZoEb+gmNmA=;
        b=kjLdL+oQnsmB2Op9yrNam04pzeD1OGASqbDdK7v9h7nCZk4s2WaiFeFsDTjzfT9Bkh
         GDo5lysKkn3R6pzUpuZ/KXNpWGebkwpW/4r5lnthN5usXfe1RlPxDckGF6Gr9vuGG2Ui
         oajxLV3UO1dHH0lx1QBRYDEVxBpI1Tt/QOygBA6DHE6ia9AI2nsss6TDmaF0Rl6JCfR1
         EFXWhca7OhisfuZZZvdDvLDYr7EBxH1PyDpK8/SbDUuZbXb+mKDk3Zqu20p1INYMl0Ls
         xM8bR/wWwzwoeD7MCLyCp/5ZI5FTE12PygQwm7W1apDQEFb5i24elYZJm9ZrzyXoh2xZ
         OA9A==
In-Reply-To: <20160927052513.GA5956-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Thomas Huth <thuth-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 09/26/16 22:25, David Gibson wrote:
> On Mon, Sep 26, 2016 at 06:18:07PM +0200, Thomas Huth wrote:
>>  Hi all,
>>
>> according to the README, the home page of dtc is:
>>  http://devicetree.org/Device_Tree_Compiler
>> However, when I open that URL in a browser, I only get a 404 error.
>> Seems like the Wiki that used to be there is gone now and dtc needs a
>> new home page?
> 
> Ah.. I'm not really sure who looks after the devicetree.org pages
> nowadays.  I think it used to be Grant Likely, but I'm not sure if
> it's still him.

The devicetree.org site has been re-purposed for the process of updating
the device tree specification (previously known as ePAPR). The old
contents of the root of devicetree.org has been relocated to
elinux.org/Device_Tree_Usage

The most recent version of the Device_Tree_Compiler page (according to
https://web.archive.org/web/20160326052957/http://www.devicetree.org/Device_Tree_Compiler)
did not have much content. The contents of that page is:


   Device Tree Compiler
   Current revision (unreviewed)

   The Device Tree Compiler (DTC) is the toolchain for building device tree source files (*.dts)
   into the binary format (*.dtb).

   libfdt is a BSD-licenses library for manipulating device tree files. Since it is BSD licensed,
   it may be freely incorporated into other software such as firmware and operating system loaders.
   libfdt can be found in the dtc git repository.

   Source Code

   Source for dtc and libfdt is maintained in a git repository on git.kernel.org. You can find the
   repository here:

   https://git.kernel.org/cgit/utils/dtc/dtc.git

   Or you can clone it with the following command:

   git clone git://git.kernel.org/pub/scm/utils/dtc/dtc.git


Most of that information is redundant for README, since README is already in the dtc
git repo. Maybe the best solution is to remove the link to devicetree.org from
README.

-Frank
