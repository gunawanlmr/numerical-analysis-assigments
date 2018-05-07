function y = fppc(x)
  y =  10 * e^(-x) * sin(2*pi*x) - 40 * pi^2 * e^(-x) * sin(2 * pi * x) - 40 * pi * e^(-x) * cos(2 * pi * x);
end