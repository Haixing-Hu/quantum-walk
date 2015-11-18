%Anderson局域化，画出图5.4(d,h)
clear all
clc
tic
format long

C1=2.0;
D1=0.5*C1;     % 无序度可以随意调节：0.25对应b&f,0.5对应c&g, 0.75对应d&h
D2=0.0*C1;     % 对应无序度为0
C2=2.0;
dx=0.5e-6;
Nmax=41;       % 非线性阵列由41根波导组成
N=Nmax*Nmax;   
x=dx:dx:10e-6*Nmax;
z1=4;
z=0:0.01:z1;
% c=@(m,n)C*KronD(m,n+1)+C*KronD(m,n-1);                     %无序情况下只需要改变耦合系数C的值
% c=@(m,n)(C1-D1+2*D1*rand(1))*(KronD(m,n+1)+KronD(m,n-1));    %引入随机的耦合系数[-D1,D1]，C1为平均值，D1为无序的大小，2D2*rand(1)为无序宽度
 c=@(m,n)(C1-D1*rand(1))*(KronD(m,n+1)+KronD(m,n-1));
times=100;            %时间取10需要6分钟，动量关联失真
% times=100;         %时间取值越多越精确，取值100需要运算一个小时
% times=1000;

ki=-1*pi:0.1:1*pi;
ks=-1*pi:0.1:1*pi;
ni=-20:1:20;
ns=-20:1:20;

b=zeros(Nmax,Nmax);           % 各项矩阵元的初始值皆为0
k1=zeros(N,N);
ff1=zeros(Nmax,Nmax);
ff2=zeros(Nmax,Nmax);
ff3=zeros(Nmax,Nmax);
ff4=zeros(Nmax,Nmax);
gg1=zeros(Nmax,Nmax,length(ki),length(ks));
gg2=zeros(Nmax,length(ki),length(ks));
gg3=zeros(length(ki),length(ks));
gg4=zeros(length(ki),length(ks));
gg5=zeros(length(ki),length(ks));

for t=1:times
  for m=1:Nmax     
      for n=m:Nmax
        b(m,n)=c(m,n);    %随机产生的耦合系数矩阵不对称，为了保证对称，只产生上半矩阵
      end
    for n=1:m
        b(m,n)=b(n,m);    % 定义下半矩阵与上半矩阵对称
    end
  end

for mm=1:N
    for nn=1:N
       m=ceil(mm/Nmax);                       % m,n,k,l取值都为1:41
       n=ceil(nn/Nmax);
       k=mm-Nmax*(m-1);
       l=nn-Nmax*(n-1); 
       if m==n && (k-l-1)*(k-l+1)==0         % 若m=n,并且 k=l+1 或 k=l-1
               k1(mm,nn)=b(k,l);             
       else if k==l && (m-n-1)*(m-n+1)==0        %若k=l,并且 m=n+1  或 m=n-1
               k1(mm,nn)=b(m,n);
       else    k1(mm,nn)=0;
           end
    end
 %   k1(mm,nn)=-KronD(m,n)*KronD(k,l+1)*b(k,l)-KronD(m,n)*KronD(k,l-1)*b(k,l)-KronD(m,n+1)*KronD(k,l)*b(m,n)-KronD(m,n-1)*KronD(k,l)*b(m,n);
    end    
end

gamma=1e-5;            % 非线性系数
gamma1=0;
 for mm=1:N
 m=ceil(mm/Nmax);
 n=mm-Nmax*(m-1);
 k1(mm,mm)=gamma*(-1)^mm;
% k1(mm,mm)=gamma*(-1)^mm+b2(m,m)+b2(n,n);
end

g=1e-3;
np1=21;               %从中间波导第21根输入

k2=zeros(N,1);             %  列矩阵元为0
k2((np1-1)*Nmax+np1,1)=i*g;    
% k2((np2-1)*Nmax+np2,1)=i*g;
% k2=ones(N,1)*i*g;

k11=sparse(k1);
k12=k11\speye(N)*k2;

