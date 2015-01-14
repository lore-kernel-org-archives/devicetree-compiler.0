From: "long.wanglong" <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] fdtput: add delete node and property function
Date: Wed, 14 Jan 2015 13:25:32 +0800
Message-ID: <54B5FDCC.3050905@huawei.com>
References: <1421207637-32690-1-git-send-email-long.wanglong@huawei.com> <CAPnjgZ32hrN9t3FUDtZzrbjTrq9UdC4wgK6J_Z2XUNWb47cyBA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ32hrN9t3FUDtZzrbjTrq9UdC4wgK6J_Z2XUNWb47cyBA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, "jdl-CYoMK+44s/E@public.gmane.org" <jdl-CYoMK+44s/E@public.gmane.org>, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On 2015/1/14 12:07, Simon Glass wrote:
> Hi Wang,
> 
> On 13 January 2015 at 19:53, Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
>> add the delete node and property function for fdtput.
>>
>> usage:
>> 1) delete a node
>>  # fdtput test.dtb -d node /chosen/son
>> 2) delete a property
>>  # fdtput test.dtb -d prop /chosen/ prop_name
> 
> This is a great addition!
> 
> I know David is keen on single character flags. But would it be better
> to have a separate delete option, e.g.
> 
> -r to remove a node
> -d to delete a property
> 
ok

i will use single character flags in next version of the patch.

>>
>> Signed-off-by: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> ---
>>  fdtput.c           | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++--
>>  tests/run_tests.sh | 17 ++++++++++
>>  2 files changed, 108 insertions(+), 3 deletions(-)
>>
>> diff --git a/fdtput.c b/fdtput.c
>> index 2a8d674..28e1f55 100644
>> --- a/fdtput.c
>> +++ b/fdtput.c
>> @@ -32,6 +32,8 @@
>>  enum oper_type {
>>         OPER_WRITE_PROP,                /* Write a property in a node */
>>         OPER_CREATE_NODE,               /* Create a new node */
>> +       OPER_DELETE_NODE,               /* Delete a node */
>> +       OPER_DELETE_PROP,               /* Delete a property in a node */
>>  };
>>
>>  struct display_info {
>> @@ -270,6 +272,60 @@ static int create_node(char **blob, const char *node_name)
>>         return 0;
>>  }
>>
>> +/**
>> + * Delete a property of a node in the fdt.
>> + *
>> + * @param blob         FDT blob to write into
>> + * @param node_name    Name of node which the delete property belongs to
>> + * @param prop_name    Name of property to delete
>> + * @return 0 on success, or -1 on failure
>> + */
>> +static int delete_prop(char **blob, const char *node_name, const char *prop_name)
> 
> Can you just pass char *blob? Why the double pointer? Same with the
> next function.
> 
hi,Simon

the function create_paths and create_node use the double pointer.

 static int create_paths(char **blob, const char *in_path)
 static int create_node(char **blob, const char *node_name)

In order to maintain a consistent coding style, i use char **blob instead of char *blob.
should we update char **blob  to char *blob in all functions?


