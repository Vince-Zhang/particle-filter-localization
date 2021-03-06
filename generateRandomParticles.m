function [ particle_mat ] = generateRandomParticles( numParticles, global_map, map_resolution, free_threshold )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% Find all free space on the map
[freeCellsX, freeCellsY] = find(global_map > free_threshold);
% freeCellIndices = randperm(length(freeCellsX));
freeCellIndices = randi(length(freeCellsX), numParticles, 1);

% Randomly place particles in the free space
particle_mat = [    map_resolution*freeCellsX(freeCellIndices(1:numParticles))';
    map_resolution*freeCellsY(freeCellIndices(1:numParticles))';
    2*pi*rand(1, numParticles)];

particle_mat = particle_mat + [0.1*randn(numParticles,1) 0.1*randn(numParticles,1) 5*(pi/180)*randn(numParticles,1)]';


% particle_mat = [40.1 + 5*randn(numParticles,1) 41.3 + 5*randn(numParticles,1) -pi/2 + 30*(pi/180)*randn(numParticles,1)]';

end

