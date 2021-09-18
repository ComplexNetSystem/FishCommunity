function scatterColorTemp(x,y)

N = length(x);

for i = 1:N
    if (x(i)<=10)
        scatter(x(i),y(i),80,'b','o','filled'); hold on
    elseif (x(i)>10 & x(i)<=15)
        scatter(x(i),y(i),80,[191/255 191/255 0],'o','filled'); hold on
    elseif (x(i)>15 & x(i)<=20)
        scatter(x(i),y(i),80,[0 185/255 0],'o','filled'); hold on
    elseif (x(i)>20 & x(i)<=25)
        scatter(x(i),y(i),80,[1,215/255,0],'o','filled'); hold on
    else
        scatter(x(i),y(i),80,'r','o','filled'); hold on
    end
 
end
legend('Spring','Summer','Autumn','Winter');  
hold off