>> +{
>> +       int node = 0;
>> +
>> +       node = fdt_path_offset(*blob, node_name);
>> +       if (node < 0) {
>> +               report_error(node_name, -1, node);
>> +               return -1;
>> +       }
>> +
>> +       node = fdt_delprop(*blob, node, prop_name);
>> +
>> +       if (node < 0) {
>> +               report_error(node_name, -1, node);
>> +               return -1;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +/**
>> + * Delete a node in the fdt.
>> + *
>> + * @param blob         FDT blob to write into
>> + * @param node_name    Name of node to delete
>> + * @return the delete node offset if found, or -1 on failure
>> + */
>> +static int delete_node(char **blob, const char *node_name)
>> +{
>> +       int node = 0;
>> +
>> +       node = fdt_path_offset(*blob, node_name);
>> +       if (node < 0) {
>> +               report_error(node_name, -1, node);
>> +               return -1;
>> +       }
>> +
>> +       node = fdt_del_node(*blob, node);
>> +       if (node < 0) {
>> +               report_error(node_name, -1, node);
>> +               return -1;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>>  static int do_fdtput(struct display_info *disp, const char *filename,
>>                     char **arg, int arg_count)
>>  {
>> @@ -302,6 +358,13 @@ static int do_fdtput(struct display_info *disp, const char *filename,
>>                                 ret = create_node(&blob, *arg);
>>                 }
>>                 break;
>> +       case OPER_DELETE_NODE:
>> +               for (; ret >= 0 && arg_count--; arg++)
>> +                       ret = delete_node(&blob, *arg);
>> +               break;
>> +       case OPER_DELETE_PROP:
>> +               ret = delete_prop(&blob, *arg, arg[1]);
>> +               break;
>>         }
>>         if (ret >= 0) {
>>                 fdt_pack(blob);
>> @@ -312,17 +375,29 @@ static int do_fdtput(struct display_info *disp, const char *filename,
>>         return ret;
>>  }
>>
>> +/*
>> + * This is a usage message fragment for the -d option.
>> + *
>> + */
>> +#define USAGE_DELETE_MSG \
>> +        "<delete>  node, prop\n" \
>> +       "\t  node: delete node\n" \
>> +       "\t  prop: delete property\n"
>> +
>>  /* Usage related data. */
>>  static const char usage_synopsis[] =
>>         "write a property value to a device tree\n"
>>         "       fdtput <options> <dt file> <node> <property> [<value>...]\n"
>>         "       fdtput -c <options> <dt file> [<node>...]\n"
>> +       "       fdtput -d <options> <dt file> <node> <property>\n"
>>         "\n"
>>         "The command line arguments are joined together into a single value.\n"
>> -       USAGE_TYPE_MSG;
>> -static const char usage_short_opts[] = "cpt:v" USAGE_COMMON_SHORT_OPTS;
>> +       USAGE_DELETE_MSG
>> +       USAGE_TYPE_MSG
>> +static const char usage_short_opts[] = "cd:pt:v" USAGE_COMMON_SHORT_OPTS;
>>  static struct option const usage_long_opts[] = {
>>         {"create",           no_argument, NULL, 'c'},
>> +       {"delete",            a_argument, NULL, 'd'},
>>         {"auto-path",        no_argument, NULL, 'p'},
>>         {"type",              a_argument, NULL, 't'},
>>         {"verbose",          no_argument, NULL, 'v'},
>> @@ -330,6 +405,7 @@ static struct option const usage_long_opts[] = {
>>  };
>>  static const char * const usage_opts_help[] = {
>>         "Create nodes if they don't already exist",
>> +       "Delete nodes or property if they already exist",
>>         "Automatically create nodes as needed for the node path",
>>         "Type of data",
>>         "Display each value decoded from command line",
>> @@ -348,7 +424,6 @@ int main(int argc, char *argv[])
>>         while ((opt = util_getopt_long()) != EOF) {
>>                 /*
>>                  * TODO: add options to:
>> -                * - delete property
>>                  * - delete node (optionally recursively)
>>                  * - rename node
>>                  * - pack fdt before writing
>> @@ -360,6 +435,14 @@ int main(int argc, char *argv[])
>>                 case 'c':
>>                         disp.oper = OPER_CREATE_NODE;
>>                         break;
>> +               case 'd':
>> +                       if (strcmp(optarg, "node") == 0)
>> +                               disp.oper = OPER_DELETE_NODE;
>> +                       else if (strcmp(optarg, "prop") == 0)
>> +                               disp.oper = OPER_DELETE_PROP;
>> +                       else
>> +                               usage("Invalid delete string");
>> +                       break;
>>                 case 'p':
>>                         disp.auto_path = 1;
>>                         break;
>> @@ -390,6 +473,11 @@ int main(int argc, char *argv[])
>>                         usage("missing property");
>>         }
>>
>> +       if (disp.oper == OPER_DELETE_NODE || disp.oper == OPER_DELETE_PROP) {
>> +               if (argc < 1)
>> +                       usage("missing node or property");
>> +       }
>> +
>>         if (do_fdtput(&disp, filename, argv, argc))
>>                 return 1;
>>         return 0;
>> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
>> index ace6e4f..f633e62 100755
>> --- a/tests/run_tests.sh
>> +++ b/tests/run_tests.sh
>> @@ -610,6 +610,23 @@ fdtput_tests () {
>>      run_wrap_test $DTPUT $dtb -cp /chosen
>>      run_wrap_test $DTPUT $dtb -cp /chosen/son
>>
>> +    # Start again with a fresh dtb
>> +    run_dtc_test -O dtb -p $(stat -c %s $text) -o $dtb $dts
> 
> Do you need to do this?

ok, to test the function of deleting node and property, using an non-fresh dtb
is also ok.

> 
>> +
>> +    # Node delete
>> +    run_wrap_test $DTPUT $dtb -c /chosen/son /chosen/daughter
> 
> These tests seems sufficient, but a few ideas:
> 
> Perhaps here you could list the node properties to make sure the node
> has been created?

ok

> 
>> +    run_wrap_test $DTPUT $dtb -d node  /chosen/son /chosen/daughter
>> +
>> +    # Delete the not exist node
>> +    run_wrap_error_test $DTPUT $dtb -d node  /not/exist/node
>> +
>> +    # Property delete
>> +    run_fdtput_test "eva" $dtb /chosen/ name "" -ts "eva"
>> +    run_wrap_test $DTPUT $dtb -d prop /chosen/ name
> 
> Here you could list the properties to make suere there is none?
> 
ok

>> +
>> +    # Delete the not exist property
> 
> nit: s/not exist/non-existent/
ok thanks
> 
>> +    run_wrap_error_test $DTPUT $dtb -d prop  /chosen   notexistprop
>> +
>>      # TODO: Add tests for verbose mode?
>>  }
>>
>> --
> 
> Regards,
> Simon
> 
> .
> 

Best Regards
Wang Long


--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
