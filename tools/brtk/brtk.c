#include <stdio.h>
#include "mruby.h"
#include "mruby/compile.h"

int main(int argc, char **argv) {
  mrb_state *mrb = mrb_open();
  mrb_load_string(mrb, "Brtk.run('http://www.google.com')");
  mrb_close(mrb);

  return 0;
}
