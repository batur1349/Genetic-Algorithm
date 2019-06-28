function [z] = Custom(x)

total = 0;
if(x(1) < 10)
    total = total + 999999;
end
if(x(1) >= x(2))
    total = total + 999999;
end
if(x(2) < 15)
    total = total + 999999;
end
if(x(2) >= x(3))
    total = total + 999999;
end

z = x(1) + x(2) + x(3) + total;

end