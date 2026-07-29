%% Respiratory Rate Control Analysis

% Closed-loop respiratory control using PI controller

sys = tf(1,[5 1]);

C = pid(2,0.5,0);

T = feedback(C*sys,1);

% Performance metrics
stepinfo(T)

% Step response
figure
step(T,30)
grid on
box on

xlabel('Time (s)','FontSize',12)
ylabel('Normalized CO_2 Response','FontSize',12)

title('Closed-Loop Respiratory Control Using PI Controller','FontSize',14)

xlim([0 30])
ylim([0 1.1])



% Plant
sys = tf(1,[5 1]);

% P Controller
Cp = pid(2,0,0);
Tp = feedback(Cp*sys,1);

% PI Controller
Cpi = pid(2,0.5,0);
Tpi = feedback(Cpi*sys,1);

% PID Controller
Cpid = pid(2,0.5,1);
Tpid = feedback(Cpid*sys,1);

figure

step(Tp,30)
hold on
step(Tpi,30)
step(Tpid,30)

grid on
legend('P','PI','PID','Location','best')
title('Comparison of P, PI and PID Controllers')
xlabel('Time (s)')
ylabel('Normalized CO_2 Response')




%% Step Response of the Plant

figure

step(sys,30)

grid on
box on

title('Step Response of Respiratory Plant','FontSize',14)
xlabel('Time (s)','FontSize',12)
ylabel('Amplitude','FontSize',12)