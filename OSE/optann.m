function y= optann(x)
   dec_var=[x(1);x(2)];
   
   %dec_var=[x(1),x(1);x(2),x(2);x(3),x(3);x(4),x(4);x(5),x(5);x(6),x(6);x(7),x(7)];
  
  
      
   y = neural_function(dec_var);
   % input max and min each variable to unnormalize
    %energimax=2028.40371198569;
    %energimin=420.002889087656;
    %COPmax=0.721332;
    %COPmin=0.3788142;
    %energidelta=energimax-energimin;
    %COPdelta=COPmax-COPmin;
    
 
    %y=1./abs(SCP_COP);
    
    %y(1,:)=1./abs((SCP_COP(1,:)+1)*((SCPmax-SCPmin)/2)+SCPmin);
    %y(2,:)=1./abs((SCP_COP(2,:)+1)*((COPmax-COPmin)/2)+COPmin);
    
    %y(1,:)=((((SCP_COP(1,:)+1)*(SCPdelta))/2)+SCPmin);
    %y(2,:)=((((SCP_COP(2,:)+1)*(COPdelta))/2)+COPmin);
    
    % unormalize the matrix
    %y(1,:)=1/((((energi(1,:)+1)*(energidelta))/2)+energimin);
    %y(2,:)=1/((((SCP_COP(2,:)+1)*(COPdelta))/2)+COPmin);