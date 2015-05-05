%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Deteccion de Puntos de interes-Prueba en video
%Procesamiento DIgital de Imagenes- UdeA
%Autor: Alexander Gomez Villa
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all, close all, clc

xyloObj = VideoReader('images/video.avi');

nFrames = xyloObj.NumberOfFrames;
vidHeight = xyloObj.Height;
vidWidth = xyloObj.Width;

mov(1:nFrames) = ...
    struct('cdata',zeros(vidHeight,vidWidth, 3,'uint8'),...
           'colormap',[]);

k = 1;
for i=1:nFrames
    I =read(xyloObj,i);
    
    if(i>1)
   
    %% Lee imagenes
   I1 = read(xyloObj,i);
   I2 = read(xyloObj,i-1);  
        
   I1 =rgb2gray(I1);
   I2 =rgb2gray(I2);
   
   %% Detecta corners
   points1 = corner(I1);
   points2 = corner(I2);
   
   [features1, valid_points1] = extractFeatures(I1, points1);
   [features2, valid_points2] = extractFeatures(I2, points2);
   
   
   indexPairs = matchFeatures(features1, features2);
      
   matchedPoints1 = valid_points1(indexPairs(:, 1), :);
   matchedPoints2 = valid_points2(indexPairs(:, 2), :);  
  
      imshow(I);
    hold on
plot(matchedPoints2(:,1),matchedPoints2(:,2), 'r*');
    waitforbuttonpress
        
        
    end    
  
    
             
          
    
    
    
    
end