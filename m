From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 0/3] Fix some code nits
Date: Sun,  6 Mar 2016 20:12:45 -0700
Message-ID: <1457320368-27248-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id;
        bh=noRYNusJAl/diQ4p0vA8/XaKK9rld3zPcHhM1515eeQ=;
        b=HGsOms1hHo0cCl6L8gS/0ocE7tm2kRIRBUhZS5LQXFhe+SEL0mFG2o/IxRkmzFW1xF
         xHkpgKdJTySVIlfflKogLNqMDH/vtye8tTpQSkqFx5JjY4zn/moLhq3iL4u5t07gTgG8
         rOWDdIjux9e1J/31p0Exah2+iOzLkmpkSCFDxNhBW0JatKS84jCZ1jHoo0DfhpgvU/GH
         p4kaqk5HJ0wuVLPwwjFhowEg1hBHnO31ABNUTBMJ9DIoQHv4WFlcN22b8ug/FflGITnT
         GyR55prmL0WrFvyxrWa3fDPrNUp1n8AK1nwHohozU3yTHc1dlaULUGq0ehYdyRkZRhxb
         zvqw==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

I notice these when I sync with U-Boot's copy of libfdt.h. I'm not sure if
they are considered incorrect in dtc, but here's a little series anyway.

There are still lots of places that use eight spaces instead of a tab. I've
assumed that is intentional and left it alone.


Simon Glass (3):
  Correct space-after-tab in libfdt.h
  Correct line lengths in libfdt.h
  Correct a missing space in a fdt_header cast

 libfdt/libfdt.h | 60 +++++++++++++++++++++++++++++++++------------------------
 1 file changed, 35 insertions(+), 25 deletions(-)

-- 
2.7.0.rc3.207.g0ac5344
