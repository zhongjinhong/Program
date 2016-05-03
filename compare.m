function [  ] = compare( experiment_num )
    Initialization();
    svm_para=sprintf('%s','-s 0 -t 0');
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% debug %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     total_repeat_num=2;begin_num=10;end_num=11;count=zeros(end_num*10,(end_num-begin_num+1)*total_repeat_num); 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% debug %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for num=begin_num:end_num
        for repeat_num=1:total_repeat_num
            switch experiment_num
                case {1,2,3,4,5,6,7,8,9,12,28,29,30,31,32}
                    file_name=sprintf('%s%s%d%s%d%s',input_file_dir,'X_',num*step_num,'_',repeat_num,'.mat');
                    load(file_name);  
                    file_name=sprintf('%s%s%d%s%d%s',input_file_dir,'Y_',num*step_num,'_',repeat_num,'.mat');
                    load(file_name);
                case {21,22,23,25,26,27}
                    file_name=sprintf('%s%s',input_file_dir,'X.mat');
                    load(file_name);  
                    file_name=sprintf('%s%s%d%s',input_file_dir,'Y_',repeat_num,'.mat');
                    load(file_name);   
                case {11,24}
                    file_name=sprintf('%s%s',input_file_dir,'X.mat');
                    load(file_name);  
                    file_name=sprintf('%s%s%s',input_file_dir,'Y_1','.mat');
                    load(file_name);
                    Y_temp=Y;
                    for i = 1:num-1
                        Y = [Y Y_temp];
                    end
                case {10}
                    file_name=sprintf('%s%s',input_file_dir,'X.mat');
                    load(file_name);  
                    file_name=sprintf('%s%s%d%s%d%s',input_file_dir,'Y_',num*5,'_',repeat_num,'.mat');
                    load(file_name);                    
            end
            n=size(X,1);    
            expert_num=size(Y,2);
%             tic
%             W_MV( (num-begin_num)*total_repeat_num+repeat_num,: )=Majority_Method(X,Y,svm_para);
%             Time_MV ((num-begin_num)*total_repeat_num+repeat_num)= toc;
%             tic
%             W_M3V( (num-begin_num)*total_repeat_num+repeat_num,: )=M3V(X,Y,svm_para);
%             Time_M3V ((num-begin_num)*total_repeat_num+repeat_num)= toc;
          
            tic
            [W_LCM( (num-begin_num)*total_repeat_num+repeat_num,: ),count( 1:2*n,(num-begin_num)*total_repeat_num+repeat_num )]=LCM_old(X,Y,svm_para);

            Time_Soft_LCM((num-begin_num)*total_repeat_num+repeat_num)= toc;

% 
%             for i=1:n
%                 for t=1:expert_num
%                     if(Y(i,t)==-1)
%                         Y(i,t)=0;
%                     end
%                 end
%             end
%             
%             
%             tic
%             W_MV_Probability( (num-begin_num)*total_repeat_num+repeat_num,: )=MV_Probability(X,Y,svm_para);
%             Time_MV_Probability((num-begin_num)*total_repeat_num+repeat_num)= toc;
%             tic
%             W_DS_Estimator( (num-begin_num)*total_repeat_num+repeat_num,: )=DS_Estimator(X,Y,svm_para);
%             Time_DS_Estimator ((num-begin_num)*total_repeat_num+repeat_num)= toc;            
% 
% 
%             [n,d]=size(X);
%             X(:,d+1)=1;d=d+1;  
% 
%             tic
%             W_LFC( (num-begin_num)*total_repeat_num+repeat_num,: )=LFC(X,Y);
%             Time_LFC( (num-begin_num)*total_repeat_num+repeat_num )= toc;
%             tic
%             W_PC( (num-begin_num)*total_repeat_num+repeat_num,: )=PC(X,Y);
%             Time_PC ((num-begin_num)*total_repeat_num+repeat_num)= toc;

            
            dis_information=sprintf('%s%d  %s%d\n','num=',num,'repeat_num=',repeat_num);
            disp(dis_information);
            pause(1)
        end

%         file_name=sprintf('%s%s',output_file_dir,'W_LFC.mat');
%         save(file_name,'W_LFC');
%         file_name=sprintf('%s%s',output_file_dir,'W_PC.mat');
%         save(file_name,'W_PC');
%         file_name=sprintf('%s%s',output_file_dir,'W_MV.mat');
%         save(file_name,'W_MV');
%         file_name=sprintf('%s%s',output_file_dir,'W_M3V.mat');
%         save(file_name,'W_M3V');      
        file_name=sprintf('%s%s',output_file_dir,'W_LCM.mat');
        save(file_name,'W_LCM');
%         
%         
%         file_name=sprintf('%s%s',output_file_dir,'W_MV_Probability.mat');
%         save(file_name,'W_MV_Probability');
%         file_name=sprintf('%s%s',output_file_dir,'W_DS_Estimator.mat');
%         save(file_name,'W_DS_Estimator');
%         
        
        count=count;
        file_name=sprintf('%s%s',output_file_dir,'count.mat');
        save(file_name,'count','-v7.3');

        file_name=sprintf('%s%s',output_file_dir,'Time.mat');
        save(file_name,'Time_*');


    end
end