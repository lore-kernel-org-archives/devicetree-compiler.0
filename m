From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] dtc: dts source location annotation
Date: Tue, 15 Sep 2015 21:19:13 -0700
Message-ID: <55F8EDC1.5020601@gmail.com>
References: <55F8EB35.5010601@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=YOYqpioJzcP6unV1Otb4qEQl8u4e++dnnr+evzGYzDY=;
        b=potCDxZCLq3J5SsbbA7cD8vEbnyEUsTxLs1OGXAlNBh0pNCIr2pp86LmSo5PiELYA0
         ORTJmLHj+zXUuinVt+YAy7o8PsP//VJch+jaWmF84WdEncCIyxx5NGf8Nc0AfJhi392T
         4MhZDNpDrJP2eDV3vX+liKuCnx1PguF6O0ZC1HPAwYrs1S1miiYOIm6aUCEL4vL10UOb
         7FOT0dtkBc3AUNCaLIhnpRFegZS15hWYSzOvho8zk1LP0JtRq5nqrbNX8kcFWT+MPXXC
         uvrNvP3HKelQd2XxsPx4vDgvXkAuScNQ/fgiCGuM5VFAxdFfPWDj7Tlmv8x6Jg+5N+4n
         wAow==
In-Reply-To: <55F8EB35.5010601-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 9/15/2015 9:08 PM, Frank Rowand wrote:

< snip >

> I will provide the entire annotated .dts file that I extracted the
> example node from as a reply to this email.
> 
> When the dtc compiler is run within the Linux kernel build system,
> the path of the source files will be the full absolute path, just
> as seen for gcc warnings and errors.  I always trim away the path
> leading up to the Linux kernel source tree by passing the kernel
> build output through a sed pipe.  I have done the same to the
> annotated .dts file to remove the excessive verbosity in the
> source paths.

< snip >

Here is the entire annotated .dts file:


/dts-v1/;

