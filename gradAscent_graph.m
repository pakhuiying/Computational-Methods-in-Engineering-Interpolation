function gradAscent_graph(lower_range,upper_range,cache,func)
%plot surface graph
%cache is the intermediate values that stores the step of golden section
%method
figure;
[X,Y] = meshgrid(lower_range:0.5:upper_range);
Z = func(X,Y);
surf(X,Y,Z,'FaceAlpha',0.5)
xlabel('x')
ylabel('y')
hold on;
plot3(cache(:,1),cache(:,2),cache(:,3), 'ko', 'MarkerSize',12)
hold on;
plot3(cache(end,1),cache(end,2),cache(end,3), 'rx','MarkerSize',20)
txt = ['optima:',num2str(cache(end,1),3),',',num2str(cache(end,2),3),',',num2str(cache(end,3),3)];
text(cache(end,1),cache(end,2),cache(end,3),txt,'FontSize',10)
legend({'surface','step','optima'},'Location','northeastoutside')
hold off;
end

