function Locations=CorrectSequenceLocation(Seq_as_cell,pattern)

%% This function receives the full content of typped keys as cell,
%  and returns a vector of starting locations, such that for every i in
%  that vector, there's a correct sequence in i:i+4

%% 
tappedSeq=char(Seq_as_cell);
i=1;
Correct=zeros(length(tappedSeq),1);

while i<=(length(tappedSeq)-4)   
   if (strcmp(tappedSeq(i:i+4),pattern))
       Correct(i,1)=1;
       i=i+5;
   else
       i=i+1;
   end
end
 Locations=zeros(sum(Correct),1);
 x=1;
 for j=1:length(Correct)
     if Correct(j)
        Locations(x,1)=j;
        x=x+1;
     end
 end
 
 % type the number of correct sequences just so we now this works fine
 % sum(Correct)
 
end