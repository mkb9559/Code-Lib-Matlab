function map=LineGauss2D(paraLine,Xsqe,Ysqe,step)
map=0*meshgrid(Xsqe,Ysqe);

if(paraLine(1)>paraLine(2)||paraLine(3)>paraLine(4))
    error='Error Line.'
    return;
end
if(paraLine(1)==paraLine(2))
    px=paraLine(1);
    py=paraLine(3);
    while(py<=paraLine(4))
        para=[px py paraLine(5) paraLine(6) paraLine(7)];
        mp=Gauss2D(para,Xsqe,Ysqe);
        map=SumPotential(100000,mp,map);
        py=py+step;
    end
else
    k=(paraLine(4)-paraLine(3))/(paraLine(2)-paraLine(1));
    px=paraLine(1);
    py=paraLine(3);
    while(px<=paraLine(2))
        para=[px py paraLine(5) paraLine(6) paraLine(7)];
        mp=Gauss2D(para,Xsqe,Ysqe);
        map=SumPotential(100000,mp,map);
        px=px+step;
        py=paraLine(3)+k*(px-paraLine(1));
    end
end
end