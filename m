From: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Subject: [PATCH 0/5] annotations
Date: Mon,  8 Jan 2018 14:36:42 +0100
Message-ID: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

These patches pick up on Frank Rowand's previous efforts to annotate
compiled device tree code with file names and line numbers.  Two new
options are provided: --annotate (abbreviated -T) and --annotate-full
(abbreviated -F).  The fomer provides short file names and line numbers,
while the latter provides full paths, and starting and ending lne and
column numbers.
