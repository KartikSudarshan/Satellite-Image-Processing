function val = gradInvercalc( I,alpha,W_size )
%UNTITLED Summary of this function goes here

%Assume image is of size W_size x W_size
U=zeros(W_size,W_size);
t=ceil(W_size/2);


%Calculating U matrix

for i=1:W_size
for j=1:W_size
if(I(i,j)~=I(t,t))
U(i,j)=1/(abs(I(i,j)-I(t,t)));
else
U(i,j)=2;
end
end
end

%Calculating H matrix

for i=1:W_size
for j=1:W_size
if(i==t &&j== t)
H(i,j)=alpha*U(i,j)/sum(sum(U));
else
H(i,j)=(1-alpha)*U(i,j)/sum(sum(U));
end
end
end

% Calculating G=H*I and 
val=sum(sum(H.*I));

end

