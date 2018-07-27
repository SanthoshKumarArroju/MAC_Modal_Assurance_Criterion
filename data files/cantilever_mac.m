% =============================================== %
% Modal Assurance Criterion using cantilever beam %
% =============================================== %
% by: Santhosh Kumar Arroju Graduate Student at Wright State University
% used vibration tool box mdofcf for curve fitting and extract mode shapes

clc; close all; clear all;
%% load case files collected at 11 location points and extract mode shapes from vtoolbox
figure()
load case_1.mat
H1 = Hf_chan_2;
plot(Freq_domain,20*log10(abs(Hf_chan_2)))

load case_2.mat
H2 = Hf_chan_2; hold on
plot(Freq_domain,20*log10(abs(Hf_chan_2)))

load case_3.mat
H3 = Hf_chan_2; hold on
plot(Freq_domain,20*log10(abs(Hf_chan_2)))

load case_4.mat
H4 = Hf_chan_2; hold on
plot(Freq_domain,20*log10(abs(Hf_chan_2)))

load case_5.mat
H5 = Hf_chan_2; hold on
plot(Freq_domain,20*log10(abs(Hf_chan_2)))

load case_6.mat
H6 = Hf_chan_2; hold on
plot(Freq_domain,20*log10(abs(Hf_chan_2)))

load case_7.mat
H7 = Hf_chan_2; hold on
plot(Freq_domain,20*log10(abs(Hf_chan_2)))

load case_8.mat
H8 = Hf_chan_2; hold on
plot(Freq_domain,20*log10(abs(Hf_chan_2)))

load case_9.mat
H9 = Hf_chan_2; hold on
plot(Freq_domain,20*log10(abs(Hf_chan_2)))

load case_10.mat
H10 = Hf_chan_2; hold on
plot(Freq_domain,20*log10(abs(Hf_chan_2)))

load case_11.mat
H11 = Hf_chan_2; hold on
plot(Freq_domain,20*log10(abs(Hf_chan_2)))
xlabel('Freq domain, Hz');ylabel('FRF, dB')
title('FRF')

% close all

%% Power Spectral Density for Input Hammer
load case_2.mat
figure
plot(Freq_domain,20*log10(abs(PSD_chan_1)))
xlabel('Freq domain, Hz');ylabel('PSD, dB')
title('Power Spectral Density for Hammer Input')

TF = [H1,H2,H3,H4,H5,H6,H7,H8,H9,H10,H11];
f = Freq_domain;

[z1,nf1,u1]=mdofcf(f,TF,34.06-5,34.06+5);
[z2,nf2,u2]=mdofcf(f,TF,211.9-5,211.9+5);
[z3,nf3,u3]=mdofcf(f,TF,595-1,595+1);
[z4,nf4,u4]=mdofcf(f,TF,1158-0.2,1158+0.2);
[z5,nf5,u5]=mdofcf(f,TF,1901-0.2,1901+0.2);

%% Mode shapes

figure
plot(1:11,u1,'LineWidth',5)
hold on
plot(1:11,u2,'LineWidth',5)
hold on
plot(1:11,u3,'LineWidth',5)
hold on
plot(1:11,u4,'LineWidth',5)
hold on
plot(1:11,u5,'LineWidth',5)
legend('mode shape 1','mode shape 2','mode shape 3','mode shape 4','mode shape 5')
title('Mode Shapes of Cantilever Beam')

%% Modal Assurance Criterion for Test-Test data

U = [u1 u2 u3 u4 u5]

for i=1:5; 
    for j=1:i;
   
MAC(i,j) = (abs(U(:,i)'*U(:,j)))^2 / ((U(:,i)'*U(:,i))*(U(:,j)'*U(:,j)));

    end
end
MAC
figure
bar3(MAC)
title('Test-Test data, Modal Assurance Criterion', 'fontweight','bold', 'fontsize',16)
set(gca,'XTickLabel',[34.06 211.9 595 1158 1902])
set(gca,'YTickLabel',[34.06 211.9 595 1158 1902])
