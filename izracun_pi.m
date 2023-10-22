len = 12000000;
C = (rand(len,1).^2 + rand(len,1).^2).^.5;
disp(4* length(C(C<1)) / len)