function mp=SumPotential(A_max,mp1,mp2)
mp=0*mp1;
for i=1:length(mp(:,1))
    for j=1:length(mp(1,:))
        mp(i,j)=min(mp1(i,j)+mp2(i,j),A_max);
    end
end
end