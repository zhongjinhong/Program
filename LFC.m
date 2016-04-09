function [w0]=LFC(X,Y)
    options = optimset('GradObj','on');
    options.TolX=0.1;
    options.MaxFunEvals=1000;
    options.MaxIter=20;
    global X_global miu ai bi;
    X_global=X;
    
    emusinou=10^(-20);
    d=size(X,2);
    [n,m]=size(Y);
    %%%%%% modified %%%%%%%%%%%%%%
    Y_1 = (Y==1);
    Y_0 = (Y==0);
    miu = ( sum(Y_1,2)+emusinou )./( sum(Y_1,2)+sum(Y_0,2)+2*emusinou );
    alpha=( miu'*Y_1 )./( miu'*(Y_1+Y_0) );
    beta=( (1-miu)'*Y_0 )./( (1-miu)'*(Y_1+Y_0) );
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     miu=sum(Y,2)/m;
%     sum_miu=sum(miu);
%     alpha=miu'*Y/sum_miu;
%     beta=(1-miu)'*(1-Y)/(n-sum_miu);
    
    W0=zeros(d,1);

%     [w0,flag]=newton(W0,@likelihood,X,Y,miu);
    [ai,bi]=calculate_ai_bi(alpha,beta,Y);
    [w0,fval] = fminlbfgs(@likelihood1,W0,options);

    pi=calculate_pi(w0,X);
    t=1;
    while t<=100
        [ai,bi]=calculate_ai_bi(alpha,beta,Y);
        for i=1:n
            miu(i)=ai(i,1)*pi(i,1)/( ai(i,1)*pi(i,1)+bi(i,1)*(1-pi(i,1))+emusinou );
        end

        %%%%%% modified %%%%%%%%%%%%%%
        alpha=( miu'*Y_1 )./( miu'*(Y_1+Y_0) );
        beta=( (1-miu)'*Y_0 )./( (1-miu)'*(Y_1+Y_0) );
        [w1,fval] = fminlbfgs(@likelihood1,w0,options);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
%         sum_miu=sum(miu);
%         alpha=miu'*Y/sum_miu;
%         beta=(1-miu)'*(1-Y)/(n-sum_miu);


%         [w1,flag]=newton(w0,@likelihood,X,Y,miu);
%         if(flag==1)
%             [w1,fval] = fminlbfgs(@likelihood1,w0,options);
%         end 
        
        if norm(w1-w0,2)>0.000001;
            w0=w1;
        else
            break
        end
        t=t+1;   
        
        show_message=sprintf('t=%d',t);
        disp(show_message);
    end
end
