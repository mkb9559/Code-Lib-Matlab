function mp=Gauss2D(para,Xsqe,Ysqe)
x0 = para(1);
y0 = para(2);
A  = para(5);
sigmax = para(3);
sigmay = para(4);

[X,Y] = meshgrid(Xsqe,Ysqe);
mp = A*exp(-((X-x0).*(X-x0)/(2*sigmax^2)+(Y-y0).*(Y-y0)/(2*sigmay^2)));

end