%%双光子路径纠缠态的关联性质，双光子同时处于N根波导的某一根之中，  the same as path_entangled_state
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
         e1(m,n)=abs(d(m,21).*d(n,21)).^2;                                                                          % N=1
         e2(m,n)=abs(d(m,20).*d(n,20)+d(m,21).*d(n,21)).^2;                                                         % N=2
         e4(m,n)=abs(d(m,18).*d(n,18)+d(m,19).*d(n,19)+d(m,20).*d(n,20)+d(m,21).*d(n,21)).^2;                       % N=4
         e6(m,n)=abs(d(m,17).*d(n,17)+d(m,19).*d(n,19)+d(m,20).*d(n,20)+d(m,22).*d(n,22)+d(m,21).*d(n,21)+d(m,18).*d(n,18)).^2;      % N=6
         e8(m,n)=abs(d(m,16).*d(n,16)+d(m,17).*d(n,17)+d(m,19).*d(n,19)+d(m,20).*d(n,20)+d(m,22).*d(n,22)+d(m,21).*d(n,21)+d(m,18).*d(n,18)+d(m,23).*d(n,23)).^2;      % N=8
         e10(m,n)=abs(d(m,15).*d(n,15)+d(m,24).*d(n,24)+d(m,16).*d(n,16)+d(m,17).*d(n,17)+d(m,19).*d(n,19)+d(m,20).*d(n,20)+d(m,22).*d(n,22)+d(m,21).*d(n,21)+d(m,18).*d(n,18)+d(m,23).*d(n,23)).^2;      % N=10
    end
end 
figure
subplot(2,3,1)
 f1=pcolor(e1/max(max(e1)));
   set(f1, 'LineStyle','none');
   set(gca,'xtick',[1:10:41]);
   set(gca,'ytick',[1:10:41]);
   set(gca,'xticklabel',[-20:10:20]);
   set(gca,'yticklabel',[-20:10:20]);
%    axis equal
%    shading interp
   
   subplot(2,3,2)
 f1=pcolor(e2/max(max(e2)));
   set(f1, 'LineStyle','none');
   set(f1, 'LineStyle','none');
   set(gca,'xtick',[1:20:41]);
   set(gca,'ytick',[1:20:41]);
   set(gca,'xticklabel',[-20:10:20]);
   set(gca,'yticklabel',[-20:10:20]);
   
   subplot(2,3,3)
 f1=pcolor(e4/max(max(e4)));
   set(f1, 'LineStyle','none');
   set(f1, 'LineStyle','none');
   set(gca,'xtick',[1:20:41]);
   set(gca,'ytick',[1:20:41]);
   set(gca,'xticklabel',[-20:10:20]);
   set(gca,'yticklabel',[-20:10:20]);
   
 subplot(2,3,4)
 f1=pcolor(e6/max(max(e6)));
   set(f1, 'LineStyle','none');
   set(f1, 'LineStyle','none');
   set(gca,'xtick',[1:20:41]);
   set(gca,'ytick',[1:20:41]);
   set(gca,'xticklabel',[-20:10:20]);
   set(gca,'yticklabel',[-20:10:20]);
   
   subplot(2,3,5)
 f1=pcolor(e8/max(max(e8)));
   set(f1, 'LineStyle','none');
   set(f1, 'LineStyle','none');
   set(gca,'xtick',[1:20:41]);
   set(gca,'ytick',[1:20:41]);
   set(gca,'xticklabel',[-20:10:20]);
   set(gca,'yticklabel',[-20:10:20]);
   
   subplot(2,3,6)
 f1=pcolor(e10/max(max(e10)));
   set(f1, 'LineStyle','none');
   set(f1, 'LineStyle','none');
   set(gca,'xtick',[1:20:41]);
   set(gca,'ytick',[1:20:41]);
   set(gca,'xticklabel',[-20:10:20]);
   set(gca,'yticklabel',[-20:10:20]);
   toc