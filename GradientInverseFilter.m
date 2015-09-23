function I_final = GradientInverseFilter( I,alpha,w_size )
%UNTITLED Summary of this function goes here
%   This function is the parent function which computes the gradient
%   inverse filtered image. 
%   Inputs:
%   I = the input image which is to be filtered.
%   alpha = the weight of the center pixel. The Range must be [0,1].
%   w_size = the size of the window. The size of the filter must be odd.

%----------------Initializations-------------------------------------------
[row,col,dim]=size(I);
s=(w_size-1)/2;
rowp=row+w_size-1;
colp=col+w_size-1;

I_padded=zeros(rowp,colp);
I_padded(1+s:(rowp-s),1+s:(colp-s))=I;
I_f=zeros(rowp,colp);

%--------------Computing the Gradient inverse for the entire image---------
for i=1+s:(rowp-s)
    for j=1+s:(colp-s)
        %Compute the gradient inverse coefficients 
           I_f(i,j) = gradInvercalc( I_padded(i-s:i+s,j-s:j+s),alpha,w_size );
    end
end
I_final= I_f(1+s:(rowp-s),1+s:(colp-s));

end

