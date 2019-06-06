%First let's load an image
image=imread('BCD1Em14CF_whole.tif');
imshow(image, [0,10])
%The two numbers inside the square brackets set the min and max pixel 
%values. So anything below the min is ste to the min and anything above the
%max is set to the max pixel intensity

%How will we measure the length of the embryo? Use this tool! Once the new
%window pops up, click once on the anterior tip of the embryo (with the 
%highest Bicoid concentration) and then once on the posterior tip. Then 
%click enter. The two points will be stored as coordinates in a matrix 
%called AP.
AP=ginput; %AP = Anterior Posterior

%Let's define two vectors for our clicks. The first will be our x-values.
APx=[AP(1,1), AP(2,1)];
%The second vector will be for our y-values.
APy=[AP(1,2),AP(2,2)];

%Let's input where the cephalic furrow is using ginput
CF=ginput(2);
%again creating vectors for our coordinatess
CFx=[CF(1,1), CF(2,1)]; 
CFy=[CF(1,2), CF(2,2)];

imshow(image, [0,10]);
hold on
plot(APx, APy, 'o-r', 'LineWidth', 4)
plot(CFx, CFy, 'o-r', 'LineWidth', 4)
hold off

%Step 1: Find the equations for both lines above. y-y1=m(x-x1)
mAP=(APy(2)-APy(1))/(APx(2)-APx(1));
bAP=APy(1)-(mAP*APx(1));
mCF=(CFy(2)-CFy(1))/(CFx(2)-CFx(1));
bCF=CFy(1)-(mCF*CFx(1));


%Step 2: Find where the lines intercept
xI=(bCF-bAP)/(mAP-mCF);
yI=(mAP*xI)+bAP;


%Step 3: Find the lengths of both lines. The "length" of the cephalic
%furrow is defined as the distance from the anterior tip to the
%intersection point between the two lines.
LAP=sqrt(((APx(2)-APx(1))^2)+((APy(2)-APy(1))^2));
LCF=sqrt(((xI-APx(1))^2)+((yI-APy(1))^2));


%Step 4: Find xCF
xCF=LCF/LAP;

