function [  ] = compare( experiment_num )
    Initialization();
    svm_para=sprintf('%s','-s 0 -t 0');
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% debug %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    total_repeat_num=2;begin_num=10;end_num=11;count=zeros(end_num*10,(end_num-begin_num+1)*total_repeat_num); 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% debug %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for num=begin_num:end_num
        for repeat_num=1:total_repeat_num
            switch experiment_num
                case {1,2,3,4,5,6,7,8,9}
                    file_name=sprintf('%s%s%d%s%d%s',input_file_dir,'X_',num*5*2,'_',repeat_num,'.mat');
                    load(file_name);  
                    file_name=sprintf('%s%s%d%s%d%s',input_file_dir,'Y_',num*5*2,'_',repeat_num,'.mat');
                    load(file_name);
                case {21,22,23,25,26,27}
                    file_name=sprintf('%s%s',input_file_dir,'X.mat');
                    load(file_name);  
                    file_name=sprintf('%s%s%d%s',input_file_dir,'Y_',repeat_num,'.mat');
                    load(file_name);   
                case {11,24,28}
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
            tic
            W_MV( (num-begin_num)*total_repeat_num+repeat_num,: )=Majority_Method(X,Y,svm_para);
            Time_MV ((num-begin_num)*total_repeat_num+repeat_num)= toc;
            tic
            W_M3V( (num-begin_num)*total_repeat_num+repeat_num,: )=M3V(X,Y,svm_para);
            Time_M3V ((num-begin_num)*total_repeat_num+repeat_num)= toc;
            tic
            W_YAN( (num-begin_num)*total_repeat_num+repeat_num,: )=YAN(X,Y);
            Time_YAN ((num-begin_num)*total_repeat_num+repeat_num)= toc;            
            tic
            [W_LCM( (num-begin_num)*total_repeat_num+repeat_num,: ),count( 1:2*n,(num-begin_num)*total_repeat_num+repeat_num )]=LCM(X,Y,svm_para);
%             =Soft_LCM(X,count( 1:2*n,(num-begin_num)*total_repeat_num+repeat_num ));
            Time_Soft_LCM((num-begin_num)*total_repeat_num+repeat_num)= toc;
%             tic
%             [Model_ABEL(1:expert_num,(num-begin_num)*total_repeat_num+repeat_num),weight(1:expert_num,(num-begin_num)*total_repeat_num+repeat_num)]=ABEL(X,Y,svm_para);
%             Time_ABEL ((num-begin_num)*total_repeat_num+repeat_num)= toc;
%             tic
%             [parameter((num-begin_num)*total_repeat_num+repeat_num,1),Model_DCS_LA(1:expert_num,(num-begin_num)*total_repeat_num+repeat_num)]=DCS_LA(X,Y,svm_para,K);
%             Time_DCS_LA ((num-begin_num)*total_repeat_num+repeat_num)= toc;

            [n,d]=size(X);
            X(:,d+1)=1;d=d+1;  
            for i=1:n
                for t=1:expert_num
                    if(Y(i,t)==-1)
                        Y(i,t)=0;
                    end
                end
            end
            tic
            W_LFC( (num-begin_num)*total_repeat_num+repeat_num,: )=LFC(X,Y);
            Time_LFC( (num-begin_num)*total_repeat_num+repeat_num )= toc;
            tic
            W_PC( (num-begin_num)*total_repeat_num+repeat_num,: )=PC(X,Y);
            Time_PC ((num-begin_num)*total_repeat_num+repeat_num)= toc;
            dis_information=sprintf('%s%d  %s%d\n','num=',num,'repeat_num=',repeat_num);
            disp(dis_information);
        end

        file_name=sprintf('%s%s',output_file_dir,'W_LFC.mat');
        save(file_name,'W_LFC');
        file_name=sprintf('%s%s',output_file_dir,'W_PC.mat');
        save(file_name,'W_PC');
        file_name=sprintf('%s%s',output_file_dir,'W_MV.mat');
        save(file_name,'W_MV');
        file_name=sprintf('%s%s',output_file_dir,'W_M3V.mat');
        save(file_name,'W_M3V');
        file_name=sprintf('%s%s',output_file_dir,'W_YAN.mat');
        save(file_name,'W_YAN');        
        file_name=sprintf('%s%s',output_file_dir,'W_LCM.mat');
        save(file_name,'W_LCM');
        count=count';
        file_name=sprintf('%s%s',output_file_dir,'count.mat');
        save(file_name,'count');
%         file_name=sprintf('%s%s',output_file_dir,'Model_ABEL.mat');
%         save(file_name,'Model_ABEL','weight');
%         file_name=sprintf('%s%s',output_file_dir,'Model_DCS_LA.mat');
%         save(file_name,'Model_DCS_LA','parameter');   

%         if experiment_num == 3 || experiment_num == 4
        file_name=sprintf('%s%s',output_file_dir,'Time.mat');
        save(file_name,'Time_*');
%         end

    end
end