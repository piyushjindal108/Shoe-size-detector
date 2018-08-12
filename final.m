A=imread('ima2.jpg');
[T,SM]=graythresh(A);
T*255
Q=im2bw(A,T);
figure,imshow(A)
[X Y]=size(Q)
figure,imshow(Q)

[center,radii]=imfindcircles(Q,[10 30],'objectpolarity','dark');
[radii1,rad_in] = max(radii(:));

inten=Q(floor(center(rad_in,:)));
if (inten(1)==0)

Q=imcomplement(Q);

end
if (inten(1)==1)


end
figure,imshow(Q)
[center,radii]=imfindcircles(Q,[10 30],'objectpolarity','dark');
[radii1,rad_in] = max(radii(:));
viscircles(center,radii)
figure,imshow(Q)
 i = 0; j = 0;
 y1=0;
 y2=0;
 y3=0;
 yu=0;
 k=0;
 k2=0;
 cy=0;
for i=1:X
    y1=0;
    for j=1:Y
        
        if(Q(i,j)==0)
            y1=y1+1;
            if(y1>40 && k~=1)
            y3=i
            yu=j
            k=1;
            end
            
        end
        
         if(Q(i,j)==1 && j==yu && k2~= 1)
            y2=y2+1;
            if(y2>75 && k2~=1)
                y2=i-75;
                k2=1;
            end
            
             
         
        end
        
        
    end
end
y2

abc=0;
abc=y2-y3
 if(inten(1) == 0)  
pix_size = 2.35/(2*max(radii))
 end
 if (inten(1) == 1)
  pix_size = 2.0/(2*max(radii))   
 end
object_size = pix_size*abc
line([yu yu],[y3 y2],'LineWidth',5);
o_inch = object_size/2.54
size_chart = [7.84 1; 
              8.17 2;
              8.50 3;
              8.84 4;
              9.17 5;
              9.50 6;
              9.83 7;
              10.17 8;
              10.50 9;
              10.83 10;
              11.17 11;
              11.50 12;
              11.83 13;
              12.17 14;
              12.5 15];
q1=0;
q2=0;

for q1=1:15        
  for q2= 1:2
      if (o_inch>=size_chart(q1,1) && o_inch<size_chart(q1+1,1))
          
          shoe_size= size_chart(q1,2);
      end
  end
end
fprintf('Your Shoe size is');
shoe_size
 title('Segmented Image')
  text(yu,y3,'Foot Start','BackgroundColor',[.1 .9 .2],'HorizontalAlignment','right');       
   text(yu,y2,'Foot End','BackgroundColor',[.9 .2 .1],'HorizontalAlignment','right');      
   text(1,j,['Your shoe size is ',num2str(shoe_size)],'BackgroundColor',[.1 .9 .1]);