function imu_embed = embedIMU(imu, lags)

l = size(imu, 1); %time length

llag = length(lags); %

mi = min(lags);
ma = max(lags);

inds = (-mi+1:l-ma)';
linds = length(inds);

imu_embed = [];
for ilag = 1:llag
  imu_embed = cat(2, imu_embed, imu(inds + lags(ilag), :));
end

imu_embed = [imu_embed ones(linds, 1)];
