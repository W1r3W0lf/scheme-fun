#include <stdio.h>
#include <chibi/eval.h>

int main(int argc, char** argv){

	printf("Starting Chibi-Scheme\n");

	sexp ctx;

	sexp_scheme_init();
	ctx = sexp_make_eval_context(NULL, NULL, NULL, 0, 0);
	sexp_load_standard_env(ctx, NULL, SEXP_SEVEN);
	sexp_load_standard_ports(ctx, NULL, stdin, stdout, stderr, 1);

	sexp_gc_var1(obj1);
	sexp_gc_preserve1(ctx, obj1);

	obj1 = sexp_c_string(ctx, "./merge.scm", -1);
	sexp_load(ctx, obj1, NULL);


	sexp_gc_release1(ctx);

	sexp_destroy_context(ctx);

	return 0;
}
