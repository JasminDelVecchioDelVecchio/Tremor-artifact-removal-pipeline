% clear;
close all;
clc;

Fs = 250; % sample frequency [Hz]

lags = linspace(-Fs,Fs,51); %2sec window

% Regressing IMU or EMG contribution out of LFP

sigsToReg = imu_time_series; % signal to regress
lfp = lfp_time_series; % signal to be cleaned

sig_imu_embed = embedIMU(sigsToReg, lags)';
sig_lfp_embed = embedLFP(lfp_time_series', lags)';

lfp_time_series_reg = padIMU((sig_lfp_embed - (sig_lfp_embed/sig_imu_embed)*sig_imu_embed)', lags, 0)';