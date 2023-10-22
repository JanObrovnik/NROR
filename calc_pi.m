tic
n = 500;
vrednosti_pi = [];
vrednosti_n = [];

for i = .03:.03:5.5
    [min_ko,max_ko] = mcc_pi(n);
    [izracunan_pi,odstopanje] = area_pi(min_ko,max_ko);

    vrednosti_pi = [vrednosti_pi, izracunan_pi];
    vrednosti_n = [vrednosti_n, n];

    n = n + 500*i;
end

%plot(vrednosti_n,vrednosti_pi,"r.",[0,vrednosti_n(length(vrednosti_n))],[pi,pi],"k--")
%axis([0 vrednosti_n(length(vrednosti_n)) pi-.1 pi+.1])

kroznica = @(x) (1-x.^2).^.5;
plot(min_ko(:,1),min_ko(:,2),"r+",max_ko(:,1),max_ko(:,2),"b.",-1:.001:1,kroznica(-1:.001:1),"g",-1:.001:1,-kroznica(-1:.001:1),"g",'LineWidth',3)

toc

function[izracunan_pi,odstopanje] = area_pi(min_ko,max_ko)

izracunan_pi = 4* length(min_ko) / (length(min_ko)+length(max_ko));
odstopanje = abs(izracunan_pi - pi);

end