function plotting_cp(M,w)

% plots the data points with the Classifier Hyper plane base on the w
% M = [attribute1 attribute2 . . . attributeN targetFunction];
% w = [ w0 w1 w2 ... wd ]  d = VC dimension



% NOT A GENERIC ONE, WORK IS IN PROGRESS, WORKS COMPLETELY FINE FOR A=2

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

if (A > 3)
	
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
		
		s0 = strvcat(["Classifier and Datapoints - Dimension - ",int2str(d1),", ",int2str(d2)," & ",int2str(d3)]);
		
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
	
		xc = linspace(min(X(1:len,d1)), max(X(1:len,d1)),1000);
		yc = linspace(min(X(1:len,d2)), max(X(1:len,d2)),1000);
		
		[XC, YC] = meshgrid(xc,yc);
		
		ZC = (w(1)/w(d3+1))*1 - (w(d1+1)/w(d3+1)).*XC - (w(d2+1)/w(d3+1)).*YC;
	
		plot3(xp,yp,zp,'bo',xn,yn,zn,'ro')
		hold on
		mesh(XC,YC,ZC);
		grid on
		xlabel(s1);
		ylabel(s2);
		zlabel(s3);
		legend('Positive','Negative')
		title(s0);
		print(strvcat([ s0,".png"]),'-dpng');

	end

elseif(A == 3)
	
	d1 = 1;
	d2 = 2;
	d3 = 3;
	
	s0 = strvcat(["Classifier and Datapoints - Dimension - ",int2str(d1),", ",int2str(d2)," & ",int2str(d3)]);
	
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
	
	xc = linspace(min(X(1:len,d1)), max(X(1:len,d1)),1000);
	yc = linspace(min(X(1:len,d2)), max(X(1:len,d2)),1000);
		
	[XC, YC] = meshgrid(xc,yc);
		
	ZC = (w(1)/w(4))*1 - (w(2)/w(4)).*XC - (w(3)/w(4)).*YC;
	
	figure2
	plot3(xp,yp,zp,'bo',xn,yn,zn,'ro')
	hold on
	mesh(XC,YC,ZC);
	grid on
	xlabel(s1);
	ylabel(s2);
	zlabel(s3);
	legend('Positive','Negative')
	title(s0);
	print(strvcat([ s0,".png"]),'-dpng');

elseif(A == 2)
	
	d1 = 1;
	d2 = 2;
	
	s0 = strvcat(["Classifier and Datapoints - Dimension - ",int2str(d1)," & ",int2str(d2)]);
	
	s1 = strvcat(["Dimension",int2str(d1)]);
	s2 = strvcat(["Dimension",int2str(d2)]);
	
	for k=1:length(Positive)
				
		xp(k) = X((Positive(k)),d1);
		yp(k) = X((Positive(k)),d2);
	end
	
	for k=1:length(Negative)
		
		xn(k) = X((Negative(k)),d1);
		yn(k) = X((Negative(k)),d2);

	end
	
	XC = linspace( min(X(1:len,d1)), max(X(1:len,d1)),1000);
	
	YC = (-w(1)/w(3))*1 - (w(2)/w(3)).*XC;	
	
	
	plot(xp,yp,'bo',xn,yn,'ro',XC,YC,'k')
	hold on
	grid on
	xlabel(s1);
	ylabel(s2);
	legend('Positive','Negative','Classifier')
	title(s0);
	print(strvcat([ s0,".png"]),'-dpng');



else
	
	d1 = 1;

	
	s0 = strvcat(["Classifier and Datapoints - Dimension - ",int2str(d1)]);
	
	s1 = strvcat(["Dimension",int2str(d1)]);

	
	for k=1:length(Positive)
				
		xp(k) = X((Positive(k)),d1);

	end
	
	for k=1:length(Negative)
		
		xn(k) = X((Negative(k)),d1);

	end
	
	plot(xp,'bo',xn,'ro')
	hold on
	grid on
	xlabel(s1);
	legend('Positive','Negative')
	title(s0);
	print(strvcat([ s0,".png"]),'-dpng');

end

% CS308: Introduction to Artificial Intelligence - Lab#03
% Author: Rahul Nalawade
% Roll No: 201351017
