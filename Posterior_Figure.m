%Sample plot for Figure (Small Diff)
S_SmallDiff = [15, 25, 35, 40, 50, 70, 100]';
F_SmallDiff = [14, 24, 34, 39, 49, 69, 99]';
np_2 = 50000
[F_s, x_s] = ksdensity(S_SmallDiff, 'npoints', np_2);
[F_f, x_f] = ksdensity(F_SmallDiff, 'npoints', np_2);

X_APPEND = [x_s, x_f];
X_MIN = min(X_APPEND);
X_MAX = max(X_APPEND);
X_LIST = linspace(X_MIN, X_MAX, np_2);

Y_s = interp1(x_s, F_s, X_LIST);
Y_f = interp1(x_f, F_f, X_LIST);
Posterior_Diff = abs(Y_s - Y_f);
Posterior_Diff(isnan(Posterior_Diff))=0;
Sus_Risk_Score = trapz(X_LIST,Posterior_Diff)

figure()
set(gcf, 'Position',  [100, 100, 1600, 650])
subplot(1,2,1)
plot(X_LIST,Y_s,'k-','LineWidth',2.5);
hold on
plot(X_LIST,Y_f,'k:','LineWidth',2.5);
        ProbDiff = area(X_LIST, abs(Y_s-Y_f));
        ProbDiff.FaceColor = [0.8 0.15 0.1];
        ProbDiff.EdgeColor = [0.8 0.15 0.1];
        ProbDiff.FaceAlpha = 0.38;
        ProbDiff.EdgeAlpha = 0.38;
        ProbDiff.LineWidth = 1;
ax = gca;
ax.FontSize = 15;
xlabel('Low risk input', 'interpreter', 'latex', 'FontSize', 15)
ylabel('Density', 'interpreter', 'latex', 'FontSize', 15)
annotation('textarrow',[0.25, 0.22], [0.25, 0.135], 'interpreter', 'latex', 'FontSize', 15, 'String', '$$RS_{j} = 0.03$$')
legend(['$P(x_{j}|L_{s})$'], ['$P(x_{j}|L_{f})$'], ['$|P(x_{j}|L_{s}) - P(x_{j}|L_{f})|$'], 'FontUnits', 'points', 'interpreter', 'latex', 'FontSize', 15, 'FontName', 'Times', 'Location', 'NorthEast', 'box', 'off')
hold off
saveas(gcf, ['Test_Small_Diff', '.png'])


%Sample plot for Figure (Large Diff)
S_LargeDiff = [15, 25, 35, 45]';
F_LargeDiff = [25, 45, 55, 60, 80]';
[F_s2, x_s2] = ksdensity(S_LargeDiff, 'npoints', np_2);
[F_f2, x_f2] = ksdensity(F_LargeDiff, 'npoints', np_2);

X_APPEND2 = [x_s2, x_f2];
X_MIN2 = min(X_APPEND2);
X_MAX2 = max(X_APPEND2);
X_LIST2 = linspace(X_MIN2, X_MAX2, np_2);

Y_s2 = interp1(x_s2, F_s2, X_LIST2);
Y_f2 = interp1(x_f2, F_f2, X_LIST2);
Posterior_Diff2 = abs(Y_s2 - Y_f2);
Posterior_Diff2(isnan(Posterior_Diff2))=0;
Sus_Risk_Score2 = trapz(X_LIST2,Posterior_Diff2)

subplot(1,2,2)
plot(X_LIST2,Y_s2,'k-','LineWidth',2.5);
hold on
plot(X_LIST2,Y_f2,'k:','LineWidth',2.5);
        ProbDiff2 = area(X_LIST2, abs(Y_s2-Y_f2));
        ProbDiff2.FaceColor = [0.8 0.15 0.1];
        ProbDiff2.EdgeColor = [0.8 0.15 0.1];
        ProbDiff2.FaceAlpha = 0.38;
        ProbDiff2.EdgeAlpha = 0.38;
        ProbDiff2.LineWidth = 1;
ax = gca;
ax.FontSize = 15;
xlabel('High risk input', 'interpreter', 'latex', 'FontSize', 15)
ylabel('Density', 'interpreter', 'latex', 'FontSize', 15)
annotation('textarrow',[0.825, 0.805], [0.6, 0.49], 'interpreter', 'latex', 'FontSize', 15, 'String', '$$RS_{j} = 0.82$$')
legend(['$P(x_{j}|L_{s})$'], ['$P(x_{j}|L_{f})$'], ['$|P(x_{j}|L_{s}) - P(x_{j}|L_{f})|$'], 'FontUnits', 'points', 'interpreter', 'latex', 'FontSize', 15, 'FontName', 'Times', 'Location', 'NorthEast', 'box', 'off')
hold off
saveas(gcf, ['Test_Large_Diff', '.png'])