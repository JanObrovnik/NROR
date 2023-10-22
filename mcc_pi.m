function[min_ko, max_ko] = mcc_pi(len)

A = (rand(len,1)-.5)*2;
B = (rand(len,1)-.5)*2;
C = (A.^2 + B.^2).^.5;

cmax = 0;
cmin = 0;

x_max = [];
y_max = [];
x_min = [];
y_min = [];

a = 1;
while a <= len
    c = C(a);
    
    if c < 1
        %cmin = cmin+1;
        x_min = [x_min, A(a)];
        y_min = [y_min, B(a)];
    elseif c > 1
        %cmax = cmax+1;
        x_max = [x_max, A(a)];
        y_max = [y_max, B(a)];
    else
        disp("huh ... naklučje")
    end

    a = a+1;
end

min_ko = [x_min; y_min]';
max_ko = [x_max; y_max]';
%st_pi = 4* cmin / len;

%kroznica = @(x) (1-x.^2).^.5;
%kroznica(0:.1:1)
%plot(min_ko(:,1),min_ko(:,2),"r.",max_ko(:,1),max_ko(:,2),"b.",-1:.001:1,kroznica(-1:.001:1),"g",-1:.001:1,-kroznica(-1:.001:1),"g",'LineWidth',3)

end