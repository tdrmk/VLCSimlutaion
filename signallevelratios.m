function [Psd,Psr,Prd] = signallevelratios(k1,k2) % k1 : numer of leds at source k2: number of leds at destination
    % Under the assumption that each LED in a matrix in source and relay
    % given same amount of power (ie emit same luminous intensity ).. And
    % all of them have same half power angle ... Number of LEDs in matrix
    % at source and relay determine the power distribution ...
    %% This function also ignores reflections ... Add them Later ....
    % this function returns the ratio of signal powers received by
    % destination from source and relay and power received by relay from
    % destination with TOTAL SIGNAL POWER RECEIVED AT DESTINATION
    % NORMALIZED TO 1 
    % Change parameters to yield result for different configurations
    %% LED Parameters
    theta2 = 55 ; % Set the half power angle of LED
    m = -1/log2(cosd(theta2)) ; % Lambertian index
    %% Number of LEDs default values
    if ~exist('k1','var')
        k1 = 100;
    end 
    if ~exist('k2','var') 
        k2 = 1; 
    end 
    %% Set the distances between source, destination and relay
    xsd = 1.5 ;% x distance between source and destination
    ysd = 2 ;  % y distance between source and destination 
    xrd = 0.2 ;  % x distance between relay and destination
    yrd = 0.5 ;  % y distance between relay and destination
    xsr = xsd + xrd ;% x distance between source and relay
    ysr = ysd - yrd ;% y distance between source and relay
    % Calculate the distance between different ponts
    dsr = sqrt( xsr^2 + ysr^2 ) ; % distance between source and relay  
    dsd = sqrt( xsd^2 + ysd^2 ) ; % distance between source and destination
    drd = sqrt( xrd^2 + yrd^2 ) ; % distance between relay and destination

    %% Calculating various angles ...
    % Assuming the light falls within the field of view of photo diode at
    % destination and neglecting multipaths or reflections ( they change the
    % power of received signal . later include them but they dont cause ISI in
    % case of low data rates ... )
    
    thetasd  = atand( ysd / xsd ) ; % angle at which light is emitter at source to reach the destination 
    thetasr =  atand( ysr / xsr ) ;% angle at which light is emitter at source to reach the relay
    thetard = atand( yrd / xrd  ) ; % angle at which light is emitter at relay to reach the destination

    thetads =  thetasd ; % angle at which light falls on photodiode from source
    thetadr = thetard ; % angle at which light falls on photodiode from relay
    thetars = 0 ; % angle at which light falls on relay pd from source
    
    %% Obtain the estimates of ratios of power falling on destination from source,
    % destination from relay and relay from source ..
    psd = k1 *( cosd ( thetasd )^ m ) * cosd ( thetads ) / dsd^2 ;
    psr = k1 *( cosd ( thetasr )^ m ) * cosd ( thetars ) / dsr^2 ;
    prd = k2 *( cosd ( thetard )^ m ) * cosd ( thetadr ) / drd^2 ;
    
    %% Normalize power values
    Psd = psd/(psd+prd) ; % Set this to 1
    Psr = psr/(psd+prd) ; % Normalized wrt power received at destination
    Prd = prd/(psd+prd) ; % Normalized wrt power received at destination
    
    % Note: Since we are working with low bandwidth (time periods of ~10us ) .. reflections and
    % differences in distances between source and relay are not considered 
    % to produce delays (~20ns) 
end