/ { /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:5 */
	#address-cells = <0x1>; /* arch/arm/boot/dts/skeleton.dtsi:8 */
	#size-cells = <0x1>; /* arch/arm/boot/dts/skeleton.dtsi:9 */
	model = "Qualcomm APQ8074 Dragonboard"; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:6 */
	compatible = "qcom,apq8074-dragonboard", "qcom,apq8074"; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:7 */
	interrupt-parent = <0x1>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:10 */

	chosen { /* arch/arm/boot/dts/skeleton.dtsi:10 */
	}; /* arch/arm/boot/dts/skeleton.dtsi:10 */

	aliases { /* arch/arm/boot/dts/skeleton.dtsi:11 */
	}; /* arch/arm/boot/dts/skeleton.dtsi:11 */

	memory { /* arch/arm/boot/dts/skeleton.dtsi:12 */
		device_type = "memory"; /* arch/arm/boot/dts/skeleton.dtsi:12 */
		reg = <0x0 0x0>; /* arch/arm/boot/dts/skeleton.dtsi:12 */
	}; /* arch/arm/boot/dts/skeleton.dtsi:12 */

	cpus { /* arch/arm/boot/dts/qcom-msm8974.dtsi:12 */
		#address-cells = <0x1>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:13 */
		#size-cells = <0x0>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:14 */
		interrupts = <0x1 0x9 0xf04>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:15 */

		cpu@0 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:17 */
			compatible = "qcom,krait"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:18 */
			enable-method = "qcom,kpss-acc-v2"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:19 */
			device_type = "cpu"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:20 */
			reg = <0x0>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:21 */
			next-level-cache = <0x2>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:22 */
			qcom,acc = <0x3>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:23 */
			qcom,saw = <0x4>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:24 */
			cpu-idle-states = <0x5>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:25 */
		}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:26 */

		cpu@1 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:28 */
			compatible = "qcom,krait"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:29 */
			enable-method = "qcom,kpss-acc-v2"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:30 */
			device_type = "cpu"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:31 */
			reg = <0x1>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:32 */
			next-level-cache = <0x2>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:33 */
			qcom,acc = <0x6>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:34 */
			qcom,saw = <0x7>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:35 */
			cpu-idle-states = <0x5>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:36 */
		}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:37 */

		cpu@2 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:39 */
			compatible = "qcom,krait"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:40 */
			enable-method = "qcom,kpss-acc-v2"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:41 */
			device_type = "cpu"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:42 */
			reg = <0x2>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:43 */
			next-level-cache = <0x2>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:44 */
			qcom,acc = <0x8>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:45 */
			qcom,saw = <0x9>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:46 */
			cpu-idle-states = <0x5>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:47 */
		}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:48 */

		cpu@3 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:50 */
			compatible = "qcom,krait"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:51 */
			enable-method = "qcom,kpss-acc-v2"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:52 */
			device_type = "cpu"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:53 */
			reg = <0x3>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:54 */
			next-level-cache = <0x2>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:55 */
			qcom,acc = <0xa>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:56 */
			qcom,saw = <0xb>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:57 */
			cpu-idle-states = <0x5>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:58 */
		}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:59 */

		L2: l2-cache { /* arch/arm/boot/dts/qcom-msm8974.dtsi:61 */
			compatible = "cache"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:62 */
			cache-level = <0x2>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:63 */
			qcom,saw = <0xc>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:64 */
			linux,phandle = <0x2>; /* __builtin__:0 */
			phandle = <0x2>; /* __builtin__:0 */
		}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:65 */

		idle-states { /* arch/arm/boot/dts/qcom-msm8974.dtsi:67 */

			CPU_SPC: spc { /* arch/arm/boot/dts/qcom-msm8974.dtsi:68 */
				compatible = "qcom,idle-state-spc", "arm,idle-state"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:70 */
				entry-latency-us = <0x96>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:71 */
				exit-latency-us = <0xc8>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:72 */
				min-residency-us = <0x7d0>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:73 */
				linux,phandle = <0x5>; /* __builtin__:0 */
				phandle = <0x5>; /* __builtin__:0 */
			}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:74 */
		}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:75 */
	}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:76 */

	cpu-pmu { /* arch/arm/boot/dts/qcom-msm8974.dtsi:78 */
		compatible = "qcom,krait-pmu"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:79 */
		interrupts = <0x1 0x7 0xf04>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:80 */
	}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:81 */

	timer { /* arch/arm/boot/dts/qcom-msm8974.dtsi:83 */
		compatible = "arm,armv7-timer"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:84 */
		interrupts = <0x1 0x2 0xf08 0x1 0x3 0xf08 0x1 0x4 0xf08 0x1 0x1 0xf08>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:88 */
		clock-frequency = <0x124f800>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:89 */
	}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:90 */

	soc: soc { /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:9 */
		#address-cells = <0x1>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:93 */
		#size-cells = <0x1>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:94 */
		ranges; /* arch/arm/boot/dts/qcom-msm8974.dtsi:95 */
		compatible = "simple-bus"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:96 */

		intc: interrupt-controller@f9000000 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:98 */
			compatible = "qcom,msm-qgic2"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:99 */
			interrupt-controller; /* arch/arm/boot/dts/qcom-msm8974.dtsi:100 */
			#interrupt-cells = <0x3>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:101 */
			reg = <0xf9000000 0x1000 0xf9002000 0x1000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:103 */
			linux,phandle = <0x1>; /* __builtin__:0 */
			phandle = <0x1>; /* __builtin__:0 */
		}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:104 */

		timer@f9020000 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:106 */
			#address-cells = <0x1>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:107 */
			#size-cells = <0x1>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:108 */
			ranges; /* arch/arm/boot/dts/qcom-msm8974.dtsi:109 */
			compatible = "arm,armv7-timer-mem"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:110 */
			reg = <0xf9020000 0x1000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:111 */
			clock-frequency = <0x124f800>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:112 */

			frame@f9021000 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:114 */
				frame-number = <0x0>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:115 */
				interrupts = <0x0 0x8 0x4 0x0 0x7 0x4>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:117 */
				reg = <0xf9021000 0x1000 0xf9022000 0x1000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:119 */
			}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:120 */

			frame@f9023000 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:122 */
				frame-number = <0x1>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:123 */
				interrupts = <0x0 0x9 0x4>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:124 */
				reg = <0xf9023000 0x1000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:125 */
				status = "disabled"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:126 */
			}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:127 */

			frame@f9024000 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:129 */
				frame-number = <0x2>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:130 */
				interrupts = <0x0 0xa 0x4>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:131 */
				reg = <0xf9024000 0x1000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:132 */
				status = "disabled"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:133 */
			}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:134 */

			frame@f9025000 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:136 */
				frame-number = <0x3>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:137 */
				interrupts = <0x0 0xb 0x4>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:138 */
				reg = <0xf9025000 0x1000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:139 */
				status = "disabled"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:140 */
			}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:141 */

			frame@f9026000 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:143 */
				frame-number = <0x4>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:144 */
				interrupts = <0x0 0xc 0x4>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:145 */
				reg = <0xf9026000 0x1000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:146 */
				status = "disabled"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:147 */
			}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:148 */

			frame@f9027000 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:150 */
				frame-number = <0x5>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:151 */
				interrupts = <0x0 0xd 0x4>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:152 */
				reg = <0xf9027000 0x1000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:153 */
				status = "disabled"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:154 */
			}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:155 */

			frame@f9028000 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:157 */
				frame-number = <0x6>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:158 */
				interrupts = <0x0 0xe 0x4>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:159 */
				reg = <0xf9028000 0x1000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:160 */
				status = "disabled"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:161 */
			}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:162 */
		}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:163 */

		saw0: power-controller@f9089000 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:165 */
			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:166 */
			reg = <0xf9089000 0x1000 0xf9009000 0x1000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:167 */
			linux,phandle = <0x4>; /* __builtin__:0 */
			phandle = <0x4>; /* __builtin__:0 */
		}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:168 */

		saw1: power-controller@f9099000 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:170 */
			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:171 */
			reg = <0xf9099000 0x1000 0xf9009000 0x1000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:172 */
			linux,phandle = <0x7>; /* __builtin__:0 */
			phandle = <0x7>; /* __builtin__:0 */
		}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:173 */

		saw2: power-controller@f90a9000 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:175 */
			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:176 */
			reg = <0xf90a9000 0x1000 0xf9009000 0x1000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:177 */
			linux,phandle = <0x9>; /* __builtin__:0 */
			phandle = <0x9>; /* __builtin__:0 */
		}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:178 */

		saw3: power-controller@f90b9000 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:180 */
			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:181 */
			reg = <0xf90b9000 0x1000 0xf9009000 0x1000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:182 */
			linux,phandle = <0xb>; /* __builtin__:0 */
			phandle = <0xb>; /* __builtin__:0 */
		}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:183 */

		saw_l2: power-controller@f9012000 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:185 */
			compatible = "qcom,saw2"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:186 */
			reg = <0xf9012000 0x1000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:187 */
			regulator; /* arch/arm/boot/dts/qcom-msm8974.dtsi:188 */
			linux,phandle = <0xc>; /* __builtin__:0 */
			phandle = <0xc>; /* __builtin__:0 */
		}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:189 */

		acc0: clock-controller@f9088000 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:191 */
			compatible = "qcom,kpss-acc-v2"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:192 */
			reg = <0xf9088000 0x1000 0xf9008000 0x1000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:193 */
			linux,phandle = <0x3>; /* __builtin__:0 */
			phandle = <0x3>; /* __builtin__:0 */
		}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:194 */

		acc1: clock-controller@f9098000 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:196 */
			compatible = "qcom,kpss-acc-v2"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:197 */
			reg = <0xf9098000 0x1000 0xf9008000 0x1000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:198 */
			linux,phandle = <0x6>; /* __builtin__:0 */
			phandle = <0x6>; /* __builtin__:0 */
		}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:199 */

		acc2: clock-controller@f90a8000 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:201 */
			compatible = "qcom,kpss-acc-v2"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:202 */
			reg = <0xf90a8000 0x1000 0xf9008000 0x1000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:203 */
			linux,phandle = <0x8>; /* __builtin__:0 */
			phandle = <0x8>; /* __builtin__:0 */
		}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:204 */

		acc3: clock-controller@f90b8000 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:206 */
			compatible = "qcom,kpss-acc-v2"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:207 */
			reg = <0xf90b8000 0x1000 0xf9008000 0x1000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:208 */
			linux,phandle = <0xa>; /* __builtin__:0 */
			phandle = <0xa>; /* __builtin__:0 */
		}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:209 */

		restart@fc4ab000 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:211 */
			compatible = "qcom,pshold"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:212 */
			reg = <0xfc4ab000 0x4>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:213 */
		}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:214 */

		gcc: clock-controller@fc400000 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:216 */
			compatible = "qcom,gcc-msm8974"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:217 */
			#clock-cells = <0x1>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:218 */
			#reset-cells = <0x1>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:219 */
			reg = <0xfc400000 0x4000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:220 */
			linux,phandle = <0xd>; /* __builtin__:0 */
			phandle = <0xd>; /* __builtin__:0 */
		}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:221 */

		mmcc: clock-controller@fd8c0000 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:223 */
			compatible = "qcom,mmcc-msm8974"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:224 */
			#clock-cells = <0x1>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:225 */
			#reset-cells = <0x1>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:226 */
			reg = <0xfd8c0000 0x6000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:227 */
		}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:228 */

		serial@f991e000 { /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:10 */
			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:231 */
			reg = <0xf991e000 0x1000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:232 */
			interrupts = <0x0 0x6c 0x0>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:233 */
			clocks = <0xd 0x67 0xd 0x57>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:234 */
			clock-names = "core", "iface"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:235 */
			status = "ok"; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:11 */
		}; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:12 */

		sdhci@f9824900 { /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:14 */
			compatible = "qcom,sdhci-msm-v4"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:240 */
			reg = <0xf9824900 0x11c 0xf9824000 0x800>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:241 */
			reg-names = "hc_mem", "core_mem"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:242 */
			interrupts = <0x0 0x7b 0x0 0x0 0x8a 0x0>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:243 */
			interrupt-names = "hc_irq", "pwr_irq"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:244 */
			clocks = <0xd 0xd8 0xd 0xd7>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:245 */
			clock-names = "core", "iface"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:246 */
			status = "ok"; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:17 */
			bus-width = <0x8>; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:15 */
			non-removable; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:16 */
		}; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:18 */

		sdhci@f98a4900 { /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:20 */
			compatible = "qcom,sdhci-msm-v4"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:251 */
			reg = <0xf98a4900 0x11c 0xf98a4000 0x800>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:252 */
			reg-names = "hc_mem", "core_mem"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:253 */
			interrupts = <0x0 0x7d 0x0 0x0 0xdd 0x0>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:254 */
			interrupt-names = "hc_irq", "pwr_irq"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:255 */
			clocks = <0xd 0xdb 0xd 0xda>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:256 */
			clock-names = "core", "iface"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:257 */
			status = "disabled"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:258 */
			cd-gpios = <0xe 0x3e 0x1>; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:21 */
			bus-width = <0x4>; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:22 */
		}; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:23 */

		rng@f9bff000 { /* arch/arm/boot/dts/qcom-msm8974.dtsi:261 */
			compatible = "qcom,prng"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:262 */
			reg = <0xf9bff000 0x200>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:263 */
			clocks = <0xd 0xc3>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:264 */
			clock-names = "core"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:265 */
		}; /* arch/arm/boot/dts/qcom-msm8974.dtsi:266 */

		msmgpio: pinctrl@fd510000 { /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:26 */
			compatible = "qcom,msm8974-pinctrl"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:269 */
			reg = <0xfd510000 0x4000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:270 */
			gpio-controller; /* arch/arm/boot/dts/qcom-msm8974.dtsi:271 */
			#gpio-cells = <0x2>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:272 */
			interrupt-controller; /* arch/arm/boot/dts/qcom-msm8974.dtsi:273 */
			#interrupt-cells = <0x2>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:274 */
			interrupts = <0x0 0xd0 0x0>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:275 */
			linux,phandle = <0xe>; /* __builtin__:0 */
			phandle = <0xe>; /* __builtin__:0 */

			i2c11_pins: i2c11 { /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:27 */
				linux,phandle = <0xf>; /* __builtin__:0 */
				phandle = <0xf>; /* __builtin__:0 */

				mux { /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:28 */
					pins = "gpio83", "gpio84"; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:29 */
					function = "blsp_i2c11"; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:30 */
				}; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:31 */
			}; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:32 */

			spi8_default: spi8_default { /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:34 */

				mosi { /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:35 */
					pins = "gpio45"; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:36 */
					function = "blsp_spi8"; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:37 */
				}; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:38 */

				miso { /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:39 */
					pins = "gpio46"; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:40 */
					function = "blsp_spi8"; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:41 */
				}; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:42 */

				cs { /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:43 */
					pins = "gpio47"; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:44 */
					function = "blsp_spi8"; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:45 */
				}; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:46 */

				clk { /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:47 */
					pins = "gpio48"; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:48 */
					function = "blsp_spi8"; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:49 */
				}; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:50 */
			}; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:51 */
		}; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:52 */

		blsp_i2c11: i2c@f9967000 { /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:54 */
			status = "okay"; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:55 */
			compatible = "qcom,i2c-qup-v2.1.1"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:280 */
			reg = <0xf9967000 0x1000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:281 */
			interrupts = <0x0 0x69 0x0>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:282 */
			clocks = <0xd 0x7b 0xd 0x71>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:283 */
			clock-names = "core", "iface"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:284 */
			#address-cells = <0x1>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:285 */
			#size-cells = <0x0>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:286 */
			clock-frequency = <0x30d40>; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:56 */
			pinctrl-0 = <0xf>; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:57 */
			pinctrl-names = "default"; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:58 */

			eeprom: eeprom@52 { /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:60 */
				compatible = "atmel,24c128"; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:61 */
				reg = <0x52>; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:62 */
				pagesize = <0x20>; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:63 */
				read-only; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:64 */
			}; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:65 */
		}; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:66 */

		spmi_bus: spmi@fc4cf000 { /* arch/arm/boot/dts/qcom-pm8941.dtsi:5 */
			compatible = "qcom,spmi-pmic-arb"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:290 */
			reg-names = "core", "intr", "cnfg"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:291 */
			reg = <0xfc4cf000 0x1000 0xfc4cb000 0x1000 0xfc4ca000 0x1000>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:294 */
			interrupt-names = "periph_irq"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:295 */
			interrupts = <0x0 0xbe 0x0>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:296 */
			qcom,ee = <0x0>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:297 */
			qcom,channel = <0x0>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:298 */
			#address-cells = <0x2>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:299 */
			#size-cells = <0x0>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:300 */
			interrupt-controller; /* arch/arm/boot/dts/qcom-msm8974.dtsi:301 */
			#interrupt-cells = <0x4>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:302 */

			usid4: pm8841@4 { /* arch/arm/boot/dts/qcom-pm8841.dtsi:6 */
				compatible = "qcom,spmi-pmic"; /* arch/arm/boot/dts/qcom-pm8841.dtsi:7 */
				reg = <0x4 0x0>; /* arch/arm/boot/dts/qcom-pm8841.dtsi:8 */
				#address-cells = <0x1>; /* arch/arm/boot/dts/qcom-pm8841.dtsi:9 */
				#size-cells = <0x0>; /* arch/arm/boot/dts/qcom-pm8841.dtsi:10 */

				pm8841_mpps: mpps@a000 { /* arch/arm/boot/dts/qcom-pm8841.dtsi:12 */
					compatible = "qcom,pm8841-mpp"; /* arch/arm/boot/dts/qcom-pm8841.dtsi:13 */
					reg = <0xa000 0x400>; /* arch/arm/boot/dts/qcom-pm8841.dtsi:14 */
					gpio-controller; /* arch/arm/boot/dts/qcom-pm8841.dtsi:15 */
					#gpio-cells = <0x2>; /* arch/arm/boot/dts/qcom-pm8841.dtsi:16 */
					interrupts = <0x4 0xa0 0x0 0x0 0x4 0xa1 0x0 0x0 0x4 0xa2 0x0 0x0 0x4 0xa3 0x0 0x0>; /* arch/arm/boot/dts/qcom-pm8841.dtsi:20 */
				}; /* arch/arm/boot/dts/qcom-pm8841.dtsi:21 */

				temp-alarm@2400 { /* arch/arm/boot/dts/qcom-pm8841.dtsi:23 */
					compatible = "qcom,spmi-temp-alarm"; /* arch/arm/boot/dts/qcom-pm8841.dtsi:24 */
					reg = <0x2400 0x100>; /* arch/arm/boot/dts/qcom-pm8841.dtsi:25 */
					interrupts = <0x4 0x24 0x0 0x1>; /* arch/arm/boot/dts/qcom-pm8841.dtsi:26 */
				}; /* arch/arm/boot/dts/qcom-pm8841.dtsi:27 */
			}; /* arch/arm/boot/dts/qcom-pm8841.dtsi:28 */

			usid5: pm8841@5 { /* arch/arm/boot/dts/qcom-pm8841.dtsi:30 */
				compatible = "qcom,spmi-pmic"; /* arch/arm/boot/dts/qcom-pm8841.dtsi:31 */
				reg = <0x5 0x0>; /* arch/arm/boot/dts/qcom-pm8841.dtsi:32 */
				#address-cells = <0x1>; /* arch/arm/boot/dts/qcom-pm8841.dtsi:33 */
				#size-cells = <0x0>; /* arch/arm/boot/dts/qcom-pm8841.dtsi:34 */
			}; /* arch/arm/boot/dts/qcom-pm8841.dtsi:35 */

			usid0: pm8941@0 { /* arch/arm/boot/dts/qcom-pm8941.dtsi:7 */
				compatible = "qcom,spmi-pmic"; /* arch/arm/boot/dts/qcom-pm8941.dtsi:8 */
				reg = <0x0 0x0>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:9 */
				#address-cells = <0x1>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:10 */
				#size-cells = <0x0>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:11 */

				pm8941_coincell: qcom,coincell@2800 { /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:70 */
					compatible = "qcom,pm8941-coincell"; /* arch/arm/boot/dts/qcom-pm8941.dtsi:14 */
					reg = <0x2800>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:15 */
					status = "ok"; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:71 */
					qcom,rset-ohms = <0x834>; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:72 */
					qcom,vset-millivolts = <0xbb8>; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:73 */
					qcom,charge-enable; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:74 */
				}; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:75 */

				rtc@6000 { /* arch/arm/boot/dts/qcom-pm8941.dtsi:19 */
					compatible = "qcom,pm8941-rtc"; /* arch/arm/boot/dts/qcom-pm8941.dtsi:20 */
					reg = <0x6000 0x100 0x6100 0x100>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:22 */
					reg-names = "rtc", "alarm"; /* arch/arm/boot/dts/qcom-pm8941.dtsi:23 */
					interrupts = <0x0 0x61 0x1 0x1>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:24 */
				}; /* arch/arm/boot/dts/qcom-pm8941.dtsi:25 */

				pwrkey@800 { /* arch/arm/boot/dts/qcom-pm8941.dtsi:27 */
					compatible = "qcom,pm8941-pwrkey"; /* arch/arm/boot/dts/qcom-pm8941.dtsi:28 */
					reg = <0x800 0x100>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:29 */
					interrupts = <0x0 0x8 0x0 0x3>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:30 */
					debounce = <0x3d09>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:31 */
					bias-pull-up; /* arch/arm/boot/dts/qcom-pm8941.dtsi:32 */
				}; /* arch/arm/boot/dts/qcom-pm8941.dtsi:33 */

				pm8941_gpios: gpios@c000 { /* arch/arm/boot/dts/qcom-pm8941.dtsi:35 */
					compatible = "qcom,pm8941-gpio"; /* arch/arm/boot/dts/qcom-pm8941.dtsi:36 */
					reg = <0xc000 0x2400>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:37 */
					gpio-controller; /* arch/arm/boot/dts/qcom-pm8941.dtsi:38 */
					#gpio-cells = <0x2>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:39 */
					interrupts = <0x0 0xc0 0x0 0x0 0x0 0xc1 0x0 0x0 0x0 0xc2 0x0 0x0 0x0 0xc3 0x0 0x0 0x0 0xc4 0x0 0x0 0x0 0xc5 0x0 0x0 0x0 0xc6 0x0 0x0 0x0 0xc7 0x0 0x0 0x0 0xc8 0x0 0x0 0x0 0xc9 0x0 0x0 0x0 0xca 0x0 0x0 0x0 0xcb 0x0 0x0 0x0 0xcc 0x0 0x0 0x0 0xcd 0x0 0x0 0x0 0xce 0x0 0x0 0x0 0xcf 0x0 0x0 0x0 0xd0 0x0 0x0 0x0 0xd1 0x0 0x0 0x0 0xd2 0x0 0x0 0x0 0xd3 0x0 0x0 0x0 0xd4 0x0 0x0 0x0 0xd5 0x0 0x0 0x0 0xd6 0x0 0x0 0x0 0xd7 0x0 0x0 0x0 0xd8 0x0 0x0 0x0 0xd9 0x0 0x0 0x0 0xda 0x0 0x0 0x0 0xdb 0x0 0x0 0x0 0xdc 0x0 0x0 0x0 0xdd 0x0 0x0 0x0 0xde 0x0 0x0 0x0 0xdf 0x0 0x0 0x0 0xe0 0x0 0x0 0x0 0xe1 0x0 0x0 0x0 0xe2 0x0 0x0 0x0 0xe3 0x0 0x0>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:75 */
				}; /* arch/arm/boot/dts/qcom-pm8941.dtsi:76 */

				pm8941_mpps: mpps@a000 { /* arch/arm/boot/dts/qcom-pm8941.dtsi:78 */
					compatible = "qcom,pm8941-mpp"; /* arch/arm/boot/dts/qcom-pm8941.dtsi:79 */
					reg = <0xa000 0x800>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:80 */
					gpio-controller; /* arch/arm/boot/dts/qcom-pm8941.dtsi:81 */
					#gpio-cells = <0x2>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:82 */
					interrupts = <0x0 0xa0 0x0 0x0 0x0 0xa1 0x0 0x0 0x0 0xa2 0x0 0x0 0x0 0xa3 0x0 0x0 0x0 0xa4 0x0 0x0 0x0 0xa5 0x0 0x0 0x0 0xa6 0x0 0x0 0x0 0xa7 0x0 0x0>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:90 */
				}; /* arch/arm/boot/dts/qcom-pm8941.dtsi:91 */

				pm8941_temp: temp-alarm@2400 { /* arch/arm/boot/dts/qcom-pm8941.dtsi:93 */
					compatible = "qcom,spmi-temp-alarm"; /* arch/arm/boot/dts/qcom-pm8941.dtsi:94 */
					reg = <0x2400 0x100>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:95 */
					interrupts = <0x0 0x24 0x0 0x1>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:96 */
					io-channels = <0x10 0x8>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:97 */
					io-channel-names = "thermal"; /* arch/arm/boot/dts/qcom-pm8941.dtsi:98 */
					#thermal-sensor-cells = <0x0>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:99 */
				}; /* arch/arm/boot/dts/qcom-pm8941.dtsi:100 */

				pm8941_vadc: vadc@3100 { /* arch/arm/boot/dts/qcom-pm8941.dtsi:102 */
					compatible = "qcom,spmi-vadc"; /* arch/arm/boot/dts/qcom-pm8941.dtsi:103 */
					reg = <0x3100 0x100>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:104 */
					interrupts = <0x0 0x31 0x0 0x1>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:105 */
					#address-cells = <0x1>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:106 */
					#size-cells = <0x0>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:107 */
					#io-channel-cells = <0x1>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:108 */
					linux,phandle = <0x10>; /* __builtin__:0 */
					phandle = <0x10>; /* __builtin__:0 */

					die_temp { /* arch/arm/boot/dts/qcom-pm8941.dtsi:110 */
						reg = <0x8>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:111 */
					}; /* arch/arm/boot/dts/qcom-pm8941.dtsi:112 */

					ref_625mv { /* arch/arm/boot/dts/qcom-pm8941.dtsi:113 */
						reg = <0x9>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:114 */
					}; /* arch/arm/boot/dts/qcom-pm8941.dtsi:115 */

					ref_1250v { /* arch/arm/boot/dts/qcom-pm8941.dtsi:116 */
						reg = <0xa>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:117 */
					}; /* arch/arm/boot/dts/qcom-pm8941.dtsi:118 */

					ref_gnd { /* arch/arm/boot/dts/qcom-pm8941.dtsi:119 */
						reg = <0xe>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:120 */
					}; /* arch/arm/boot/dts/qcom-pm8941.dtsi:121 */

					ref_vdd { /* arch/arm/boot/dts/qcom-pm8941.dtsi:122 */
						reg = <0xf>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:123 */
					}; /* arch/arm/boot/dts/qcom-pm8941.dtsi:124 */
				}; /* arch/arm/boot/dts/qcom-pm8941.dtsi:125 */

				pm8941_iadc: iadc@3600 { /* arch/arm/boot/dts/qcom-pm8941.dtsi:127 */
					compatible = "qcom,pm8941-iadc", "qcom,spmi-iadc"; /* arch/arm/boot/dts/qcom-pm8941.dtsi:128 */
					reg = <0x3600 0x100 0x12f1 0x1>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:130 */
					interrupts = <0x0 0x36 0x0 0x1>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:131 */
					qcom,external-resistor-micro-ohms = <0x2710>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:132 */
				}; /* arch/arm/boot/dts/qcom-pm8941.dtsi:133 */
			}; /* arch/arm/boot/dts/qcom-pm8941.dtsi:134 */

			usid1: pm8941@1 { /* arch/arm/boot/dts/qcom-pm8941.dtsi:136 */
				compatible = "qcom,spmi-pmic"; /* arch/arm/boot/dts/qcom-pm8941.dtsi:137 */
				reg = <0x1 0x0>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:138 */
				#address-cells = <0x1>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:139 */
				#size-cells = <0x0>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:140 */

				wled@d800 { /* arch/arm/boot/dts/qcom-pm8941.dtsi:142 */
					compatible = "qcom,pm8941-wled"; /* arch/arm/boot/dts/qcom-pm8941.dtsi:143 */
					reg = <0xd800 0x100>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:144 */
					label = "backlight"; /* arch/arm/boot/dts/qcom-pm8941.dtsi:145 */
					qcom,cs-out; /* arch/arm/boot/dts/qcom-pm8941.dtsi:147 */
					qcom,current-limit = <0x14>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:148 */
					qcom,current-boost-limit = <0x325>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:149 */
					qcom,switching-freq = <0x640>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:150 */
					qcom,ovp = <0x1d>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:151 */
					qcom,num-strings = <0x2>; /* arch/arm/boot/dts/qcom-pm8941.dtsi:152 */
				}; /* arch/arm/boot/dts/qcom-pm8941.dtsi:153 */
			}; /* arch/arm/boot/dts/qcom-pm8941.dtsi:154 */
		}; /* arch/arm/boot/dts/qcom-pm8941.dtsi:155 */
	}; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:67 */
}; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:68 */
