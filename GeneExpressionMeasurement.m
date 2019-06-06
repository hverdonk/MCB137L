%Gene Expression Measurement

%Our strategy will be:
%1) Segment the cells in the phase contrast image
%2) Use this information to measure the fluorescence corresponding to each
%   individual cell
%3) Plot a histogram of single-cell fluorescence values

%Let's load the phase contrast image
ImPhase=imread('SampleBacterialImages/PhaseContrastImage.tif');
%Display the image
imshow(ImPhase)
%This image has a bit depth of 16 bits, but Matlab can only display 8 bits.
%We need to tell Matlab how to map those 65k levels of grey onto 256 levels
%of gray.
imshow(ImPhase,[])
%The [] tells Matlab to grab the dimmest pixel and assign it to zero. Then
%it grabs the brightest pixel and assigns it to 256.

%Before continuing, I want to normalize this image. This will allow me to
%use one threshold for segmentation on all the images regardless of the 
%intensity of the light source that was used to obtain the phase contrast 
%image.
ImNorm=mat2gray(ImPhase);
%mat2gray is doing the same thing imshow does with the option []
imshow(ImNorm)
%Note that we changed the values of the pixels in ImNorm with respect to
%ImPhase. This is still okay because we won't be needing the absolute
%values of the phase images for any of our analysis (only the pixel values
%for the fluorescence image)

%We want to find the cells in this image by thresholding. Find a threshold
%by inspecting pixel values in imtool ("Tools">"Pixel Region" then look at
%the pixel values corresponding to cells. Choose a threshold value just 
%below the values corresponding to cells)

%imtool(ImNorm)
%Commented out so I don't have to run it every time I run the code.

%We start with a threshold of 0.3
Threshold=0.3;
%Take the threshold
ImThresh=ImNorm<Threshold;
imshow(ImThresh)

%We find the cells, but we also find a lot of speckles. Can we filter them
%out using the area?
%First, we need to give each region of 1s a unique identity.
ImLabel=bwlabel(ImThresh);
imshow(ImLabel, [])
%Can we distinguish cells and speckles by area? We need to calculate the
%area of each region found by bwlabel.
%To get the area, we'll use regionprops
ImProps=regionprops(ImLabel, 'Area');
%regionprops grabs an image labeled by bwlabel and calculates whatever
%property you ask it to
ImProps
%ImProps is a structure array containing the area information. If I want
%the area of region number 20
ImProps(20).Area
%If I want a list of all areas, we have
Areas=[ImProps.Area];
%Let's examine the areas using a histogram
histogram(Areas)
xlabel('area (pixels)')
ylabel('number of regions')

%Note that most of our regions have one or two pixels. We want to get rid
%of them by filtering for areas that are larger than 40 pixels.
AreaThresh=40;

%We are going to extract the regions with an area larger than AreaThresh.
%To do this, we'll copy those selected regions onto a blank image.
NewImage=zeros(size(ImThresh)); %create image of zeros the size of ImThresh

%How do I isolate an individual region?
imshow(ImLabel==149)   %This is region #149
%Note that the operator gave us a 1 for any pixel with a value of 149 and 0
%otherwise.

%Loop through each region in ImLabel
for i=1:length(Areas)
    if Areas(i)>AreaThresh   %copy the region to NewImage
        %Isolate the single cell
        SingleCellImage=ImLabel==i;
        %Add it to the NewImage while preserving what I had before in
        %NewImage
        NewImage=NewImage+SingleCellImage;
        %Code below is for eye candy
        %figure(1)
        %imshow(NewImage)
        %pause(0.5)
    end
end

%Let's look at our new thresholded and filtered image
imshow(NewImage)
%I've isolated the cells, but now they lost their identity. So, I'm going
%to relabel them using bwlabel
ImLabel2=bwlabel(NewImage);
imshow(ImLabel2, [])

%Now I have a mask, a map of the pixels corresponding to each cell in my
%fluorescence image. First, I need to load the fluorescence image.
ImFluo=imread('SampleBacterialImages/FluorescenceImage.tif');
imshow(ImFluo,[])

%Let's isolate the fluorescent pixels for the 10th cell. To do this, we
%isolate the mask for the 10th cell from ImLabel2 and multiply this mask
%with ImFluo
SingleCellIm=immultiply(ImLabel2==10, ImFluo);
imshow(SingleCellIm,[])
%Measure the intensity value of the cell by summing over all pixel values
%in SingleCellIm, because these only correspond to cell 10
sum(sum(SingleCellIm))

%Finally, we want to calculate the mean fluorescence per pixel per cell for
%all the cells on this image. Dividing by area will make our results a
%little bit more insensitive to cell clumps.
%Let's get a list of the new areas
ImProps2=regionprops(ImLabel2, 'Area');
Areas2=[ImProps2.Area];

%For-loop to calculate the total fluorescence of each cell
for i=1:length(Areas2)
    %Generate the mask for the i-th cell
    ImMask=(ImLabel2==i);
    %Multiply the mask by the fluorescence image
    SingleCellImFluo=immultiply(ImMask,ImFluo);
    %Calculate and store the total fluorescence
    CellFluo(i)=sum(sum(SingleCellImFluo));
end

%Now divide the total cell fluorescence in CellFluo by the cell area
CellFluoPerArea=CellFluo./Areas2;
%Plot the histogram
histogram(CellFluoPerArea)
xlabel('fluorescence per pixel')
ylabel('number of cells')


%For the HW
%delta corresponds to R=0
%auto means that the cells are autofluorescent (they fluoresce naturally)
%In the file name, R## is the number of repressors in the cell
