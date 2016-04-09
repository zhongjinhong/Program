function [  ] = handle_result( experiment_num )
    Initialization();
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% debug %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    total_repeat_num=10;begin_num=10;end_num=11;count=zeros(end_num*10,(end_num-begin_num+1)*total_repeat_num); 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% debug %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    repeat_num=total_repeat_num;
    file_name=sprintf('%s%s',input_file_dir,'X_test.txt');
    X_test=load(file_name);
    file_name=sprintf('%s%s',input_file_dir,'Y_test.txt');
    Y_test=load(file_name);

    file_name=sprintf('%s%s',output_file_dir,'W_LFC.txt');
    W_LFC=load(file_name);
    file_name=sprintf('%s%s',output_file_dir,'W_PC.txt');
    W_PC=load(file_name);
    file_name=sprintf('%s%s',output_file_dir,'W_MV.txt');
    W_MV=load(file_name);
    file_name=sprintf('%s%s',output_file_dir,'W_M3V.txt');
    W_M3V=load(file_name);
    file_name=sprintf('%s%s',output_file_dir,'W_YAN.txt');
    W_M3V=load(file_name);    
    %%%%%%%%%%%%%%%%%
    file_name=sprintf('%s%s',output_file_dir,'W_LCM.txt');
    W_LCM1=load(file_name);
    %%%%%%%%%%%%%%%%%%%%
    % file_name=sprintf('%s%s',output_file_dir,'Model_LCM.mat');
    % Model_LCM=load(file_name);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    file_name=sprintf('%s%s',output_file_dir,'Model_ABEL.mat');
    load(file_name);
    file_name=sprintf('%s%s',output_file_dir,'Model_DCS_LA.mat');
    load(file_name);

    [n d]=size(X_test);
    X_test(:,d+1)=ones(n,1);
    total_iteration_num=size(W_LCM1,1);
    target=(0.5*Y_test+0.5)';
    predict_label=zeros(n,1);
    Result_LFC=zeros(total_iteration_num,1);
    for t=1:total_iteration_num    
        for i=1:n
            predict_label(i,1)=W_LFC(t,:)*X_test(i,:)';
            if(predict_label(i,1)*Y_test(i)>0)
                Result_LFC(t)=Result_LFC(t)+1;
            end
        end
        [tpr,fpr] = roc(target,predict_label');
        point_num = size(tpr,2);
        if tpr(point_num)~=1 || fpr(point_num)~=1
            tpr(1,point_num+1) = 1;
            fpr(1,point_num+1) = 1;
        end
        AUC_LFC(t) = trapz(fpr,tpr);
        Result_LFC(t)= Result_LFC(t)/n;
    end

    Result_PC=zeros(total_iteration_num,1);
    for t=1:total_iteration_num    
        for i=1:n
             predict_label(i,1)=W_PC(t,:)*X_test(i,:)';
            if(predict_label(i,1)*Y_test(i)>0)
                Result_PC(t)=Result_PC(t)+1;
            end
        end
        [tpr,fpr] = roc(target,predict_label');
        point_num = size(tpr,2);
        if tpr(point_num)~=1 || fpr(point_num)~=1
            tpr(1,point_num+1) = 1;
            fpr(1,point_num+1) = 1;
        end
        AUC_PC(t) = trapz(fpr,tpr);
        Result_PC(t)= Result_PC(t)/n;
    end

    Result_MV=zeros(total_iteration_num,1);
    for t=1:total_iteration_num    
        for i=1:n
            predict_label(i,1)=W_MV(t,:)*X_test(i,:)';
            if(predict_label(i,1)*Y_test(i)>=0)
                Result_MV(t)=Result_MV(t)+1;
            end
        end
        [tpr,fpr] = roc(target,predict_label');
        point_num = size(tpr,2);
        if tpr(point_num)~=1 || fpr(point_num)~=1
            tpr(1,point_num+1) = 1;
            fpr(1,point_num+1) = 1;
        end
        AUC_MV(t) = trapz(fpr,tpr);
        Result_MV(t)= Result_MV(t)/n;
    end

    Result_M3V=zeros(total_iteration_num,1);
    for t=1:total_iteration_num    
        for i=1:n
            predict_label(i,1)=W_M3V(t,:)*X_test(i,:)';
            if(predict_label(i,1)*Y_test(i)>=0)
                Result_M3V(t)=Result_M3V(t)+1;
            end
        end
        [tpr,fpr] = roc(target,predict_label');
        point_num = size(tpr,2);
        if tpr(point_num)~=1 || fpr(point_num)~=1
            tpr(1,point_num+1) = 1;
            fpr(1,point_num+1) = 1;
        end
        AUC_M3V(t) = trapz(fpr,tpr);
        Result_M3V(t)= Result_M3V(t)/n;
    end    

    Result_YAN=zeros(total_iteration_num,1);
    for t=1:total_iteration_num    
        for i=1:n
            predict_label(i,1)=W_YAN(t,:)*X_test(i,:)';
            if(predict_label(i,1)*Y_test(i)>=0)
                Result_YAN(t)=Result_YAN(t)+1;
            end
        end
        [tpr,fpr] = roc(target,predict_label');
        point_num = size(tpr,2);
        if tpr(point_num)~=1 || fpr(point_num)~=1
            tpr(1,point_num+1) = 1;
            fpr(1,point_num+1) = 1;
        end
        AUC_YAN(t) = trapz(fpr,tpr);
        Result_YAN(t)= Result_YAN(t)/n;
    end   
    
    Result_LCM1=zeros(total_iteration_num,1);
    for t=1:total_iteration_num    
        for i=1:n
            predict_label(i,1)=W_LCM1(t,:)*X_test(i,:)';
            if(predict_label(i,1)*Y_test(i)>=0)
                Result_LCM1(t)=Result_LCM1(t)+1;
            end
        end
        [tpr,fpr] = roc(target,predict_label');
        point_num = size(tpr,2);
        if tpr(point_num)~=1 || fpr(point_num)~=1
            tpr(1,point_num+1) = 1;
            fpr(1,point_num+1) = 1;
        end
        AUC_LCM1(t) = trapz(fpr,tpr);
        Result_LCM1(t)= Result_LCM1(t)/n;
    end

    Result_ABEL=zeros(total_iteration_num,1);
    
    for t=1:total_iteration_num  
        expert_num =size(find(weight(:,t)~=0),1);
        for i=1:n
            for j=1:expert_num
                [predict_label_temp(j,1),accuracy,decision]=svmpredict(Y_test(i),X_test(i,1:d),Model_ABEL(j,t));
            end
            predict_label(i,1)=predict_label_temp'*weight(1:expert_num,t);        
            if(predict_label(i,1)*Y_test(i)>0)
                Result_ABEL(t)=Result_ABEL(t)+1;
            end
        end
        [tpr,fpr] = roc(target,predict_label');
        point_num = size(tpr,2);
        if tpr(point_num)~=1 || fpr(point_num)~=1
            tpr(1,point_num+1) = 1;
            fpr(1,point_num+1) = 1;
        end
        AUC_ABEL(t) = trapz(fpr,tpr);
        Result_ABEL(t)= Result_ABEL(t)/n;
    end


    Result_DCS_LA=zeros(total_iteration_num,1);
    K=size( parameter(1,1).C,1);
    for t=1:total_iteration_num    
        for i=1:n
            for j=1:K
                distance(j)=norm( parameter(t,1).C(j,:)-X_test(i,1:d),2 );
            end
            selection=find(distance==min(distance));
            selection=parameter(t,1).model_selection(selection,1);
    %         model=Model_DCS_LA(selection,t);
    %         W=[model.sv_coef'*model_test.SVs -model.rho];        
    %         if(model.Label(1)~=1)
    %             W=-W;
    %         end 
    %         predict_label(i,1)=
            [predict_label(i,1),accuracy,decision]=svmpredict(Y_test(i),X_test(i,1:d),Model_DCS_LA(selection,t));
            if(predict_label(i,1)*Y_test(i)>0)
                Result_DCS_LA(t)=Result_DCS_LA(t)+1;
            end
        end

        tp=0;fp=0;tn=0;fn=0;
        for lll=1:151
            if(predict_label(lll,1)==1)
                if(Y_test(lll,1)==1)
                    tp=tp+1;
                else
                    fp=fp+1;
                end
            else
                if(Y_test(lll,1)==-1)
                    tn=tn+1;
                else
                    fn=fn+1;
                end
            end
        end
        tpr=tp/(tp+fn);fpr=fp/(tn+fp);
        AUC_DCS_LA(t)=fpr*tpr/2+(1-fpr)*(tpr+1)/2;
        Result_DCS_LA(t)= Result_DCS_LA(t)/n;
    end 

    n=size(Result_LCM1,1);
    n=n/repeat_num;
    for i=1:n
        acc_LFC(i)=mean(Result_LFC( (i-1)*repeat_num+1:i*repeat_num));
        acc_PC(i)=mean(Result_PC( (i-1)*repeat_num+1:i*repeat_num));
        acc_MV(i)=mean(Result_MV( (i-1)*repeat_num+1:i*repeat_num));
        acc_M3V(i)=mean(Result_M3V( (i-1)*repeat_num+1:i*repeat_num));
        acc_YAN(i)=mean(Result_YAN( (i-1)*repeat_num+1:i*repeat_num));
    %     LCM(i)=mean(Result_LCM( (i-1)*repeat_num+1:i*repeat_num));
        acc_Soft_LCM(i)=mean( Result_LCM1( (i-1)*repeat_num+1:i*repeat_num) );
        acc_ABEL(i)=mean( Result_ABEL( (i-1)*repeat_num+1:i*repeat_num) );
        acc_DCS_LA(i)=mean( Result_DCS_LA( (i-1)*repeat_num+1:i*repeat_num) );

        auc_LFC(i)=mean(AUC_LFC( (i-1)*repeat_num+1:i*repeat_num));
        auc_PC(i)=mean(AUC_PC( (i-1)*repeat_num+1:i*repeat_num));
        auc_MV(i)=mean(AUC_MV( (i-1)*repeat_num+1:i*repeat_num));
        auc_M3V(i)=mean(AUC_M3V( (i-1)*repeat_num+1:i*repeat_num));
        auc_YAN(i)=mean(AUC_YAN( (i-1)*repeat_num+1:i*repeat_num));
        auc_Soft_LCM(i)=mean( AUC_LCM1( (i-1)*repeat_num+1:i*repeat_num) );
        auc_ABEL(i)=mean( AUC_ABEL( (i-1)*repeat_num+1:i*repeat_num) );
        auc_DCS_LA(i)=mean( AUC_DCS_LA( (i-1)*repeat_num+1:i*repeat_num) ); 
    end

    file_name=sprintf('%s%s',output_file_dir,'plot_data.mat');
    save(file_name,'*');
end

