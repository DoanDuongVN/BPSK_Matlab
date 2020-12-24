header=[0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 0 1 1 1];
r=audiorecorder(10000,8,1);
record(r);
stop(r);
ythu=getaudiodata(r);
plot(ythu);
[M N]=size(ythu);
t=0:2*pi/(10000/1000):M/5*pi;
x=sin(t);
[A B]=size(x);
x=x(1:M);
ythu=ythu'.*x;
[b a]=butter(5,500/5000);
yf=filter(b,a,ythu);
bit=[];
for i=1:M if (yf(i)>0)
 a=ones;
else (yf(i)<0)
 a=zeros;
end
bit=[bit a];
end
alpha=floor(M/20);
bit=bit(1:alpha*20);
plot(bit);
rx=reshape(bit,20,alpha);
rr=rx(10,:)
[p q]=size(dongbo);
for i=1:alpha-q;
syn(i)=sum(dongbo.*rr(i:i+q-1));
end
[u v]=size(syn);
index=Find_Index_Max(syn, v, max(syn));
clear [u v];
payload=(rr(index:index+240+q-1));
%q=[payload(2:240+q) payload(1)];
q1=payload(q+1:260)
r1=reshape(q1,8,240/8)
r1=r1';
r1=bi2de(r1,'left-msb')
size(r1)
r2=char(r1)
r2=r2'
