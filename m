From: Ryan Long <thisisryanlong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Unchecked return value error in fdt_rw.c
Date: Mon,  1 Mar 2021 17:24:09 -0500
Message-ID: <1614637450-4972-1-git-send-email-ryan.long@oarcorp.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=sJyP8OJHr+M7qSK+I4eLamsk3aowFgG+x7tLDHPxbsI=;
        b=NMgRYT8WtTBt6LGwLMIux09tj/IaQLusXkaGg1F3jFblewpxnV+ejvYMQ/G8IqBgko
         YjnOqnIzTuFjM4Lee7YvAkfHAcHXgnKMdc4axG+ZIBqjq3c8R3nlgooz90k4GqsvmNbZ
         krLU70hfpr6KLdkA6VcSeYBJq3GNnbafXhP8dRo1XhLuuvee82fxa42Swx2pB3nvO/EM
         iNTfsssOdaKh3ZR0yCWb13gVwezSW07G1J463RQeVdEBC6+H+5qdqB0WvWwcJx6wj/gx
         Lh51p1YoqPnGWscPq5TV+4qiho2VfiYa5BDgW9fFHp5TjbRYAi4pDXz6/kfbl8aeUiXc
         gOAQ==
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ryan Long <ryan.long-lGxtRh3/QYtBDgjK7y7TUQ@public.gmane.org>

Hi,

I filed an issue on github, but I was told it'd be good to send this to
the mailing list as well.

RTEMS (RTEMS.org) is a free single process, multi-threaded real-time operating 
system with a long history. Your dtc toolchain has been incorporated into 
RTEMS. The RTEMS Project is a member of the Coverity Scan program and it 
flagged an issue with /dtc/libfdt/fdt_rw.c. In trying to be good citizens of 
the wider open source community, the project wants these issues to be reported 
to the upstream owner along with a fix or suggestions. This is one of those 
reports.

When Coverity Scan was ran on some of your code, a "Unchecked return value" 
error was found at line 352 in fdt_rw.c. For similar errors that we received 
for RTEMS, we created a macro that will assert the value returned and "use" the 
return value like so.

int status = fdt_next_tag(fdt, parentoffsetm &nextoffset);
assert(status == 0);
(void)status;

For this patch, I just put the "(void)" statement in front of the
function call, and it achieves the same results. Could this be put in?
We don't want to deviate from our upstream codebases, but we would also
like to get rid of these errors.

Thanks,
Ryan

Ryan Long (1):
  fdt_rw.c: Fix Unchecked return value error

 cpukit/dtc/libfdt/fdt_rw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.3.1

