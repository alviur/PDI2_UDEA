%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Deteccion de Puntos de interes
%Procesamiento DIgital de Imagenes- UdeA
%Autor: Alexander Gomez Villa
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all, close all, clc

%% Carga de imagenes
I = imread('images/rect.png');%Carga imagen cuadrado
%I = imread('images/circle.png');Carga imagen circulo
%I = imread('images/star.png');Carga imagen Estrella
I=rgb2gray(I);%Cambia a escala de grises

%% Preprocesamiento
J = imnoise(I,'salt & pepper',0.02);%Añade ruido tipo sal y pimienta
%J = imresize(I, [size(I,1)/2 size(I,2)/2]);%Cambio de tamaño la imagen
%J = imrotate(I,45,'crop');%Rotacion de la imagen
H = fspecial('disk',10);
%J = imfilter(I,H,'replicate');%Distorsion 
%% Extraccion de Corners
C = corner(J,'SensitivityFactor',0.04);%Extraccion de Harris corners en imagen preprocesada
O = corner(I,'SensitivityFactor',0.04);%Extraccion de  Harris corners en imagen original

% C = corner(J,'MinimumEigenvalue');%Extraccion de Shi-Tomasi corners en imagen preprocesada
% O = corner(I,'MinimumEigenvalue');%Extraccion de Shi-Tomasi corners en imagen original

%% Resultados

subplot(1,2,1)
imshow(I);
hold on
plot(O(:,1), O(:,2), 'r*');
title('Original')
subplot(1,2,2)
imshow(J);
hold on
plot(C(:,1), C(:,2), 'r*');
title('Preprocesada')