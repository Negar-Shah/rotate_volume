function [rot_vol] = rotate_volume(vol, rot_center, axis_before, axis_after, method)
%% rotate volume: function to rotate 3D image or matrix to align an object

% Author & support : negar.shahamiri@gmail.com.

% Syntax: rot_vol = (vol, rot_center, axis_before, axis_after, method)

% Description: rotate the 3D volume "vol" around the "rot_center" in a way
% that the vector "axis_before" concides on the vector "axis_after"
% The usage of this kind of rotation is when an object on an 3D image needs
% to be aligned. 

% inputs: 
% vol: The 3D matrix that need to be rotated
% rot_center: [x, y, z]. Center of the rotation. Caution: in 3D matrix, x
% is the column number, and y is the row number.
% axis_befor: [x, y, z]. Corresponding vector to the object axis of "vol"
% axis_after: [x, y, z]. Corresponding vector to the object axis of
% "rot_vol"
% method: 'linear' (default) | 'nearest' | 'cubic' | 'spline' | 'makima'

% output:
% "rot_vol": The 3D marix of the rotated volume.

% For example if our goal is to rotate the image to align to Z-axis, the 
% "axis_before" must be the object axis, and "axis_after" is equl to
% [0, 0, 1]

r = vrrotvec(axis_before, axis_after);
m = vrrotvec2mat(r);
rot_mat = m; %rotation matrix
s = size(vol);
rot_center = floor(rot_center); 
sy = 1: s(1);
sx = 1: s(2);
sz = 1: s(3);
sy = sy - rot_center(2);
sx = sx - rot_center(1);
sz = sz - rot_center(3);
[xx, yy, zz] = meshgrid(sx, sy, sz);
temp = [xx(:), yy(:), zz(:)]*rot_mat;
rx = reshape(temp(:,1), size(xx));
ry = reshape(temp(:,2), size(yy));
rz = reshape(temp(:,3), size(zz));
rot_vol = interp3(xx, yy, zz, double(vol), rx, ry, rz, method); % rotate volume
rot_vol(isnan(rot_vol)) = 0;
end