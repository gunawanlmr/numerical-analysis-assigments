function [Q,R,x] = QRgivensrotation(A,b)
%   Fungsi ini berfungsi untuk mengurai sebuah matriks A menjadi QR sedemikian sehingga A = QR
%   Hasil dari penguraian matriks A kemudian dipakai untuk menyelesaikan Least Square Problem Ax=b
%
%   Input:
%     Matriks A ? Rmxn
%     Matriks b ? Rmx1
%
%   Output:
%     Matriks Q ? Rmxm
%     Matriks segitiga atas R ? Rmxn ; m=n
%     Matriks solusi x ? Rnx1
  tic
  [m,n] = size(A);
  Q = eye(m);
  R = A;
  P = eye(n);
  
  for j = 1:n
    for i = m:-1:(j+1)
      G = eye(m);
      [c,s] = givensrot( R(i-1,j),R(i,j) );
      G([i-1, i],[i-1, i]) = [c -s; s c];
      R = G'*R;
      Q = Q*G;
    end
  end
  x = P*(R\(Q'*b));
  toc
  
end

function [c,s] = givensrot(a,b)
%   Fungsi ini merupakan fungsi pelengkap untuk fungsi QRgivensrotation
%   berfungsi untuk mendapatkan nilai cosinus dan sinus dari dua nilai elemen matriks
%   Input:
%     a, b = elemen dari sebuah matriks
%
%   Output:
%     c = nilai cosinus
%     s = nilai sinus
  if b == 0
    c = 1;
    s = 0;
  elseif (abs(a) > abs(b))
    t = b/a;
    c = 1/sqrt(1+t^2);
    s = c*t;
  else
    ct = a/b;
    s = 1/sqrt(1+ct^2);
    c = s*ct;
  end
end