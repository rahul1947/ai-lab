function plotting_datapoints(M)

% plots the data points taking 3 dimensions at a time
% M = [attribute1 attribute2 . . . attributeN targetFunction];
% produces all the 3 at a time 3D plots
% as Dimension - 1, 2 & 3.png (say, for first three dimensions)


[len, A] = size(M);

A--;

X = [M(1:len,1:A)];

T = [M(1:len,A+1)];

p=0;
n=0;

for i=1:len
	
	if(T(i) == 1)
		Positive(++p) = i;
	else
		Negative(++n) = i;
	end
end

for j=1:A
	
	switch j
	
	case A-1,
		d1 = j;
		d2 = j+1;
		d3 = 1;
	
	case A,
		d1 = j;
		d2 = 1;
		d3 = 2;
	
	otherwise,
		d1 = j;
		d2 = j+1;
		d3 = j+2;
	end
	
	s0 = strvcat(["Dimension - ",int2str(d1),", ",int2str(d2)," & ",int2str(d3)]);
	
	s1 = strvcat(["Dimension",int2str(d1)]);
	s2 = strvcat(["Dimension",int2str(d2)]);
	s3 = strvcat(["Dimension",int2str(d3)]);
	
	for k=1:length(Positive)
		
		xp(k) = X((Positive(k)),d1);
		yp(k) = X((Positive(k)),d2);
		zp(k) = X((Positive(k)),d3);
	end
	
	for k=1:length(Negative)
		
		xn(k) = X((Negative(k)),d1);
		yn(k) = X((Negative(k)),d2);
		zn(k) = X((Negative(k)),d3);
	end
	
	plot3(xp,yp,zp,'bo',xn,yn,zn,'ro')
	hold on
	grid on
	xlabel(s1);
	ylabel(s2);
	zlabel(s3);
	legend('Positive','Negative')
	title(s0);
	print(strvcat([ s0,".png"]),'-dpng');

end

% CS308: Introduction to Artificial Intelligence - Lab#02
% Author: Rahul Nalawade
% Roll No: 201351017
