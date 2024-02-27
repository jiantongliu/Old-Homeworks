function [z,z1,z2] = box_muller(n,m)
    x1 = rand(n,1);
    x2 = rand(n,1);
    z1 = sqrt(-2*log(x1)/log(exp(1))).*cos(2*pi*x2);
    z2 = sqrt(-2*log(x1)/log(exp(1))).*sin(2*pi*x2);
    figure;
    plot(z1,z2,'.');
    z = [z1,z2];
    figure;
    hist3(z,'Nbins',[m,m]);
end