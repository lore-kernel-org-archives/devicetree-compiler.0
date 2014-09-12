From: Jay Bhukhanwala <jaybhukhanwala-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: status property value
Date: Thu, 11 Sep 2014 22:11:14 -0700
Message-ID: <CAB8QsTACKQOttReMoAzCYdHN_o1BHD09ViJpTXh5zJUcJh0tdg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=sKTotk2fU0kpuYwh8EaDRFLkqkyweXUOxsAIkt6PcIM=;
        b=D1f1cuTPUgIQmdiuhtylGyJd4gqes/LxN/DWaynH3FUVxIufsm09VXOhUlq8LJNHV0
         n+BXU0kSqrv6sUbRll/e7SLL32m92WaaeMLgziExO22lcY11W1f2eNO1JUkokIYQBOXm
         mbvqytuQRkICZHNtURJJMElx8BS0P9dAFnGtighiadNL3FtpjKS7uDkhYMXXcqPSlrFo
         6aX7sXTN6RQNUqFAHq1DZaRdtGGizGWlh/iYDjxKpmYy7DGfDel71UL/NlxZAQrYKnah
         n+n0WVb2q2t9boeE4wPlqIEmsqyAeWJyUoi0BlvpO4EsMmTIi14Iv4+Y38xStxlbik6O
         Q/rQ==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Can we change the convention of the status property too ?
I mean, since "okay" and "disabled" are different in length, making a
node available (as kernel API calls it), or not available, changes the
blob structure.

Maybe status = "gone" would do it ?

Then, we can change that property *inplace*.

Thanks,
Jay.
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
