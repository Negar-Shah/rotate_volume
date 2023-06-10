# Heart Rotation in 3D SPECT Image

The "rotate_volume" is a function designed to assist in the processing of MPI (Myocardial Perfusion Imaging) SPECT data. In the context of MPI SPECT, one crucial step is to rotate image slices to convert them from a transverse view to short-axis views. This rotation allows for a more accurate analysis of the left ventricle (LV) of the heart.

To achieve this rotation, the function utilizes a 3D LV rotation approach. It takes as input the vector representing the current long axis of the LV and the desired long axis (typically the Z-axis). By applying various rotation methods, such as 'linear', 'nearest', 'cubic', 'spline', or 'makima', the function performs the necessary rotation to align the LV long axis with the desired long axis.

One important aspect to note is that the size of the rotated volume remains the same as the input volume. This means that peripheral voxels may be discarded after rotation. The function ensures that the resulting rotated volume maintains the integrity of the LV structure while conforming to the desired alignment.

The "Heart Rotation in 3D SPECT Images" function offers a valuable tool for researchers and medical professionals working with MPI SPECT data. By accurately aligning the LV long axis, it facilitates the subsequent analysis and interpretation of the myocardial perfusion images.

Note: MPI stands for Myocardial Perfusion Imaging, SPECT stands for Single-Photon Emission Computed Tomography, and LV stands for Left Ventricle.
The image below, shows the example of this code. The rotation axis obtained from fitting an ellipsoid to the LV.
![image](https://github.com/Negar-Shah/rotate_volume/assets/59450540/1f6a77b0-2512-4ca1-affb-2572ca804e2e)

