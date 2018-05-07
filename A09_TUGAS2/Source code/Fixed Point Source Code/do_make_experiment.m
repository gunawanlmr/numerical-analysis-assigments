function do_make_experiment()
  list_tol = [10^(-4), 10^(-6), 10^(-8), 10^(-10), 10^(-12)];
  list_x = [1, 2, 3, 4, 5];
  % list_f = {@fxa, @fxb, @fxc, @fxd, @fxe};
  list_f = {@fxe};
  
  list_ga = {@gx1a, @gx2a, @gx3a};
  list_gb = {@gx1b, @gx2b, @gx3b};
  list_gc = {@gx1c, @gx2c, @gx3c};
  list_gd = {@gx1d, @gx2d, @gx3d};
  list_ge = {@gx1e, @gx2e, @gx3e};
  % list_g = {list_ga; list_gb; list_gc; list_gd; list_ge};
  list_g = {list_ge};
            
  make_experiment(list_x, list_tol, list_f, list_g);
endfunction