f1=expm(i*k11*z1)*k12-k12;              %  含有常数项的微分方程的解，Psi解的值

% ff1=zeros(times,Nmax,Nmax);
% ff2=zeros(times,Nmax,Nmax);
% ff3=zeros(Nmax,Nmax);

 for mm=1:Nmax          % mm,nn的取值范围1:41
    for nn=1:Nmax
        ff1(mm,nn)=f1(Nmax*(mm-1)+nn);            
    end
end
ff2=ff2+abs(ff1).^2;                              % 各项位置关联的求和表达式

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for ii=1:Nmax
       for ss=1:Nmax 
           for mm=1:length(ki)
              for nn=1:length(ks)
        gg1(ii,ss,mm,nn)=ff1(ii,ss)*exp(-i*ki(mm)*ni(ii)-i*ks(nn)*ns(ss));     % 动量关联表达式
        gg2(ii,mm,nn)=sum(gg1(ii,:,mm,nn));             % 信号光各项求和
        gg3(mm,nn)=sum(gg2(:,mm,nn));                   % 闲置光各项求和
              end
         end
    end
 end

gg4=gg4+abs(gg3).^2;                   % gg4对应每次计算数值的累加求和
end
gg5=gg4/times;                         % gg5对应取100次计算的平均值
% gg5=abs(gg5).^2;
figure(1)               
gg6=gg5/max(max(gg5));                 % 图1画出取平均后归一化的动量关联图
f=pcolor(gg6);
colormap(jet);
% shading interp 
set(f,'LineStyle','None');
set(gca,'xtick',[1:20:41]);
set(gca,'ytick',[1:20:41]);
set(gca,'xticklabel',[-pi:pi:pi]);
set(gca,'yticklabel',[-pi:pi:pi]);
set(gca,'FontSize',10);
xlabel('k_s');
ylabel('k_i');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ff3=ff2/times;                        % ff2对应Psi_(ns,ni)
% ff3=abs(ff2).^2;
figure(2)                             % 图2画出取平均后归一化的位置关联图
ff4=ff3/max(max(ff3));                
f=pcolor(ff4);
colormap(jet);
set(f,'LineStyle','None');
set(gca,'xtick',[1:20:41]);
set(gca,'ytick',[1:20:41]);
set(gca,'xticklabel',[-20:20:20]);
set(gca,'yticklabel',[-20:20:20]);
set(gca,'FontSize',30);
xlabel('n_s');
ylabel('n_i');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 非线性波导阵列中单光子强度的分布曲线
for mm=1:Nmax
    intensity1(mm)=sum(ff3(:,mm));   
end
intensity1=intensity1/sum(intensity1);

for mm=1:2*Nmax-1
    if mm>20 && mm<62
        intensity_g(mm)=intensity1(mm-20);
    else
        intensity_g(mm)=0;
    end
end

intensity_g1=sum(abs(intensity_g(:)));
intensity_g=intensity_g/sqrt(intensity_g1);
intensity_g2=intensity_g';

for mm=0:Nmax-1
    for nn=1:Nmax-mm
        intensity2(mm+1,nn)=ff3(mm+nn,nn);
        intensity22(mm+1)=sum(intensity2(mm+1,:));
    end
end

for mm=-Nmax+1:-1
    for nn=1-mm:Nmax
        intensity3(-mm,nn)=ff3(mm+nn,nn);
        intensity33(-mm)=sum(intensity3(-mm,:));
    end
end

for mm=1:2*Nmax-1
    if mm<Nmax
        intensity_f(mm)=intensity33(Nmax-mm);
    else
        intensity_f(mm)=intensity22(mm-Nmax+1);
    end
end  

intensity_f1=sum(abs(intensity_f(:)));
intensity_f=intensity_f/sqrt(intensity_f1);
intensity_f2=intensity_f';

figure                             %
gg=plot(intensity_g);                          % 画出
set(gca,'xtick',[1:20:81]);
set(gca,'xticklabel',[-40:20:40]);

hold on
ff=plot(intensity_f);
toc