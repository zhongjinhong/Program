function [ w0 ] = Majority_Method(X,Y,svm_para)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [n,expert_num]=size(Y);
    for i = 1:n
        for t = 1:expert_num
            if Y(i,t)~=1 && Y(i,t)~=-1
                Y(i,t) = 0;
            end
        end
    end
    Y=sum(Y,2);
    for i=1:n
        if(Y(i,1)<=0)
            Y(i,1)=-1;
        else
            Y(i,1)=1;
        end
    end
    
    model=svmtrain(ones(n,1),Y,X,svm_para);
    w0=model.sv_coef'*model.SVs;
    b=-model.rho;
    w0=[w0 b];
    if(model.Label(1,1)~=1)
        w0=-w0;
    end
end

