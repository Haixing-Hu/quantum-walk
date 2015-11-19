
clear all
clc
tic

dx=0.5e-6;
x=dx:dx:400e-6;
dz=0.01;
z0=3;
z=0:dz:z0;
C1=2;
C2=0.4*C1;

c=@(m,n)C1*KronD(m,n+1)+C1*KronD(m,n-1)+C2*KronD(m,n+2)+C2*KronD(m,n-2);   % ������ν������ϵ��
cc=@(m,n)C1*KronD(m,n+1)+C1*KronD(m,n-1);                                  % �������ϵ��

for m=1:41
    for n=1:41
        k1(m,n)=cc(m,n);
    end
end

if isequal(k1*k1', eye(size(k1, 1))) 
    disp('INFO: The transformation matrix is unitary.');
else 
    error('ERROR: The transformation matrix is not unitary.');        
end  

d1=expm(-i*z0*k1);                                                         % �任����

for m=1:1:41
    for n=1:1:41
        e1(m,n)=abs(d1(m,20).*d1(n,21)+d1(m,21).*d1(n,20)).^2;             % ��20,21���������룬��m,n����������˲������
    end
end
figure                                                                     % figure 1ͼ
f1=pcolor(e1/max(max(e1)));                                                % 
set(f1,'Linestyle','none');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%���ϻ��������������ͼ�����»���
W0=5e-6;
for mm=1:length(x);
    mode(mm)=exp(-((x(mm)-20*ceil(mm/20)*dx+10*dx)/W0)^2);
end

for ii=1:length(z)
    d1=expm(-i*z(ii)*k1);    
    for mm=1:length(x)
        e3(ii,mm)=abs(d1(ceil(mm/20),20)*mode(mm))^2;
    end
end

figure
subplot(1,2,1)
f=pcolor(e3);
colormap(hot);
set(f,'Linestyle','None');
set(gca,'xtick',[0:200:800]);
set(gca,'ytick',[0:100:2000]);
set(gca,'xticklabel',[0:10:41]);
set(gca,'yticklabel',[0:1:20]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(1,2,2)
plot(e3(length(z),:))
set(gca,'xtick',[0:200:800]);
set(gca,'xticklabel',[0:10:40]);

toc