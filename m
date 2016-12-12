From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: labels within a property value
Date: Sun, 11 Dec 2016 17:26:14 -0800
Message-ID: <584DFCB6.1070403@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=uHF9YkjUIYAF6VHccEG7BxzQpfs1+xb/CCl7MMiy1o0=;
        b=lnHAwYi2MUakmYcWILKB6w4rO8/cWVh2tynaL2J7WlauBAqYMN3UAISweqHie5HjHp
         P5zvFThbVrz642UYUc7hDA2AA14Z0oOOz9RcvUb2t3pB92BQJONKVbPWh4JD6L2JEr0R
         lIZZBIEQHWJdXMjuKXaRDou8zn7LyWwuoks6yWbaaquDqjXaWI27EE5AB08UHir/cf72
         idjj5caNIhctRkvG/e2IFD++4P76vI4BUL8eDwPcjpQKbFFzGHyK6dhi27mQoMJbcdA/
         m/SPnU0lvvkzis30pwpSoKR1hu7fwwWGqpFCrCJ682cSMtNqYEujHzdlK1fJBcRNxu5F
         0Ifg==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi David,

The ePAPR in Appendix A (page 96) says:


  Labels may also appear before or after any component of a property value, or between cells of
  a cell array, or between bytes of a bytestring. Examples:
  reg = reglabel: <0 sizelabel: 0x1000000>;
  prop = [ab cd ef byte4: 00 ff fe];
  str = start: "string value" end: ;


The dtc compiler indeed allows placing a label inside a property value.
But when I try to use that label I get the error:

   ERROR (phandle_references): Reference to non-existent node or label "DATA_1"
or

   ERROR (path_references): Reference to non-existent node or label "DATA_1"

The three test dts files are below.
test_label_b.dts has the usage of the label commented out (compiles ok).
test_label_c.dts tries to use the data label as a phandle (gets first error).
test_label_d.dts tries to use the data label as a path (gets second error).

I am trying to figure out how a data label could be used in a
reasonable manner.  Is this maybe a construct left over from
open firmware?  Or am I trying to use it incorrectly?  If there
is a valid use, can you provide an example?


$ cat test_label_b.dts

/dts-v1/;

/ {
        #address-cells = < 0x1 >;
	#size-cells = <0x1>;
        soc {
        	#address-cells = < 0x1 >;
		#size-cells = <0x1>;

                PIC_3: pic@100 {
		        reg = < DATA_1: 0x100 DATA_2: 0x20 >;
                        interrupt-controller;
                };
        };

	uart@200 {
		reg = <0x200 0x10>;
		interrupt-parent = < &PIC_3 >;
		/* my_prop = < &DATA_1 >; */
	};

};

$ cat test_label_c.dts

/dts-v1/;

/ {
        #address-cells = < 0x1 >;
	#size-cells = <0x1>;
        soc {
        	#address-cells = < 0x1 >;
		#size-cells = <0x1>;

                PIC_3: pic@100 {
		        reg = < DATA_1: 0x100 DATA_2: 0x20 >;
                        interrupt-controller;
                };
        };

	uart@200 {
		reg = <0x200 0x10>;
		interrupt-parent = < &PIC_3 >;
		my_prop = < &DATA_1 >;
	};

};


Thanks,

Frank
