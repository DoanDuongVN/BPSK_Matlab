text = dec2bin('Duong Van Doan Tran Xuan Hung ',8);
text = text';
text = double(text(:)') - 48;
np=text;

header=[0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 0 1 1 1];
y=[dongbo np];

y1=kron(ones(20,1),y);
y1=y1(:);

y2=real(pammod(y1,2));

t=0:2*pi/(10000/1000):10000*pi;
x=sin(t);

[M,N] = size(y2);
x=x(1:M);
plot(x.*y2');
yphat=(x.*y2');
sound(yphat,10000,8);
