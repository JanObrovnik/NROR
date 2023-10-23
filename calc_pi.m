tic
n = 500;
vrednosti_pi = [];
vrednosti_n = [];

for i = .03:0.03:5.5
    [min_ko,max_ko] = mcc_pi(n);
    [izracunan_pi,odstopanje] = area_pi(min_ko,max_ko);

    vrednosti_pi = [vrednosti_pi, izracunan_pi];
    vrednosti_n = [vrednosti_n, n];

    n = n + 500*i;
end

%plot(vrednosti_n,vrednosti_pi,"r.",[0,vrednosti_n(length(vrednosti_n))],[pi,pi],"k--")
%axis([0 vrednosti_n(length(vrednosti_n)) pi-.1 pi+.1])

kroznica = @(x) (1-x.^2).^.5;

% Narišite graf
figure;
hold on;

% Narišite točke in krožnico
plot(min_ko(:,1), min_ko(:,2), 'r+', 'DisplayName', "točke v krogu");
plot(max_ko(:,1), max_ko(:,2), 'b.', 'DisplayName', "točke v kvadratu in ne v krogu");
x = -1:.001:1;
plot(x, kroznica(x), 'g', 'LineWidth', 3, 'DisplayName', 'Krožnica');
plot(x, -kroznica(x), 'g', 'LineWidth', 3, 'HandleVisibility', 'off'); 

legend

xlabel('X os');
ylabel('Y os');
title('Metoda Monte Carlo');

hold off;

toc


function[izracunan_pi,odstopanje] = area_pi(min_ko,max_ko)

izracunan_pi = 4* length(min_ko) / (length(min_ko)+length(max_ko));
odstopanje = abs(izracunan_pi - pi);

end