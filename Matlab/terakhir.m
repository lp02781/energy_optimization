clc

%this is the last result of the optimization

%load fval.mat
%for the finding the max value.
energi=fval(:,1);
troom=x(:,1);
rh=x(:,2);

    energimax=2798.85;
    energimin=2672.22;
    troommax=25.5374;
    troommin=23.7216;
    rhmax=63.6684 ;
    rhmin=57.0084 ;
    energidelta=energimax-energimin;
    troomdelta=troommax-troommin;
    rhdelta=rhmax-rhmin;
finalenergi =((((energi(1,:)+1)*(energidelta))/2)+energimin)
finaltroom =((((troom(1,:)+1)*(troomdelta))/2)+troommin)
finalrh =((((rh(1,:)+1)*(rhdelta))/2)+rhmin)

%scatter(final,'r.')
%title('HASIL LANGSUNG DARI GAOTIMSET')