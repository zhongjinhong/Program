switch experiment_num
    case 1
        input_file_dir='../Input Data/Adult/Clustering/';
        output_file_dir='../Output Data/Adult/Clustering/';
        total_repeat_num=20;begin_num=10;end_num=30;step_num = 10;count=zeros(2*end_num*step_num,(end_num-begin_num+1)*total_repeat_num); 
        title_name='Aldult(Yan Yan''s Data)'; 
    case 2
        input_file_dir='../Input Data/Adult/latent model/';
        output_file_dir='../Output Data/Adult/latent model/';
        total_repeat_num=20;begin_num=10;end_num=30;step_num = 10;count=zeros(2*end_num*step_num,(end_num-begin_num+1)*total_repeat_num);  
        title_name='Aldult(Raykar''s Data)'; 
    case 3
        input_file_dir='../Input Data/Adult/expertise_difficult_model/';
        output_file_dir='../Output Data/Adult/expertise_difficult_model/';
        total_repeat_num=20;begin_num=10;end_num=30;step_num = 10;count=zeros(2*end_num*step_num,(end_num-begin_num+1)*total_repeat_num);  
        title_name='Aldult(Whitehill''s Data)'; 
        
    case 4
        input_file_dir='../Input Data/Conect/Clustering/';    
        output_file_dir='../Output Data/Conect/Clustering/';
        total_repeat_num=10;begin_num=1;end_num=55;step_num = 100;count=zeros(2*end_num*step_num,(end_num-begin_num+1)*total_repeat_num); 
        title_name=('Conect(Yan Yan''s Data)'); 
    case 5
        input_file_dir='../Input Data/Conect/latent model/';
        output_file_dir='../Output Data/Conect/latent model/';
        total_repeat_num=10;begin_num=1;end_num=55;step_num = 100;count=zeros(2*end_num*step_num,(end_num-begin_num+1)*total_repeat_num);
        title_name='Conect(Raykar''s Data)';
    case 6
        input_file_dir='../Input Data/Conect/expertise_difficult_model/';
        output_file_dir='../Output Data/Conect/expertise_difficult_model/';
        total_repeat_num=10;begin_num=1;end_num=55;step_num = 100;count=zeros(2*end_num*step_num,(end_num-begin_num+1)*total_repeat_num);
        title_name='Conect(Whitehill''s Data)'; 
                
        
        
    case 7
        input_file_dir='../Input Data/mushroom/Clustering/';
        output_file_dir='../Output Data/mushroom/Clustering/';
        total_repeat_num=20;begin_num=10;end_num=30;step_num = 10;count=zeros(2*end_num*step_num,(end_num-begin_num+1)*total_repeat_num); 
        title_name='mushroom(Yan Yan''s Data)';
    case 8
        input_file_dir='../Input Data/mushroom/latent model/';
        output_file_dir='../Output Data/mushroom/latent model/';
        total_repeat_num=20;begin_num=10;end_num=30;step_num = 10;count=zeros(2*end_num*step_num,(end_num-begin_num+1)*total_repeat_num);
        title_name='mushroom(Raykar''s Data)';        
    case 9
        input_file_dir='../Input Data/mushroom/expertise_difficult_model/';
        output_file_dir='../Output Data/mushroom/expertise_difficult_model/';
        total_repeat_num=20;begin_num=10;end_num=30;step_num = 10;count=zeros(2*end_num*step_num,(end_num-begin_num+1)*total_repeat_num);
        title_name='mushroom(Whitehill''s Data)';
    case 10
        input_file_dir ='../Input Data/Real Data with spammers/';
        output_file_dir='../Output Data/Real Data with spammers/';
        total_repeat_num=20;begin_num=1;end_num=10;step_num = 5;count=zeros(2*938,(end_num-begin_num+1)*total_repeat_num);
        title_name='Robustness to low-quality annotators';
    case 11
        input_file_dir='../Input Data/Real Data/Real Label/';
        output_file_dir='../Output Data/Real Data Time/';
        total_repeat_num=2;begin_num=2;end_num=10;step_num = 5;count=zeros(2*938,(end_num-begin_num+1)*total_repeat_num); 
        title_name='Scalability for annotator number';
    case 12%%% for test
        input_file_dir='../Input Data/Covtype/latent model/';
        output_file_dir='../Output Data/Covtype/latent model/';
        total_repeat_num=20;begin_num=10;end_num=1000;step_num = 100;count=zeros(2*end_num*step_num,(end_num-begin_num+1)*total_repeat_num); 
        title_name='Covtype';      
    case 21 %%total_repeat_num=10 needs about 12h
        input_file_dir='../Input Data/Real Data/Clustering/';
        output_file_dir='../Output Data/Real Data/Clustering/';
        total_repeat_num=10;begin_num=1;end_num=1;step_num = 1;count=zeros(2*1000,total_repeat_num);
        title_name='Twitter Topic(Yan Yan''s Data)';
    case 22
        input_file_dir='../Input Data/Real Data/latent model/';
        output_file_dir='../Output Data/Real Data/latent model/';
        total_repeat_num=10;begin_num=1;end_num=1;step_num = 1;count=zeros(2*1000,total_repeat_num);
        title_name='Twitter Topic(Raykar''s Data)';
    case 23
        input_file_dir='../Input Data/Real Data/expertise_difficult_model/';
        output_file_dir='../Output Data/Real Data/expertise_difficult_model/';
        total_repeat_num=10;begin_num=1;end_num=1;step_num = 1;count=zeros(2*1000,total_repeat_num);
        title_name='Twitter Topic(Whitehill''s Data)';
    case 24
        input_file_dir='../Input Data/Real Data/Real Label/';
        output_file_dir='../Output Data/Real Data/Real Label/';
        total_repeat_num=1;begin_num=1;end_num=1;step_num = 1;count=zeros(2*1000,total_repeat_num);
        title_name='Twitter Topic(Real Data)';
        
    case 25%%total_repeat_num=1 needs about 10h
        input_file_dir='../Input Data/Real_Data_AAAI/Clustering/';
        output_file_dir='../Output Data/Real_Data_AAAI/Clustering/';
        total_repeat_num=1;begin_num=1;end_num=1;step_num = 1;count=zeros(2*6000,total_repeat_num);
        title_name='NER(Yan Yan''s Data)';              
    case 26
        input_file_dir='../Input Data/Real_Data_AAAI/latent model/';
        output_file_dir='../Output Data/Real_Data_AAAI/latent model/';
        total_repeat_num=1;begin_num=1;end_num=1;step_num = 1;count=zeros(2*1472,total_repeat_num);
        title_name='NER(Raykar''s Data)';
    case 27
        input_file_dir='../Input Data/Real_Data_AAAI/expertise_difficult_model/';
        output_file_dir='../Output Data/Real_Data_AAAI/expertise_difficult_model/';
        total_repeat_num=1;begin_num=1;end_num=1;step_num = 1;count=zeros(2*6000,total_repeat_num);
        title_name='NER(Whitehill''s Data)';
    case 28
        input_file_dir='../Input Data/Real_Data_AAAI/Real Label/';
        output_file_dir='../Output Data/Real_Data_AAAI/Real Label/';
        total_repeat_num=10;begin_num=1;end_num=4;step_num = 200;count=zeros(2*end_num*step_num,total_repeat_num);
        title_name='NER(Real Data)';
end