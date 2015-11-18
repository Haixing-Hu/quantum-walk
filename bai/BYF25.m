%%图3.5  不同双光子态在波导阵列中的关联性质
tic
clc;
clear;
C1=2.0;
z1=3;
q=1;
c=@(m,n)C1*KronD(m,n+1)+C1*KronD(m,n-1);

for m=1:41
    for n=1:41
        b(m,n)=c(m,n);
    end
end
d=expm(i*z1*b);

for m=1:1:41
    for n=1:1:41
%          e1(m,n)=abs(d(m,20).*d(n,20)+d(m,19).*d(n,19)+d(m,18).*d(n,18)+d(m,17).*d(n,17)+d(m,16).*d(n,16)+d(m,15).*d(n,15)+d(m,14).*d(n,14)+d(m,13).*d(n,13)+d(m,12).*d(n,12)...
%              +d(m,11).*d(n,11)+d(m,10).*d(n,10)+d(m,9).*d(n,9)+d(m,8).*d(n,8)+d(m,7).*d(n,7)+d(m,6).*d(n,6)+d(m,5).*d(n,5)+d(m,4).*d(n,4)+d(m,3).*d(n,3)...
%              +d(m,2).*d(n,2)+d(m,1).*d(n,1)+d(m,21).*d(n,21)+d(m,22).*d(n,22)+d(m,23).*d(n,23)+d(m,24).*d(n,24)+d(m,25).*d(n,25)+d(m,26).*d(n,26)+d(m,27).*d(n,27)...
%              +d(m,28).*d(n,28)+d(m,29).*d(n,29)+d(m,30).*d(n,30)+d(m,31).*d(n,31)+d(m,32).*d(n,32)+d(m,33).*d(n,33)+d(m,34).*d(n,34)+d(m,35).*d(n,35)+d(m,36).*d(n,36)...
%              +d(m,37).*d(n,37)+d(m,38).*d(n,38)+d(m,39).*d(n,39)+d(m,40).*d(n,40)).^2;
         e1(m,n)=abs(d(m,21)*d(n,21))^2;                          
         e2(m,n)=abs(d(m,21)*d(n,20)+d(m,20)*d(n,21))^2;
         e3(m,n)=abs(d(m,19)*d(n,21)+d(m,21)*d(n,19))^2;
         e4(m,n)=abs(d(m,20)*d(n,20)+d(m,19)*d(n,19))^2;
 %       eb(m,n)=abs(besselj(m-20,2*C1*z1)*besselj(n-19,2*C1*z1)+besselj(m-19,2*C1*z1)*besselj(n-20,2*C1*z1));
         
    end
end
e1=e1/max(e1(:));
e2=e2/max(e2(:));
e3=e3/max(e3(:));
e4=e4/max(e4(:));

figure(1)
subplot(2,2,1)
f1=bar3(e1);
set(f1, 'LineStyle','none');
set(gca,'xtick',[1:20:41]);
set(gca,'ytick',[1:20:41]);
set(gca,'xticklabel',[-20:20:20]);
set(gca,'yticklabel',[-20:20:20]);

subplot(2,2,2)
f1=pcolor(e2);
set(f1, 'LineStyle','none');
set(gca,'xtick',[1:20:41]);
set(gca,'ytick',[1:20:41]);
set(gca,'xticklabel',[-20:20:20]);
set(gca,'yticklabel',[-20:20:20]);

subplot(2,2,3)
f1=pcolor(e3);
set(f1, 'LineStyle','none');
set(gca,'xtick',[1:20:41]);
set(gca,'ytick',[1:20:41]);
set(gca,'xticklabel',[-20:20:20]);
set(gca,'yticklabel',[-20:20:20]);

subplot(2,2,4)
f1=pcolor(e4);
set(f1, 'LineStyle','none');
set(gca,'xtick',[1:20:41]);
set(gca,'ytick',[1:20:41]);
set(gca,'xticklabel',[-20:20:20]);
set(gca,'yticklabel',[-20:20:20]);
