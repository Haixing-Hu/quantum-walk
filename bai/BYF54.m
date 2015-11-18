%Anderson���򻯣�����ͼ5.4(d,h)
clear all
clc
tic
format long

C1=2.0;
D1=0.5*C1;     % ����ȿ���������ڣ�0.25��Ӧb&f,0.5��Ӧc&g, 0.75��Ӧd&h
D2=0.0*C1;     % ��Ӧ�����Ϊ0
C2=2.0;
dx=0.5e-6;
Nmax=41;       % ������������41���������
N=Nmax*Nmax;   
x=dx:dx:10e-6*Nmax;
z1=4;
z=0:0.01:z1;
% c=@(m,n)C*KronD(m,n+1)+C*KronD(m,n-1);                     %���������ֻ��Ҫ�ı����ϵ��C��ֵ
% c=@(m,n)(C1-D1+2*D1*rand(1))*(KronD(m,n+1)+KronD(m,n-1));    %������������ϵ��[-D1,D1]��C1Ϊƽ��ֵ��D1Ϊ����Ĵ�С��2D2*rand(1)Ϊ������
 c=@(m,n)(C1-D1*rand(1))*(KronD(m,n+1)+KronD(m,n-1));
times=100;            %ʱ��ȡ10��Ҫ6���ӣ���������ʧ��
% times=100;         %ʱ��ȡֵԽ��Խ��ȷ��ȡֵ100��Ҫ����һ��Сʱ
% times=1000;

ki=-1*pi:0.1:1*pi;
ks=-1*pi:0.1:1*pi;
ni=-20:1:20;
ns=-20:1:20;

b=zeros(Nmax,Nmax);           % �������Ԫ�ĳ�ʼֵ��Ϊ0
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
        b(m,n)=c(m,n);    %������������ϵ�����󲻶Գƣ�Ϊ�˱�֤�Գƣ�ֻ�����ϰ����
      end
    for n=1:m
        b(m,n)=b(n,m);    % �����°�������ϰ����Գ�
    end
  end

for mm=1:N
    for nn=1:N
       m=ceil(mm/Nmax);                       % m,n,k,lȡֵ��Ϊ1:41
       n=ceil(nn/Nmax);
       k=mm-Nmax*(m-1);
       l=nn-Nmax*(n-1); 
       if m==n && (k-l-1)*(k-l+1)==0         % ��m=n,���� k=l+1 �� k=l-1
               k1(mm,nn)=b(k,l);             
       else if k==l && (m-n-1)*(m-n+1)==0        %��k=l,���� m=n+1  �� m=n-1
               k1(mm,nn)=b(m,n);
       else    k1(mm,nn)=0;
           end
    end
 %   k1(mm,nn)=-KronD(m,n)*KronD(k,l+1)*b(k,l)-KronD(m,n)*KronD(k,l-1)*b(k,l)-KronD(m,n+1)*KronD(k,l)*b(m,n)-KronD(m,n-1)*KronD(k,l)*b(m,n);
    end    
end

gamma=1e-5;            % ������ϵ��
gamma1=0;
 for mm=1:N
 m=ceil(mm/Nmax);
 n=mm-Nmax*(m-1);
 k1(mm,mm)=gamma*(-1)^mm;
% k1(mm,mm)=gamma*(-1)^mm+b2(m,m)+b2(n,n);
end

g=1e-3;
np1=21;               %���м䲨����21������

k2=zeros(N,1);             %  �о���ԪΪ0
k2((np1-1)*Nmax+np1,1)=i*g;    
% k2((np2-1)*Nmax+np2,1)=i*g;
% k2=ones(N,1)*i*g;

k11=sparse(k1);
k12=k11\speye(N)*k2;

f1=expm(i*k11*z1)*k12-k12;              %  ���г������΢�ַ��̵Ľ⣬Psi���ֵ

% ff1=zeros(times,Nmax,Nmax);
% ff2=zeros(times,Nmax,Nmax);
% ff3=zeros(Nmax,Nmax);

 for mm=1:Nmax          % mm,nn��ȡֵ��Χ1:41
    for nn=1:Nmax
        ff1(mm,nn)=f1(Nmax*(mm-1)+nn);            
    end
end
ff2=ff2+abs(ff1).^2;                              % ����λ�ù�������ͱ��ʽ

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for ii=1:Nmax
       for ss=1:Nmax 
           for mm=1:length(ki)
              for nn=1:length(ks)
        gg1(ii,ss,mm,nn)=ff1(ii,ss)*exp(-i*ki(mm)*ni(ii)-i*ks(nn)*ns(ss));     % �����������ʽ
        gg2(ii,mm,nn)=sum(gg1(ii,:,mm,nn));             % �źŹ�������
        gg3(mm,nn)=sum(gg2(:,mm,nn));                   % ���ù�������
              end
         end
    end
 end

gg4=gg4+abs(gg3).^2;                   % gg4��Ӧÿ�μ�����ֵ���ۼ����
end
gg5=gg4/times;                         % gg5��Ӧȡ100�μ����ƽ��ֵ
% gg5=abs(gg5).^2;
figure(1)               
gg6=gg5/max(max(gg5));                 % ͼ1����ȡƽ�����һ���Ķ�������ͼ
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
ff3=ff2/times;                        % ff2��ӦPsi_(ns,ni)
% ff3=abs(ff2).^2;
figure(2)                             % ͼ2����ȡƽ�����һ����λ�ù���ͼ
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
% �����Բ��������е�����ǿ�ȵķֲ�����
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
gg=plot(intensity_g);                          % ����
set(gca,'xtick',[1:20:81]);
set(gca,'xticklabel',[-40:20:40]);

hold on
ff=plot(intensity_f);
toc