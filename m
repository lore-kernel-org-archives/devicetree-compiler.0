From: "long.wanglong" <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3] fdtput: add delete node and property function
Date: Fri, 23 Jan 2015 09:25:01 +0800
Message-ID: <54C1A2ED.3080308@huawei.com>
References: <1421651193-155164-1-git-send-email-long.wanglong@huawei.com> <CAPnjgZ35BGtHRNtUqcsfcvqWfnh0vuXNor7ZAt1wjT0zGnkeNA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ35BGtHRNtUqcsfcvqWfnh0vuXNor7ZAt1wjT0zGnkeNA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, "jdl-CYoMK+44s/E@public.gmane.org" <jdl-CYoMK+44s/E@public.gmane.org>, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On 2015/1/23 0:52, Simon Glass wrote:
> Hi,
> 
> On 19 January 2015 at 00:06, Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
>> add the delete node and property function for fdtput.
>>
>> usage:
>> 1) delete nodes
>>    fdtput -r <options> <dt file> [<node>...]
>> 2) delete properties
>>    fdtput -d <options> <dt file> <node> [<property>...]
>>
>> Signed-off-by: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> 
> Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Tested-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> I have a few nits below, see what you think.
> 
>> ---
>>  fdtput.c           | 87 ++++++++++++++++++++++++++++++++++++++++++++++++++++--
>>  tests/run_tests.sh | 22 ++++++++++++++
>>  2 files changed, 106 insertions(+), 3 deletions(-)
>>
>> diff --git a/fdtput.c b/fdtput.c
>> index 2a8d674..b5d7b8d 100644
>> --- a/fdtput.c
>> +++ b/fdtput.c
>> @@ -32,6 +32,8 @@
>>  enum oper_type {
>>         OPER_WRITE_PROP,                /* Write a property in a node */
>>         OPER_CREATE_NODE,               /* Create a new node */
>> +       OPER_REMOVE_NODE,               /* Delete a node */
>> +       OPER_DELETE_PROP,               /* Delete a property in a node */
>>  };
>>
>>  struct display_info {
>> @@ -270,11 +272,66 @@ static int create_node(char **blob, const char *node_name)
>>         return 0;
>>  }
>>
>> +/**
>> + * Delete a property of a node in the fdt.
>> + *
>> + * @param blob         FDT blob to write into
>> + * @param node_name    Name of node which the delete property belongs to
> 
> Path to node containing the property to delete
> 
hi,Simon

Your description for node_name is better.


>> + * @param prop_name    Name of property to delete
>> + * @return 0 on success, or -1 on failure
>> + */
>> +static int delete_prop(char *blob, const char *node_name, const char *prop_name)
>> +{
>> +       int node = 0;
>> +
>> +       node = fdt_path_offset(blob, node_name);
>> +       if (node < 0) {
>> +               report_error(node_name, -1, node);
>> +               return -1;
>> +       }
>> +
>> +       node = fdt_delprop(blob, node, prop_name);
> 
> Could remove this blank line

OK

> 
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
>> + * @return 0 on success, or -1 on failure
>> + */
>> +static int delete_node(char *blob, const char *node_name)
>> +{
>> +       int node = 0;
>> +
>> +       node = fdt_path_offset(blob, node_name);
>> +       if (node < 0) {
>> +               report_error(node_name, -1, node);
>> +               return -1;
>> +       }
>> +
>> +       node = fdt_del_node(blob, node);
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
>>         char *value;
>>         char *blob;
>> +       char *node;
>>         int len, ret = 0;
>>
>>         blob = utilfdt_read(filename);
>> @@ -302,6 +359,15 @@ static int do_fdtput(struct display_info *disp, const char *filename,
>>                                 ret = create_node(&blob, *arg);
>>                 }
>>                 break;
>> +       case OPER_REMOVE_NODE:
>> +               for (; ret >= 0 && arg_count--; arg++)
>> +                       ret = delete_node(blob, *arg);
>> +               break;
>> +       case OPER_DELETE_PROP:
>> +               node = *arg;
>> +               for (; ret >= 0 && arg_count-- > 1; arg++)
>> +                       ret = delete_prop(blob, node, arg[1]);
> 
> Seems a little odd to use arg[1] in the loop. Perhaps this would be better:
> 
>                for (arg++; ret >= 0 && arg_count-- > 1; arg++)
>                        ret = delete_prop(blob, node, *arg);
> 

OK

>> +               break;
>>         }
>>         if (ret >= 0) {
>>                 fdt_pack(blob);
>> @@ -312,17 +378,22 @@ static int do_fdtput(struct display_info *disp, const char *filename,
>>         return ret;
>>  }
>>
>> +
> 
> Could remove this blank line.
OK
> 
>>  /* Usage related data. */
>>  static const char usage_synopsis[] =
>>         "write a property value to a device tree\n"
>>         "       fdtput <options> <dt file> <node> <property> [<value>...]\n"
>>         "       fdtput -c <options> <dt file> [<node>...]\n"
>> +       "       fdtput -r <options> <dt file> [<node>...]\n"
>> +       "       fdtput -d <options> <dt file> <node> [<property>...]\n"
>>         "\n"
>>         "The command line arguments are joined together into a single value.\n"
>>         USAGE_TYPE_MSG;
>> -static const char usage_short_opts[] = "cpt:v" USAGE_COMMON_SHORT_OPTS;
>> +static const char usage_short_opts[] = "crdpt:v" USAGE_COMMON_SHORT_OPTS;
>>  static struct option const usage_long_opts[] = {
>>         {"create",           no_argument, NULL, 'c'},
>> +       {"remove",           no_argument, NULL, 'r'},
>> +       {"delete",           no_argument, NULL, 'd'},
>>         {"auto-path",        no_argument, NULL, 'p'},
>>         {"type",              a_argument, NULL, 't'},
>>         {"verbose",          no_argument, NULL, 'v'},
>> @@ -330,6 +401,8 @@ static struct option const usage_long_opts[] = {
>>  };
>>  static const char * const usage_opts_help[] = {
>>         "Create nodes if they don't already exist",
>> +       "Delete nodes (and any subnodes) if they already exist",
>> +       "Delete properties if they already exist",
>>         "Automatically create nodes as needed for the node path",
>>         "Type of data",
>>         "Display each value decoded from command line",
>> @@ -348,8 +421,6 @@ int main(int argc, char *argv[])
>>         while ((opt = util_getopt_long()) != EOF) {
>>                 /*
>>                  * TODO: add options to:
>> -                * - delete property
>> -                * - delete node (optionally recursively)
>>                  * - rename node
>>                  * - pack fdt before writing
>>                  * - set amount of free space when writing
>> @@ -360,6 +431,12 @@ int main(int argc, char *argv[])
>>                 case 'c':
>>                         disp.oper = OPER_CREATE_NODE;
>>                         break;
>> +               case 'r':
>> +                       disp.oper = OPER_REMOVE_NODE;
>> +                       break;
>> +               case 'd':
>> +                       disp.oper = OPER_DELETE_PROP;
>> +                       break;
>>                 case 'p':
>>                         disp.auto_path = 1;
>>                         break;
>> @@ -390,6 +467,10 @@ int main(int argc, char *argv[])
>>                         usage("missing property");
>>         }
>>
>> +       if (disp.oper == OPER_DELETE_PROP)
>> +               if (argc < 1)
>> +                       usage("missing node");
>> +
>>         if (do_fdtput(&disp, filename, argv, argc))
>>                 return 1;
>>         return 0;
>> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
>> index ace6e4f..c5856d9 100755
>> --- a/tests/run_tests.sh
>> +++ b/tests/run_tests.sh
>> @@ -610,6 +610,28 @@ fdtput_tests () {
>>      run_wrap_test $DTPUT $dtb -cp /chosen
>>      run_wrap_test $DTPUT $dtb -cp /chosen/son
>>
>> +    # Start again with a fresh dtb
>> +    run_dtc_test -O dtb -p $(stat -c %s $text) -o $dtb $dts
>> +
>> +    # Node delete
>> +    run_wrap_test $DTPUT $dtb -c /chosen/node1 /chosen/node2 /chosen/node3
>> +    run_fdtget_test "node3\nnode2\nnode1" $dtb -l  /chosen
>> +    run_wrap_test $DTPUT $dtb -r /chosen/node1 /chosen/node2
>> +    run_fdtget_test "node3" $dtb -l  /chosen
>> +
>> +    # Delete the non-existent node
>> +    run_wrap_error_test $DTPUT $dtb -r /non-existent/node
>> +
>> +    # Property delete
>> +    run_fdtput_test "eva" $dtb /chosen/ name "" -ts "eva"
>> +    run_fdtput_test "016" $dtb /chosen/ age  "" -ts "016"
>> +    run_fdtget_test "age\nname\nbootargs\nlinux,platform" $dtb -p  /chosen
>> +    run_wrap_test $DTPUT $dtb -d /chosen/ name age
>> +    run_fdtget_test "bootargs\nlinux,platform" $dtb -p  /chosen
>> +
>> +    # Delete the non-existent property
>> +    run_wrap_error_test $DTPUT $dtb -d /chosen   non-existent-prop
>> +
>>      # TODO: Add tests for verbose mode?
>>  }
> Regards,
> Simon
> 
> .
> 
thank you for your comments.i will send a new version of patch.

Best Regards
Wang Long



--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
