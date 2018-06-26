%% ============================================= %%
% Modal Assurance Criterion using cantilever beam %
% =============================================== %
% by: Santhosh Kumar Arroju Graduate Student at Wright State University
% used vibration tool box mdofcf for curve fitting and extract mode shapes

clc; close all; clear all;
%% load case files collected at 11 location points and extract mode shapes from vtoolbox

load location_1.mat
H1 = Hf_chan_2;
plot(Freq_domain,20*log10(abs(Hf_chan_2)))

load location_2.mat
H2 = Hf_chan_2;
plot(Freq_domain,20*log10(abs(Hf_chan_2)))

load location_3.mat
H3 = Hf_chan_2;
plot(Freq_domain,20*log10(abs(Hf_chan_2)))

load location_4.mat
H4 = Hf_chan_2;
plot(Freq_domain,20*log10(abs(Hf_chan_2)))

load location_5.mat
H5 = Hf_chan_2;
plot(Freq_domain,20*log10(abs(Hf_chan_2)))

load location_6.mat
H6 = Hf_chan_2;
plot(Freq_domain,20*log10(abs(Hf_chan_2)))

load location_7.mat
H7 = Hf_chan_2;
plot(Freq_domain,20*log10(abs(Hf_chan_2)))

load location_8.mat
H8 = Hf_chan_2;
plot(Freq_domain,20*log10(abs(Hf_chan_2)))

load location_9.mat
H9 = Hf_chan_2;
plot(Freq_domain,20*log10(abs(Hf_chan_2)))

load location_10.mat
H10 = Hf_chan_2;
plot(Freq_domain,20*log10(abs(Hf_chan_2)))

load location_11.mat
H11 = Hf_chan_2;
plot(Freq_domain,20*log10(abs(Hf_chan_2)))
close all

TF = [H1,H2,H3,H4,H5,H6,H7,H8,H9,H10,H11];
f = Freq_domain;

[z1,nf1,u1]=mdofcf(f,TF,33.75-5,33.75+5)
[z2,nf2,u2]=mdofcf(f,TF,211.3-5,211.3+5)
[z3,nf3,u3]=mdofcf(f,TF,587.5-5,587.5+5)
[z4,nf4,u4]=mdofcf(f,TF,1156-5,1156+5)
[z5,nf5,u5]=mdofcf(f,TF,1897-3.3,1897+3.3)

figure
plot(1:11,u1)
hold on
plot(1:11,u2)
hold on
plot(1:11,u3)
hold on
plot(1:11,u4)
hold on
plot(1:11,u5)
legend('mode1','mode2','mode3','mode4','mode5')
title('Cantilever Beam five Mode shapes')

%% Modal Assurance Criterion for Test-Test data

U = [u1 u2 u3 u4 u5]

for i=1:5; 
    for j=1:i;
   
MAC(i,j) = (abs(U(:,i)'*U(:,j)))^2 / ((U(:,i)'*U(:,i))*(U(:,j)'*U(:,j)))

    end
end
MAC
figure
bar3(MAC)
title('Modal Assurance Criterion','fontweight','bold','fontsize',14)

